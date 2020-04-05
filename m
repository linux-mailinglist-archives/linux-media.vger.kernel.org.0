Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B7D19ECCF
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbgDERQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:16:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDERQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:16:12 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19732312;
        Sun,  5 Apr 2020 19:16:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586106970;
        bh=3WAHnfzSHviJE3uCPhrxKZCGi2SrYqP3kwy7gNZ6s1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y2cbYXr78zKOxbwoqaE8hDgAJbC7e1flwLFZDkojN30kE7CBqXXGPiftB27XETU40
         dMmV7z/Md68zsyTW5rQE7KfgqlMwo9U991WZYFqr5Wh/3LeB4wONzn8eA5LOHZoGaT
         OuBeIl+XxSf/HtRcS5oOUtAGO3lPJWB+WGU7sYik=
Date:   Sun, 5 Apr 2020 20:16:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v6 08/11] media: imx: utils: Split find|enum_format into
 fourcc and mbus functions
Message-ID: <20200405171601.GE5846@pendragon.ideasonboard.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
 <20200404224130.23118-9-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200404224130.23118-9-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Sat, Apr 04, 2020 at 03:41:27PM -0700, Steve Longerbeam wrote:
> To make the code easier to follow, split up find_format() into separate
> search functions for pixel formats and media-bus codes, and inline
> find_format() into the exported functions imx_media_find_format()
> and imx_media_find_mbus_format().
> 
> Do the equivalent for enum_format().
> 
> Also add comment blocks for the exported find|enum functions.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-utils.c | 148 +++++++++++++-------
>  1 file changed, 100 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index bd8ebbf0b26d..a18d826996d1 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -199,10 +199,15 @@ static const struct imx_media_pixfmt pixel_formats[] = {
>  	},
>  };
>  
> -static const struct imx_media_pixfmt *find_format(u32 fourcc,
> -						  u32 code,
> -						  enum imx_pixfmt_sel fmt_sel,
> -						  bool allow_non_mbus)
> +/*
> + * Search for and return an entry in the pixel_formats[] array that matches
> + * the requested selection criteria.

To differentiate this from the next function, I would write

 * Search in the pixel_formats[] array for an entry with the given fourcc that
 * matches the requested selection criteria and return it.

> + *
> + * @fourcc: Search for an entry with the given fourcc pixel format.
> + * @fmt_sel: Allow entries only with the given selection criteria.
> + */
> +const struct imx_media_pixfmt *
> +imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
>  {
>  	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
>  	unsigned int i;
> @@ -212,7 +217,6 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
>  	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
>  		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
>  		enum imx_pixfmt_sel sel;
> -		unsigned int j;
>  
>  		if (sel_ipu != fmt->ipufmt)
>  			continue;
> @@ -221,14 +225,42 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
>  			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
>  			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
>  
> -		if (!(fmt_sel & sel) ||
> -		    (!allow_non_mbus && !fmt->codes))
> +		if ((fmt_sel & sel) && fmt->fourcc == fourcc)
> +			return fmt;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(imx_media_find_format);
> +
> +/*
> + * Search for and return an entry in the pixel_formats[] array that matches
> + * the requested selection criteria.

And here

 * Search in the pixel_formats[] array for an entry with the given media bus
 * code that matches the requested selection criteria and return it.

> + *
> + * @code: Search for an entry with the given media-bus code.
> + * @fmt_sel: Allow entries only with the given selection criteria.
> + */
> +const struct imx_media_pixfmt *
> +imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
> +{
> +	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
> +	unsigned int i;
> +
> +	fmt_sel &= ~PIXFMT_SEL_IPU;
> +
> +	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
> +		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
> +		enum imx_pixfmt_sel sel;
> +		unsigned int j;
> +
> +		if (sel_ipu != fmt->ipufmt)
>  			continue;
>  
> -		if (fourcc && fmt->fourcc == fourcc)
> -			return fmt;
> +		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
> +			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
> +			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
>  
> -		if (!code || !fmt->codes)
> +		if (!(fmt_sel & sel) || !fmt->codes)
>  			continue;
>  
>  		for (j = 0; fmt->codes[j]; j++) {
> @@ -239,10 +271,21 @@ static const struct imx_media_pixfmt *find_format(u32 fourcc,
>  
>  	return NULL;
>  }
> +EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
>  
> -static int enum_format(u32 *fourcc, u32 *code, u32 index,
> -		       enum imx_pixfmt_sel fmt_sel,
> -		       bool allow_non_mbus)
> +/*
> + * Enumerate entries in the pixel_formats[] array that match the
> + * requested selection criteria. Returns the fourcc that matches the

s/Returns/Return/

> + * selection criteria at the requested match index.
> + *
> + * @fourcc: The returned fourcc that matches the search criteria at
> + *          the requested match index.
> + * @index: The requested match index.
> + * @fmt_sel: Include in the enumeration entries with the given selection
> + *           criteria.
> + */
> +int imx_media_enum_format(u32 *fourcc, u32 index,
> +			  enum imx_pixfmt_sel fmt_sel)
>  {
>  	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
>  	unsigned int i;
> @@ -252,7 +295,6 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
>  		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
>  		enum imx_pixfmt_sel sel;
> -		unsigned int j;
>  
>  		if (sel_ipu != fmt->ipufmt)
>  			continue;
> @@ -261,19 +303,54 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
>  			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
>  
> -		if (!(fmt_sel & sel) ||
> -		    (!allow_non_mbus && !fmt->codes))
> +		if (!(fmt_sel & sel))
>  			continue;
>  
> -		if (fourcc && index == 0) {
> +		if (index == 0) {
>  			*fourcc = fmt->fourcc;
>  			return 0;
>  		}
>  
> -		if (!code) {
> -			index--;
> +		index--;
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(imx_media_enum_format);
> +
> +/*
> + * Enumerate entries in the pixel_formats[] array that match the
> + * requested search criteria. Returns the media-bus code that matches

s/Returns/Return/

> + * the search criteria at the requested match index.
> + *
> + * @code: The returned media-bus code that matches the search criteria at
> + *        the requested match index.
> + * @index: The requested match index.
> + * @fmt_sel: Include in the enumeration entries with the given selection
> + *           criteria.
> + */
> +int imx_media_enum_mbus_format(u32 *code, u32 index,
> +			       enum imx_pixfmt_sel fmt_sel)
> +{
> +	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
> +	unsigned int i;
> +
> +	fmt_sel &= ~PIXFMT_SEL_IPU;
> +
> +	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
> +		const struct imx_media_pixfmt *fmt = &pixel_formats[i];
> +		enum imx_pixfmt_sel sel;
> +		unsigned int j;
> +
> +		if (sel_ipu != fmt->ipufmt)
> +			continue;
> +
> +		sel = fmt->bayer ? PIXFMT_SEL_BAYER :
> +			((fmt->cs == IPUV3_COLORSPACE_YUV) ?
> +			 PIXFMT_SEL_YUV : PIXFMT_SEL_RGB);
> +
> +		if (!(fmt_sel & sel) || !fmt->codes)
>  			continue;
> -		}
>  
>  		for (j = 0; fmt->codes[j]; j++) {
>  			if (index == 0) {
> @@ -287,45 +364,20 @@ static int enum_format(u32 *fourcc, u32 *code, u32 index,
>  
>  	return -EINVAL;
>  }
> -
> -const struct imx_media_pixfmt *
> -imx_media_find_format(u32 fourcc, enum imx_pixfmt_sel fmt_sel)
> -{
> -	return find_format(fourcc, 0, fmt_sel, true);
> -}
> -EXPORT_SYMBOL_GPL(imx_media_find_format);
> -
> -int imx_media_enum_format(u32 *fourcc, u32 index, enum imx_pixfmt_sel fmt_sel)
> -{
> -	return enum_format(fourcc, NULL, index, fmt_sel, true);
> -}
> -EXPORT_SYMBOL_GPL(imx_media_enum_format);
> -
> -const struct imx_media_pixfmt *
> -imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel fmt_sel)
> -{
> -	return find_format(0, code, fmt_sel, false);
> -}
> -EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
> -
> -int imx_media_enum_mbus_format(u32 *code, u32 index,
> -			       enum imx_pixfmt_sel fmt_sel)
> -{
> -	return enum_format(NULL, code, index, fmt_sel, false);
> -}
>  EXPORT_SYMBOL_GPL(imx_media_enum_mbus_format);
>  
>  const struct imx_media_pixfmt *
>  imx_media_find_ipu_format(u32 code, enum imx_pixfmt_sel fmt_sel)
>  {
> -	return find_format(0, code, fmt_sel | PIXFMT_SEL_IPU, false);
> +	return imx_media_find_mbus_format(code, fmt_sel | PIXFMT_SEL_IPU);
>  }
>  EXPORT_SYMBOL_GPL(imx_media_find_ipu_format);
>  
>  int imx_media_enum_ipu_format(u32 *code, u32 index,
>  			      enum imx_pixfmt_sel fmt_sel)
>  {
> -	return enum_format(NULL, code, index, fmt_sel | PIXFMT_SEL_IPU, false);
> +	return imx_media_enum_mbus_format(code, index,
> +					  fmt_sel | PIXFMT_SEL_IPU);
>  }
>  EXPORT_SYMBOL_GPL(imx_media_enum_ipu_format);

You could turn those two functions into static inlines in imx-media.h.
Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
