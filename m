Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB2C55601B6
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 15:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbiF2Nux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 09:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiF2Nuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 09:50:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D18E18E34
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 06:50:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1573B61E87
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 13:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CA6C34114;
        Wed, 29 Jun 2022 13:50:49 +0000 (UTC)
Message-ID: <1d76d6bf-7809-edca-0d1a-9ab84e0c15ea@xs4all.nl>
Date:   Wed, 29 Jun 2022 15:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] media: v4l2: Make colorspace validity checks more
 future-proof
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-5-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220616183656.19089-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2022 20:36, Laurent Pinchart wrote:
> The helper functions that test validity of colorspace-related fields
> use the last value of the corresponding enums. This isn't very
> future-proof, as there's a high chance someone adding a new value may
> forget to update the helpers. Add new "LAST" entries to the enumerations
> to improve this, and keep them private to the kernel.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Changes since v1:
> 
> - Let the compiler assign a value to the *_LAST enum entries
> ---
>  include/media/v4l2-common.h    | 10 +++++-----
>  include/uapi/linux/videodev2.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 3eb202259e8c..ccc138a9104d 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -563,19 +563,19 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>  static inline bool v4l2_is_colorspace_valid(__u32 colorspace)
>  {
>  	return colorspace > V4L2_COLORSPACE_DEFAULT &&
> -	       colorspace <= V4L2_COLORSPACE_DCI_P3;
> +	       colorspace < V4L2_COLORSPACE_LAST;
>  }
>  
>  static inline bool v4l2_is_xfer_func_valid(__u32 xfer_func)
>  {
>  	return xfer_func > V4L2_XFER_FUNC_DEFAULT &&
> -	       xfer_func <= V4L2_XFER_FUNC_SMPTE2084;
> +	       xfer_func < V4L2_XFER_FUNC_LAST;
>  }
>  
>  static inline bool v4l2_is_ycbcr_enc_valid(__u8 ycbcr_enc)
>  {
>  	return ycbcr_enc > V4L2_YCBCR_ENC_DEFAULT &&
> -	       ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M;
> +	       ycbcr_enc < V4L2_YCBCR_ENC_LAST;
>  }
>  
>  static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
> @@ -585,8 +585,8 @@ static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
>  
>  static inline bool v4l2_is_quant_valid(__u8 quantization)
>  {
> -	return quantization == V4L2_QUANTIZATION_FULL_RANGE ||
> -	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
> +	return quantization > V4L2_QUANTIZATION_DEFAULT &&
> +	       quantization < V4L2_QUANTIZATION_LAST;

There are only two quantization ranges: full and limited. And I very sincerely
hope there will never be a third!

So I would keep this as-is and drop the V4L2_QUANTIZATION_LAST.

Otherwise I like this. So with that change:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

>  }
>  
>  #endif /* V4L2_COMMON_H_ */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index f6f9a690971e..7b7d852dc74b 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -245,6 +245,14 @@ enum v4l2_colorspace {
>  
>  	/* DCI-P3 colorspace, used by cinema projectors */
>  	V4L2_COLORSPACE_DCI_P3        = 12,
> +
> +#ifdef __KERNEL__
> +	/*
> +	 * Largest supported colorspace value, assigned by the compiler, used
> +	 * by the framework to check for invalid values.
> +	 */
> +	V4L2_COLORSPACE_LAST,
> +#endif
>  };
>  
>  /*
> @@ -283,6 +291,13 @@ enum v4l2_xfer_func {
>  	V4L2_XFER_FUNC_NONE        = 5,
>  	V4L2_XFER_FUNC_DCI_P3      = 6,
>  	V4L2_XFER_FUNC_SMPTE2084   = 7,
> +#ifdef __KERNEL__
> +	/*
> +	 * Largest supported transfer function value, assigned by the compiler,
> +	 * used by the framework to check for invalid values.
> +	 */
> +	V4L2_XFER_FUNC_LAST,
> +#endif
>  };
>  
>  /*
> @@ -343,6 +358,13 @@ enum v4l2_ycbcr_encoding {
>  
>  	/* SMPTE 240M -- Obsolete HDTV */
>  	V4L2_YCBCR_ENC_SMPTE240M      = 8,
> +#ifdef __KERNEL__
> +	/*
> +	 * Largest supported encoding value, assigned by the compiler, used by
> +	 * the framework to check for invalid values.
> +	 */
> +	V4L2_YCBCR_ENC_LAST,
> +#endif
>  };
>  
>  /*
> @@ -378,6 +400,13 @@ enum v4l2_quantization {
>  	V4L2_QUANTIZATION_DEFAULT     = 0,
>  	V4L2_QUANTIZATION_FULL_RANGE  = 1,
>  	V4L2_QUANTIZATION_LIM_RANGE   = 2,
> +#ifdef __KERNEL__
> +	/*
> +	 * Largest supported quantization value, assigned by the compiler, used
> +	 * by the framework to check for invalid values.
> +	 */
> +	V4L2_QUANTIZATION_LAST,
> +#endif
>  };
>  
>  /*

