Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29F814DCABD
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 17:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbiCQQHm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 12:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiCQQHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 12:07:42 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C32214075
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 09:06:24 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B8BAA1B002BF;
        Thu, 17 Mar 2022 18:06:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1647533181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ikz5uwkIG1b0k+LuAINxGxkBzaXBQaOzKnV9drWaack=;
        b=ckYnJ9EGGvj1dR67Xu9ZXwQxSqA/r2xi0nhZFi0JGFcAGEY5bkd2Hp1MyCrr21n87nO8PJ
        ztdGP7+vQNIgmqfiVh/KWlAlmzngi70HVDmak//6HzKH/7i6+vU5G1vuoTY0gry9fVqUyF
        RYuJqlqdxhQFk2wUJYQlky/Gd30bgpK1KttKuuSSEVXlNajnqfYU4oIsETV/m4Q5gpj+Np
        sRGsHPAhV5k7UXl4M5NQszOzLuPUm62b5MjJhVnTILkRP8qrAOUFIqYpIpE4qO+bwNSgKE
        R5XHQ4FmxHIgy3V+/lfsZwV8YDgAMAU46bSINDNicgXGhhfiCJSa/u83UOrGCQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6B130634C90;
        Thu, 17 Mar 2022 18:06:21 +0200 (EET)
Date:   Thu, 17 Mar 2022 18:06:21 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 1/2] media: v4l2: Make colorspace validity checks more
 future-proof
Message-ID: <YjNcfeVbSTLXwwwp@valkosipuli.retiisi.eu>
References: <20220317143700.12769-1-laurent.pinchart@ideasonboard.com>
 <20220317143700.12769-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317143700.12769-2-laurent.pinchart@ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1647533181; a=rsa-sha256;
        cv=none;
        b=W5ExHG/RQXHQ09yc7S2zugq0Qza5VYzd5V6V+5ArdxynLi9TCTO/Q5dsFsXE/tlj+DMxOQ
        sbPen8miCWZ2pPa9yAM1cBsXIA1J9AqGUdTm3nrsahZp6010AtD599SOG7J5mssI/aE5nz
        730xja4wKheTPyvmWDy014FxEWub8kXL65Og4Q2rZvF74PsbSfDr2tCHSJYxE397wm96NI
        /xvYPKKDkPSH5d31ZN4TcWyKGPp3mPsvkXebP4pCIMBg7CiAldsXIIzEUj7q1NwpIqlsnj
        VV/jxqwfGQyBZrJRUF21oDgvRKb0Q3vB/dmLRopBAScHouWtLa3cxGtTKsvSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1647533181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ikz5uwkIG1b0k+LuAINxGxkBzaXBQaOzKnV9drWaack=;
        b=Do/cZUDRoWyiI3PRvWK4ZaPsdPsFd2Chjhc2GVRuUFm147N+jWBgOk4pcBzo6zuxNO0A98
        KXbykoupoihQmOLorHIAGFDWuhtEcZF/4HPSAvebJZFkH5FRK3cXFYFUYG2GBTUS0N6WYB
        sZBUwmS6q8K8/10s9ZR56lHODxYJN2z32wffwK9HMndujx+zIE8zu7eBmKdDQWwL4HPQ8t
        y6ibaenFu9RB8rnok4zGHlempQTkfrtxSe58BF6yMHzjJ55NRajWePaCDH5kYababJOzrt
        7aVbr8RAWEgioXZwnRhYHXtTDxdTxEyYIgnXo3Dq8amjUMUOpwCqLzl/cMZGMA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Mar 17, 2022 at 04:36:59PM +0200, Laurent Pinchart wrote:
> The helper functions that test validity of colorspace-related fields
> use the last value of the corresponding enums. This isn't very
> future-proof, as there's a high chance someone adding a new value may
> forget to update the helpers. Add new "LAST" entries to the enumerations
> to improve this, and keep them private to the kernel.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/media/v4l2-common.h    | 10 +++++-----
>  include/uapi/linux/videodev2.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 3eb202259e8c..b686124e2ccf 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -563,19 +563,19 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
>  static inline bool v4l2_is_colorspace_valid(__u32 colorspace)
>  {
>  	return colorspace > V4L2_COLORSPACE_DEFAULT &&
> -	       colorspace <= V4L2_COLORSPACE_DCI_P3;
> +	       colorspace <= V4L2_COLORSPACE_LAST;
>  }
>  
>  static inline bool v4l2_is_xfer_func_valid(__u32 xfer_func)
>  {
>  	return xfer_func > V4L2_XFER_FUNC_DEFAULT &&
> -	       xfer_func <= V4L2_XFER_FUNC_SMPTE2084;
> +	       xfer_func <= V4L2_XFER_FUNC_LAST;
>  }
>  
>  static inline bool v4l2_is_ycbcr_enc_valid(__u8 ycbcr_enc)
>  {
>  	return ycbcr_enc > V4L2_YCBCR_ENC_DEFAULT &&
> -	       ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M;
> +	       ycbcr_enc <= V4L2_YCBCR_ENC_LAST;
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
> +	       quantization <= V4L2_QUANTIZATION_LAST;
>  }
>  
>  #endif /* V4L2_COMMON_H_ */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 16dcd9dd1a50..099da1576db6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -245,6 +245,14 @@ enum v4l2_colorspace {
>  
>  	/* DCI-P3 colorspace, used by cinema projectors */
>  	V4L2_COLORSPACE_DCI_P3        = 12,
> +
> +#ifdef __KERNEL__
> +	/*
> +	 * Largest supported colorspace value, used by the framework to check
> +	 * for invalid values.
> +	 */
> +	V4L2_COLORSPACE_LAST          = 12,

I might just add the enum there, it is more obvious it needs updating if
it's right next to the previous one. Or rely on the compiler assigning the
value, and update the code. Up to you.

For both:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

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
> +	 * Largest supported transfer function value, used by the framework to
> +	 * check for invalid values.
> +	 */
> +	V4L2_XFER_FUNC_LAST        = 7,
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
> +	 * Largest supported encoding value, used by the framework to check for
> +	 * invalid values.
> +	 */
> +	V4L2_YCBCR_ENC_LAST           = 8,
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
> +	 * Largest supported quantization value, used by the framework to check
> +	 * for invalid values.
> +	 */
> +	V4L2_QUANTIZATION_LAST        = 2,
> +#endif
>  };
>  
>  /*

-- 
Regards,

Sakari Ailus
