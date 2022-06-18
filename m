Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D7355076F
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbiFRXRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiFRXRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:17:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A604DFE8
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 16:17:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D26FD993;
        Sun, 19 Jun 2022 01:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655594231;
        bh=J5DRvFaekpYr7aicNhHMddNTT4ImbO9QpgmzkdIs2RM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HuW7mPb3p33LDroApTaSA8/dkkJS37i29J3FbQvTQKu+1jF/qSG1Kiy2z1UTrE+O/
         0oiTOkupJOwta2IYnGR7dYzL08pnBWTB3M1u7u2CsdK8/GQ2SwH2ecSkajSCh9Ylpt
         bfhiVyjCVCRwE4lnFlthz2RGzky8+aLoz9z5vOcs=
Date:   Sun, 19 Jun 2022 02:16:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: stm32: dcmi: Switch to __v4l2_subdev_state_alloc()
Message-ID: <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
References: <20220618222442.478285-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220618222442.478285-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

CC'ing Tomi to get his opinion.

On Sun, Jun 19, 2022 at 12:24:42AM +0200, Marek Vasut wrote:
> Any local subdev state should be allocated and free'd using
> __v4l2_subdev_state_alloc()/__v4l2_subdev_state_free(), which
> takes care of calling .init_cfg() subdev op. Without this,
> subdev internal state might be uninitialized by the time
> any other subdev op is called.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/media/platform/st/stm32/stm32-dcmi.c | 51 +++++++++++---------
>  1 file changed, 29 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index ec54b5ecfd544..ef795c12fb233 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -996,22 +996,26 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  			struct dcmi_framesize *sd_framesize)
>  {
>  	const struct dcmi_format *sd_fmt;
> +	static struct lock_class_key key;
>  	struct dcmi_framesize sd_fsize;
>  	struct v4l2_pix_format *pix = &f->fmt.pix;
> -	struct v4l2_subdev_pad_config pad_cfg;
> -	struct v4l2_subdev_state pad_state = {
> -		.pads = &pad_cfg
> -		};
> +	struct v4l2_subdev_state *sd_state;
>  	struct v4l2_subdev_format format = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  	};
>  	bool do_crop;
>  	int ret;
>  
> +	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
> +	if (IS_ERR(sd_state))
> +		return PTR_ERR(sd_state);
> +
>  	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
>  	if (!sd_fmt) {
> -		if (!dcmi->num_of_sd_formats)
> -			return -ENODATA;
> +		if (!dcmi->num_of_sd_formats) {
> +			ret = -ENODATA;
> +			goto done;
> +		}
>  
>  		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
>  		pix->pixelformat = sd_fmt->fourcc;
> @@ -1036,10 +1040,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  	}
>  
>  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
> -	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
> -			       &pad_state, &format);
> +	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
>  	if (ret < 0)
> -		return ret;
> +		goto done;
>  
>  	/* Update pix regarding to what sensor can do */
>  	v4l2_fill_pix_format(pix, &format.format);
> @@ -1079,7 +1082,9 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>  	if (sd_framesize)
>  		*sd_framesize = sd_fsize;
>  
> -	return 0;
> +done:
> +	__v4l2_subdev_state_free(sd_state);
> +	return ret;
>  }
>  
>  static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
> @@ -1183,31 +1188,33 @@ static int dcmi_set_sensor_format(struct stm32_dcmi *dcmi,
>  				  struct v4l2_pix_format *pix)
>  {
>  	const struct dcmi_format *sd_fmt;
> +	static struct lock_class_key key;
> +	struct v4l2_subdev_state *sd_state;
>  	struct v4l2_subdev_format format = {
>  		.which = V4L2_SUBDEV_FORMAT_TRY,
>  	};
> -	struct v4l2_subdev_pad_config pad_cfg;
> -	struct v4l2_subdev_state pad_state = {
> -		.pads = &pad_cfg
> -		};
>  	int ret;
>  
> +	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
> +	if (IS_ERR(sd_state))
> +		return PTR_ERR(sd_state);
> +
>  	sd_fmt = find_format_by_fourcc(dcmi, pix->pixelformat);
>  	if (!sd_fmt) {
> -		if (!dcmi->num_of_sd_formats)
> -			return -ENODATA;
> +		if (!dcmi->num_of_sd_formats) {
> +			ret = -ENODATA;
> +			goto done;
> +		}
>  
>  		sd_fmt = dcmi->sd_formats[dcmi->num_of_sd_formats - 1];
>  		pix->pixelformat = sd_fmt->fourcc;
>  	}
>  
>  	v4l2_fill_mbus_format(&format.format, pix, sd_fmt->mbus_code);
> -	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt,
> -			       &pad_state, &format);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 0;
> +	ret = v4l2_subdev_call(dcmi->source, pad, set_fmt, sd_state, &format);
> +done:
> +	__v4l2_subdev_state_free(sd_state);
> +	return ret;
>  }
>  
>  static int dcmi_get_sensor_bounds(struct stm32_dcmi *dcmi,

-- 
Regards,

Laurent Pinchart
