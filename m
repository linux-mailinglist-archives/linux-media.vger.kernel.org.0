Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA37735C3B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 14:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfFEMDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 08:03:33 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:45949 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726305AbfFEMDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 08:03:32 -0400
Received: from [IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9] ([IPv6:2001:420:44c1:2579:c806:4d76:5b3c:eea9])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YUdahlLxG3qlsYUddhfn01; Wed, 05 Jun 2019 14:03:30 +0200
Subject: Re: [PATCH 3/5] media: mtk-vcodec: remove unneeded proxy functions
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20190604093737.172599-1-acourbot@chromium.org>
 <20190604093737.172599-4-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c86d2409-b3f0-b20e-f371-50338f7199d8@xs4all.nl>
Date:   Wed, 5 Jun 2019 14:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190604093737.172599-4-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKpG5YTmPrv9ECx9caWZmPw9wkF0O/93RuPnuOaSU66y2ZAoV9ShsUwPVF9kfGZTQgDYjiL4ukeiLhetjqbgu8qna2enbKFUhjePWLcpE9pRmktaDyn4
 eft3zXM5crqve0NuecMlrhRKZ/+KtE7sdwyFL7Iz/JeOSWwJtPPYnpv/qUP2ELySMXV1wmOjUPeXErPSoPoV7DrRFfrAWTIQ3TLQk2ggx6Qm/22acgF2mK/k
 97hf0Q+WlQgpVhUbjfkHPv5PTtUZJ4ZINQBDlusRXfvj1M7Y5YLojmyNU+yr9wHtcCz1PavCt2dFA6E34YGcQmYELfHRWB0GgHZ63ZrsQSwsk3qNF2eNWOgY
 gSi5auLPBbMOPp32s33upW7yibZ+qNjtxrpYLNnmTA/sUUVDPR+4+xQg63qjgObwPy0z5aRKK0pkv/9IMRXoA9569KeqMzsWqSOa3qG6bM3ZvUZSxOO0FPxd
 I1JeYD+poEknkgxJMGbAHtq5pYz0Eec4EPfvCy2n1ndeQm0awrhL9GRJIV+/Gasq+z4e6rCkd/0kq7qWhLeT9nY4OU2uk+BLjPV9Qg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/4/19 11:37 AM, Alexandre Courbot wrote:
> We were getting the codec interface through a proxy function that does
> not bring anything compared to just accessing the interface definition
> directly, so just do that. Also make the decoder interfaces const.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c    |  9 +--------
>  drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c |  9 +--------
>  drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c |  9 +--------
>  drivers/media/platform/mtk-vcodec/vdec_drv_if.c      | 12 ++++++------
>  .../media/platform/mtk-vcodec/venc/venc_h264_if.c    |  9 +--------
>  drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c |  9 +--------
>  drivers/media/platform/mtk-vcodec/venc_drv_if.c      |  8 ++++----
>  7 files changed, 15 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> index 0c0660d2560b..85afdd6ab093 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
> @@ -481,16 +481,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
>  	return 0;
>  }
>  
> -static struct vdec_common_if vdec_h264_if = {
> +const struct vdec_common_if vdec_h264_if = {
>  	.init		= vdec_h264_init,
>  	.decode		= vdec_h264_decode,
>  	.get_param	= vdec_h264_get_param,
>  	.deinit		= vdec_h264_deinit,
>  };
> -
> -struct vdec_common_if *get_h264_dec_comm_if(void);
> -
> -struct vdec_common_if *get_h264_dec_comm_if(void)
> -{
> -	return &vdec_h264_if;
> -}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> index 1e3763881e0d..a8ca762eac76 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
> @@ -605,16 +605,9 @@ static void vdec_vp8_deinit(void *h_vdec)
>  	kfree(inst);
>  }
>  
> -static struct vdec_common_if vdec_vp8_if = {
> +const struct vdec_common_if vdec_vp8_if = {
>  	.init		= vdec_vp8_init,
>  	.decode		= vdec_vp8_decode,
>  	.get_param	= vdec_vp8_get_param,
>  	.deinit		= vdec_vp8_deinit,
>  };
> -
> -struct vdec_common_if *get_vp8_dec_comm_if(void);
> -
> -struct vdec_common_if *get_vp8_dec_comm_if(void)
> -{
> -	return &vdec_vp8_if;
> -}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> index 589b2fc91da2..1f99febdfbbe 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> @@ -994,16 +994,9 @@ static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
>  	return ret;
>  }
>  
> -static struct vdec_common_if vdec_vp9_if = {
> +const struct vdec_common_if vdec_vp9_if = {
>  	.init		= vdec_vp9_init,
>  	.decode		= vdec_vp9_decode,
>  	.get_param	= vdec_vp9_get_param,
>  	.deinit		= vdec_vp9_deinit,
>  };
> -
> -struct vdec_common_if *get_vp9_dec_comm_if(void);
> -
> -struct vdec_common_if *get_vp9_dec_comm_if(void)
> -{
> -	return &vdec_vp9_if;
> -}
> diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> index 5d8d76d55005..aa614eea3cc5 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
> @@ -10,9 +10,9 @@
>  #include "mtk_vcodec_dec_pm.h"
>  #include "mtk_vpu.h"
>  
> -const struct vdec_common_if *get_h264_dec_comm_if(void);
> -const struct vdec_common_if *get_vp8_dec_comm_if(void);
> -const struct vdec_common_if *get_vp9_dec_comm_if(void);
> +extern const struct vdec_common_if vdec_h264_if;
> +extern const struct vdec_common_if vdec_vp8_if;
> +extern const struct vdec_common_if vdec_vp9_if;
>  
>  int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  {
> @@ -20,13 +20,13 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  
>  	switch (fourcc) {
>  	case V4L2_PIX_FMT_H264:
> -		ctx->dec_if = get_h264_dec_comm_if();
> +		ctx->dec_if = &vdec_h264_if;
>  		break;
>  	case V4L2_PIX_FMT_VP8:
> -		ctx->dec_if = get_vp8_dec_comm_if();
> +		ctx->dec_if = &vdec_vp8_if;
>  		break;
>  	case V4L2_PIX_FMT_VP9:
> -		ctx->dec_if = get_vp9_dec_comm_if();
> +		ctx->dec_if = &vdec_vp9_if;
>  		break;
>  	default:
>  		return -EINVAL;
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> index bfe61d5dc1cb..4e1d933395cd 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
> @@ -649,16 +649,9 @@ static int h264_enc_deinit(void *handle)
>  	return ret;
>  }
>  
> -static const struct venc_common_if venc_h264_if = {
> +const struct venc_common_if venc_h264_if = {
>  	.init = h264_enc_init,
>  	.encode = h264_enc_encode,
>  	.set_param = h264_enc_set_param,
>  	.deinit = h264_enc_deinit,
>  };
> -
> -const struct venc_common_if *get_h264_enc_comm_if(void);
> -
> -const struct venc_common_if *get_h264_enc_comm_if(void)
> -{
> -	return &venc_h264_if;
> -}
> diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> index af23367cf1dd..2d1372ab6486 100644
> --- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
> @@ -455,16 +455,9 @@ static int vp8_enc_deinit(void *handle)
>  	return ret;
>  }
>  
> -static const struct venc_common_if venc_vp8_if = {
> +const struct venc_common_if venc_vp8_if = {
>  	.init = vp8_enc_init,
>  	.encode = vp8_enc_encode,
>  	.set_param = vp8_enc_set_param,
>  	.deinit = vp8_enc_deinit,
>  };
> -
> -const struct venc_common_if *get_vp8_enc_comm_if(void);
> -
> -const struct venc_common_if *get_vp8_enc_comm_if(void)
> -{
> -	return &venc_vp8_if;
> -}
> diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> index 318af1b4b6e7..cf5bfa296d20 100644
> --- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> +++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
> @@ -11,8 +11,8 @@
>  #include "mtk_vcodec_enc_pm.h"
>  #include "mtk_vpu.h"
>  
> -const struct venc_common_if *get_h264_enc_comm_if(void);
> -const struct venc_common_if *get_vp8_enc_comm_if(void);
> +extern const struct venc_common_if venc_h264_if;
> +extern const struct venc_common_if venc_vp8_if;

This should be moved to a header. checkpatch gives me:

Applying: media: mtk-vcodec: remove unneeded proxy functions
WARNING: externs should be avoided in .c files
#79: FILE: drivers/media/platform/mtk-vcodec/vdec_drv_if.c:14:
+extern const struct vdec_common_if vdec_vp8_if;

WARNING: externs should be avoided in .c files
#80: FILE: drivers/media/platform/mtk-vcodec/vdec_drv_if.c:15:
+extern const struct vdec_common_if vdec_vp9_if;

WARNING: externs should be avoided in .c files
#156: FILE: drivers/media/platform/mtk-vcodec/venc_drv_if.c:15:
+extern const struct venc_common_if venc_vp8_if;

And I agree with checkpatch here.

I'll drop this patch from the series, but I'll take the others.

Regards,

	Hans

>  
>  int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  {
> @@ -20,10 +20,10 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
>  
>  	switch (fourcc) {
>  	case V4L2_PIX_FMT_VP8:
> -		ctx->enc_if = get_vp8_enc_comm_if();
> +		ctx->enc_if = &venc_vp8_if;
>  		break;
>  	case V4L2_PIX_FMT_H264:
> -		ctx->enc_if = get_h264_enc_comm_if();
> +		ctx->enc_if = &venc_h264_if;
>  		break;
>  	default:
>  		return -EINVAL;
> 

