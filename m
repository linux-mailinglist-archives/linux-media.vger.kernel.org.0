Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1440A2B18F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 11:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfE0Jrl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 05:47:41 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52087 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726645AbfE0Jrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 05:47:40 -0400
Received: from [IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52] ([IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VCEAha2NzsDWyVCEBhYUTM; Mon, 27 May 2019 11:47:38 +0200
Subject: Re: [PATCH v8 5/5] media: imx: Try colorimetry at both sink and
 source pads
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190522010317.23710-1-slongerbeam@gmail.com>
 <20190522010317.23710-6-slongerbeam@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <78f0d85d-b960-28ff-c1a9-469b704335c7@xs4all.nl>
Date:   Mon, 27 May 2019 11:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522010317.23710-6-slongerbeam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG9nmx6lla6s3vb2uLV1lrvWTynLRoPKrPBz0QCUKl9RtaB2UVn7bA4ucrTDUW0M+b7nUFC6AkcNMaperQGh6a5GCCHBPWi4hqGqZ6ezRPioB7VyD7qP
 nMFC8RaiR506EUiKVDYBxW5ciKBNj8uDVk1nwreX3Ck7xfglAVHYdyNYyyaGiGNHqKK0g8Bsntqr+IwNkqsxUF4J9KpviKvgOjGxS9DjmSRdm7mwEFIc87D0
 ISlbbcoad7h26r6CVFScniqYROwigtR7rNxsaIxM+psut8z/fwSwlYXRp23a41HxXun8EslsYz+dKnpv5+Kb2a4RK4gYwZwDt0gwgY78IjywhMdQPN52PYXE
 FSmwpbkiSmNQI8NpfSRHwEhmTI6Y++BCbT61Oetx8r0J+HhWo/kxVxQ8REI3QC9bq0g97vm5hZP+3Ps+K0A9NOZX8bO1kvumVK7LnLG+SnCa4FLA7n79iv/c
 BundgPSJxtJZYHOhb0jViNP7tBxxJzUb+I8bPc/sRcbVJi925g1LhTqVtJPHeUUO2THxOyWa1tHlFfi2cdAn0bYAb0x9X0u4gJ47bqpZzVd6kHEexnemVpQG
 iTKBzb285MOFgKg2SOHyV4SWpLWKwhDUhQ7OCSY2iK4lhdDIBNGGSF2OrdgR/mEX1hciriOGkg2uuxIVhhI8fVY7PJ/o7iuDEYQ6CKSDHY3ZmsiYVdzY5KJO
 gRHx/jetp6Z1hpUR6XQ5ts/4qqI61sGp
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/22/19 3:03 AM, Steve Longerbeam wrote:
> Retask imx_media_fill_default_mbus_fields() to try colorimetry parameters,
> renaming it to to imx_media_try_colorimetry(), and call it at both sink and
> source pad try_fmt's. The unrelated check for uninitialized field value is
> moved out to appropriate places in each subdev try_fmt.
> 
> The IC now supports Rec.709 and BT.601 Y'CbCr encoding, and both limited
> and full range quantization for both YUV and RGB space, so allow those
> for pipelines that route through the IC.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

It's probably easiest to apply this whole series to the gpu subsystem.
You have my Acked-by for this media patch.

Regards,

	Hans

> ---
> Changes in v7:
> - squashed with "media: imx: Allow Rec.709 encoding for IC routes".
> - remove the RGB full-range quantization restriction for IC routes.
> ---
>  drivers/staging/media/imx/imx-ic-prp.c      |  6 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c |  8 +--
>  drivers/staging/media/imx/imx-media-csi.c   | 19 +++---
>  drivers/staging/media/imx/imx-media-utils.c | 73 ++++++++++-----------
>  drivers/staging/media/imx/imx-media-vdic.c  |  5 +-
>  drivers/staging/media/imx/imx-media.h       |  5 +-
>  drivers/staging/media/imx/imx7-media-csi.c  |  8 +--
>  7 files changed, 62 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
> index 10ffe00f1a54..f87fe0203720 100644
> --- a/drivers/staging/media/imx/imx-ic-prp.c
> +++ b/drivers/staging/media/imx/imx-ic-prp.c
> @@ -193,8 +193,8 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
>  			sdformat->format.code = cc->codes[0];
>  		}
>  
> -		imx_media_fill_default_mbus_fields(&sdformat->format, infmt,
> -						   true);
> +		if (sdformat->format.field == V4L2_FIELD_ANY)
> +			sdformat->format.field = V4L2_FIELD_NONE;
>  		break;
>  	case PRP_SRC_PAD_PRPENC:
>  	case PRP_SRC_PAD_PRPVF:
> @@ -203,6 +203,8 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
>  		break;
>  	}
>  
> +	imx_media_try_colorimetry(&sdformat->format, true);
> +
>  	fmt = __prp_get_fmt(priv, cfg, sdformat->pad, sdformat->which);
>  	*fmt = sdformat->format;
>  out:
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index e8b36a181ccc..f2fe3c11c70e 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -907,8 +907,6 @@ static void prp_try_fmt(struct prp_priv *priv,
>  		/* propagate colorimetry from sink */
>  		sdformat->format.colorspace = infmt->colorspace;
>  		sdformat->format.xfer_func = infmt->xfer_func;
> -		sdformat->format.quantization = infmt->quantization;
> -		sdformat->format.ycbcr_enc = infmt->ycbcr_enc;
>  	} else {
>  		v4l_bound_align_image(&sdformat->format.width,
>  				      MIN_W_SINK, MAX_W_SINK, W_ALIGN_SINK,
> @@ -916,9 +914,11 @@ static void prp_try_fmt(struct prp_priv *priv,
>  				      MIN_H_SINK, MAX_H_SINK, H_ALIGN_SINK,
>  				      S_ALIGN);
>  
> -		imx_media_fill_default_mbus_fields(&sdformat->format, infmt,
> -						   true);
> +		if (sdformat->format.field == V4L2_FIELD_ANY)
> +			sdformat->format.field = V4L2_FIELD_NONE;
>  	}
> +
> +	imx_media_try_colorimetry(&sdformat->format, true);
>  }
>  
>  static int prp_set_fmt(struct v4l2_subdev *sd,
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 1d248aca40a9..dce4addadff4 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1375,9 +1375,15 @@ static void csi_try_field(struct csi_priv *priv,
>  	struct v4l2_mbus_framefmt *infmt =
>  		__csi_get_fmt(priv, cfg, CSI_SINK_PAD, sdformat->which);
>  
> -	/* no restrictions on sink pad field type */
> -	if (sdformat->pad == CSI_SINK_PAD)
> +	/*
> +	 * no restrictions on sink pad field type except must
> +	 * be initialized.
> +	 */
> +	if (sdformat->pad == CSI_SINK_PAD) {
> +		if (sdformat->format.field == V4L2_FIELD_ANY)
> +			sdformat->format.field = V4L2_FIELD_NONE;
>  		return;
> +	}
>  
>  	switch (infmt->field) {
>  	case V4L2_FIELD_SEQ_TB:
> @@ -1455,8 +1461,6 @@ static void csi_try_fmt(struct csi_priv *priv,
>  		/* propagate colorimetry from sink */
>  		sdformat->format.colorspace = infmt->colorspace;
>  		sdformat->format.xfer_func = infmt->xfer_func;
> -		sdformat->format.quantization = infmt->quantization;
> -		sdformat->format.ycbcr_enc = infmt->ycbcr_enc;
>  
>  		break;
>  	case CSI_SINK_PAD:
> @@ -1476,10 +1480,6 @@ static void csi_try_fmt(struct csi_priv *priv,
>  
>  		csi_try_field(priv, cfg, sdformat);
>  
> -		imx_media_fill_default_mbus_fields(
> -			&sdformat->format, infmt,
> -			priv->active_output_pad == CSI_SRC_PAD_DIRECT);
> -
>  		/* Reset crop and compose rectangles */
>  		crop->left = 0;
>  		crop->top = 0;
> @@ -1495,6 +1495,9 @@ static void csi_try_fmt(struct csi_priv *priv,
>  
>  		break;
>  	}
> +
> +	imx_media_try_colorimetry(&sdformat->format,
> +			priv->active_output_pad == CSI_SRC_PAD_DIRECT);
>  }
>  
>  static int csi_set_fmt(struct v4l2_subdev *sd,
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index b41842dba5ec..05b63395084e 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -511,21 +511,18 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
>  EXPORT_SYMBOL_GPL(imx_media_init_cfg);
>  
>  /*
> - * Check whether the field and colorimetry parameters in tryfmt are
> - * uninitialized, and if so fill them with the values from fmt,
> - * or if tryfmt->colorspace has been initialized, all the default
> - * colorimetry params can be derived from tryfmt->colorspace.
> + * Default the colorspace in tryfmt to SRGB if set to an unsupported
> + * colorspace or not initialized. Then set the remaining colorimetry
> + * parameters based on the colorspace if they are uninitialized.
>   *
>   * tryfmt->code must be set on entry.
>   *
>   * If this format is destined to be routed through the Image Converter,
> - * quantization and Y`CbCr encoding must be fixed. The IC expects and
> - * produces fixed quantization and Y`CbCr encoding at its input and output
> - * (full range for RGB, limited range for YUV, and V4L2_YCBCR_ENC_601).
> + * Y`CbCr encoding must be fixed. The IC supports only BT.601 Y`CbCr
> + * or Rec.709 Y`CbCr encoding.
>   */
> -void imx_media_fill_default_mbus_fields(struct v4l2_mbus_framefmt *tryfmt,
> -					struct v4l2_mbus_framefmt *fmt,
> -					bool ic_route)
> +void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
> +			       bool ic_route)
>  {
>  	const struct imx_media_pixfmt *cc;
>  	bool is_rgb = false;
> @@ -533,44 +530,46 @@ void imx_media_fill_default_mbus_fields(struct v4l2_mbus_framefmt *tryfmt,
>  	cc = imx_media_find_mbus_format(tryfmt->code, CS_SEL_ANY, true);
>  	if (!cc)
>  		cc = imx_media_find_ipu_format(tryfmt->code, CS_SEL_ANY);
> -	if (cc && cc->cs != IPUV3_COLORSPACE_YUV)
> +	if (cc && cc->cs == IPUV3_COLORSPACE_RGB)
>  		is_rgb = true;
>  
> -	/* fill field if necessary */
> -	if (tryfmt->field == V4L2_FIELD_ANY)
> -		tryfmt->field = fmt->field;
> +	switch (tryfmt->colorspace) {
> +	case V4L2_COLORSPACE_SMPTE170M:
> +	case V4L2_COLORSPACE_REC709:
> +	case V4L2_COLORSPACE_JPEG:
> +	case V4L2_COLORSPACE_SRGB:
> +	case V4L2_COLORSPACE_BT2020:
> +	case V4L2_COLORSPACE_OPRGB:
> +	case V4L2_COLORSPACE_DCI_P3:
> +	case V4L2_COLORSPACE_RAW:
> +		break;
> +	default:
> +		tryfmt->colorspace = V4L2_COLORSPACE_SRGB;
> +		break;
> +	}
> +
> +	if (tryfmt->xfer_func == V4L2_XFER_FUNC_DEFAULT)
> +		tryfmt->xfer_func =
> +			V4L2_MAP_XFER_FUNC_DEFAULT(tryfmt->colorspace);
>  
> -	/* fill colorimetry if necessary */
> -	if (tryfmt->colorspace == V4L2_COLORSPACE_DEFAULT) {
> -		tryfmt->colorspace = fmt->colorspace;
> -		tryfmt->xfer_func = fmt->xfer_func;
> -		tryfmt->ycbcr_enc = fmt->ycbcr_enc;
> -		tryfmt->quantization = fmt->quantization;
> +	if (ic_route) {
> +		if (tryfmt->ycbcr_enc != V4L2_YCBCR_ENC_601 &&
> +		    tryfmt->ycbcr_enc != V4L2_YCBCR_ENC_709)
> +			tryfmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>  	} else {
> -		if (tryfmt->xfer_func == V4L2_XFER_FUNC_DEFAULT) {
> -			tryfmt->xfer_func =
> -				V4L2_MAP_XFER_FUNC_DEFAULT(tryfmt->colorspace);
> -		}
>  		if (tryfmt->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT) {
>  			tryfmt->ycbcr_enc =
>  				V4L2_MAP_YCBCR_ENC_DEFAULT(tryfmt->colorspace);
>  		}
> -		if (tryfmt->quantization == V4L2_QUANTIZATION_DEFAULT) {
> -			tryfmt->quantization =
> -				V4L2_MAP_QUANTIZATION_DEFAULT(
> -					is_rgb, tryfmt->colorspace,
> -					tryfmt->ycbcr_enc);
> -		}
>  	}
>  
> -	if (ic_route) {
> -		tryfmt->quantization = is_rgb ?
> -			V4L2_QUANTIZATION_FULL_RANGE :
> -			V4L2_QUANTIZATION_LIM_RANGE;
> -		tryfmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> -	}
> +	if (tryfmt->quantization == V4L2_QUANTIZATION_DEFAULT)
> +		tryfmt->quantization =
> +			V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb,
> +						      tryfmt->colorspace,
> +						      tryfmt->ycbcr_enc);
>  }
> -EXPORT_SYMBOL_GPL(imx_media_fill_default_mbus_fields);
> +EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
>  
>  int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  				  struct v4l2_rect *compose,
> diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
> index 4487374c9435..fbafd7fb7aeb 100644
> --- a/drivers/staging/media/imx/imx-media-vdic.c
> +++ b/drivers/staging/media/imx/imx-media-vdic.c
> @@ -617,14 +617,13 @@ static void vdic_try_fmt(struct vdic_priv *priv,
>  				      &sdformat->format.height,
>  				      MIN_H, MAX_H_VDIC, H_ALIGN, S_ALIGN);
>  
> -		imx_media_fill_default_mbus_fields(&sdformat->format, infmt,
> -						   true);
> -
>  		/* input must be interlaced! Choose SEQ_TB if not */
>  		if (!V4L2_FIELD_HAS_BOTH(sdformat->format.field))
>  			sdformat->format.field = V4L2_FIELD_SEQ_TB;
>  		break;
>  	}
> +
> +	imx_media_try_colorimetry(&sdformat->format, true);
>  }
>  
>  static int vdic_set_fmt(struct v4l2_subdev *sd,
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index 6587aa49e005..23024c9bc887 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -172,9 +172,8 @@ int imx_media_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
>  			    const struct imx_media_pixfmt **cc);
>  int imx_media_init_cfg(struct v4l2_subdev *sd,
>  		       struct v4l2_subdev_pad_config *cfg);
> -void imx_media_fill_default_mbus_fields(struct v4l2_mbus_framefmt *tryfmt,
> -					struct v4l2_mbus_framefmt *fmt,
> -					bool ic_route);
> +void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
> +			       bool ic_route);
>  int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  				  struct v4l2_rect *compose,
>  				  const struct v4l2_mbus_framefmt *mbus,
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index a708a0340eb1..6e2f4c3eb24f 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1003,8 +1003,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>  
>  		sdformat->format.colorspace = in_fmt->colorspace;
>  		sdformat->format.xfer_func = in_fmt->xfer_func;
> -		sdformat->format.quantization = in_fmt->quantization;
> -		sdformat->format.ycbcr_enc = in_fmt->ycbcr_enc;
>  		break;
>  	case IMX7_CSI_PAD_SINK:
>  		*cc = imx_media_find_mbus_format(sdformat->format.code,
> @@ -1015,14 +1013,14 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>  							 false);
>  			sdformat->format.code = (*cc)->codes[0];
>  		}
> -
> -		imx_media_fill_default_mbus_fields(&sdformat->format, in_fmt,
> -						   false);
>  		break;
>  	default:
>  		return -EINVAL;
>  		break;
>  	}
> +
> +	imx_media_try_colorimetry(&sdformat->format, false);
> +
>  	return 0;
>  }
>  
> 

