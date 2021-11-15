Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1580F450673
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhKOOTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbhKOORv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:17:51 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7678AC061570;
        Mon, 15 Nov 2021 06:14:49 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mckumFW7VfwDFmckxmOkbQ; Mon, 15 Nov 2021 15:14:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636985688; bh=Y/R0UaCXRwHqfEMjBdd443GDO63lacWgX88qBmX9uwY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IOju47qyqAVLPDtFCk7aN8IV3auRnWVYpe9y87m5Po2/0LlTv3g2MCvhmgcz9IcD7
         nJa2g9cc47bKqy9CUkHzH9m2IpZO22JOwbF/6C3w2oJFDC9dIHOwl3yU1o0jASKfGM
         /+99GDt9/arsruQDZ7inbecnRwa4u376aeKQRq5HJnQOi9EHA2hRy4QcfkNyVHwaOy
         v5kqVqnbWL1mrldrMh/Vz7QpJHgP6r53S7aGW0aOdIaN1/ifSYMjPwrbXldznGMyxU
         I5fOJo1oMUmtUhEs172Z2vf/44H3uHVfEME3rz6ZT1UUPCShgBSkUem7DPqzwr0hNE
         0wxFLGktfcWFw==
Subject: Re: [PATCH v4 2/5] media: imx: Store the type of hardware
 implementation
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
References: <20211104113631.206899-1-dorota.czaplejewicz@puri.sm>
 <20211104113631.206899-2-dorota.czaplejewicz@puri.sm>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5a09a8d7-ada6-ce4f-9eb1-97ad0c4200af@xs4all.nl>
Date:   Mon, 15 Nov 2021 15:14:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211104113631.206899-2-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCoW3I4ZtMOk9I7PiMwSJDmwh6JFa9AB0tItn1RJRMelbV0motsStfMMarKEjZtXEfsoUbHRHJC4e5w0XZhVPxfVEffNjxXnWgOxnfENzm4VJ1PTeFe3
 rcLAXUzLNrFus2KpUpQRM98kQQVRVdRxTHI0d1PMMlyq/88Zq0HhsgiabJ7vLmulmz8iGiogee/VVB1VgFE4JW1g8aGWWAXAqeR7H5hjcsOJaQ1sEocgrmS7
 4JXPEye4cTNZOJOaQVJWxnZgqCln4dpXr1j8Vpe1yvDWO1pQCj7KvDSSyYLeV/Qeqit1fOvKuECD19adfODJHHkRANj0dzVbsFp6qZqFqstLo0OpJUUa5Ard
 57N+EE+TfJpMiSkwfZVjqJwhi9SaB+z9tjztHH6j+IMBf/ScvTdr6lvI0zMOKRH8iDvfnG9eXA/g6tE98rs91HHCcCqYUWRHwDDQ0D/HfgtIpZ+KZfR0o9FH
 TohemdUaWNh3PCFLZO2bY6t5+zMQvhfJXm1irjmebJR+Ns7BqdO7x/ipqO2MMnhZoWp4JhKyHoFScNwvliWROJJk0FFKWpDq5r74jpFBIwmKRGa27zBrobaf
 Yziv6/wWzI0j4EhHvuAWk6x83Lehw8kImDYXiWF5N/hfySd1C7vQukl+3ZG08r7Inc+onp4Zzre86v4j4ViGpQNdnQXr74z3DDIjibsF0G3nzBMzQxG/p/yh
 l71RSnb2dig6E5p2PDHlqVHtF9l8DhQe
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dorota,

On 04/11/2021 12:43, Dorota Czaplejewicz wrote:
> The driver covers i.MX5/6, as well as i.MX7/8 hardware.
> Those implementations differ, e.g. in the sizes of buffers they accept.
> 
> Some functionality should be abstracted, and storing type achieves that.
> 
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
> ---
>  drivers/staging/media/imx/imx-ic-prpencvf.c   | 3 ++-
>  drivers/staging/media/imx/imx-media-capture.c | 5 ++++-
>  drivers/staging/media/imx/imx-media-csi.c     | 3 ++-
>  drivers/staging/media/imx/imx-media.h         | 8 +++++++-
>  drivers/staging/media/imx/imx7-media-csi.c    | 3 ++-
>  5 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index d990553de87b..e06f5fbe5174 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -1265,7 +1265,8 @@ static int prp_registered(struct v4l2_subdev *sd)
>  
>  	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
>  						   &ic_priv->sd,
> -						   PRPENCVF_SRC_PAD, true);
> +						   PRPENCVF_SRC_PAD, true,
> +						   DEVICE_TYPE_IMX56);
>  	if (IS_ERR(priv->vdev))
>  		return PTR_ERR(priv->vdev);
>  
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 93ba09236010..65dc95a48ecc 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -34,6 +34,7 @@ struct capture_priv {
>  
>  	struct imx_media_video_dev vdev;	/* Video device */
>  	struct media_pad vdev_pad;		/* Video device pad */
> +	enum imx_media_device_type type;	/* Type of hardware implementation */
>  
>  	struct v4l2_subdev *src_sd;		/* Source subdev */
>  	int src_sd_pad;				/* Source subdev pad */
> @@ -957,7 +958,8 @@ EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister);
>  
>  struct imx_media_video_dev *
>  imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
> -			      int pad, bool legacy_api)
> +			      int pad, bool legacy_api,
> +			      enum imx_media_device_type type)
>  {
>  	struct capture_priv *priv;
>  	struct video_device *vfd;
> @@ -972,6 +974,7 @@ imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
>  	priv->src_sd_pad = pad;
>  	priv->dev = dev;
>  	priv->legacy_api = legacy_api;
> +	priv->type = type;
>  
>  	mutex_init(&priv->mutex);
>  	INIT_LIST_HEAD(&priv->ready_q);
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index 6a94fff49bf6..b6758c3787c7 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1794,7 +1794,8 @@ static int csi_registered(struct v4l2_subdev *sd)
>  	}
>  
>  	priv->vdev = imx_media_capture_device_init(priv->sd.dev, &priv->sd,
> -						   CSI_SRC_PAD_IDMAC, true);
> +						   CSI_SRC_PAD_IDMAC, true,
> +						   DEVICE_TYPE_IMX56);
>  	if (IS_ERR(priv->vdev)) {
>  		ret = PTR_ERR(priv->vdev);
>  		goto free_fim;
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index d2a150aac6cd..08e0c94e2de1 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -96,6 +96,11 @@ enum imx_pixfmt_sel {
>  	PIXFMT_SEL_ANY = PIXFMT_SEL_YUV | PIXFMT_SEL_RGB | PIXFMT_SEL_BAYER,
>  };
>  
> +enum imx_media_device_type {
> +	DEVICE_TYPE_IMX56,
> +	DEVICE_TYPE_IMX78,
> +};
> +
>  struct imx_media_buffer {
>  	struct vb2_v4l2_buffer vbuf; /* v4l buffer must be first */
>  	struct list_head  list;
> @@ -282,7 +287,8 @@ int imx_media_ic_unregister(struct v4l2_subdev *sd);
>  /* imx-media-capture.c */
>  struct imx_media_video_dev *
>  imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *src_sd,
> -			      int pad, bool legacy_api);
> +			      int pad, bool legacy_api,
> +			      enum imx_media_device_type type);

I'm not so sure about creating an enum for this. Perhaps just a 'bool is_imx56'
would be sufficient. The argument name is also more understandable. And you also
don't have the issue of having to check for out-of-range type values.

Also, where is the device type set for imx8mq? I'm not all that familiar with
the imx code, but I don't see where imx8mq-mipi-csi2.c fills that in.

I will merge patch 1/5, that one makes sense, but I'll skip the others.

Regards,

	Hans

>  void imx_media_capture_device_remove(struct imx_media_video_dev *vdev);
>  int imx_media_capture_device_register(struct imx_media_video_dev *vdev,
>  				      u32 link_flags);
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index d7dc0d8edf50..1a11f07620e9 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1012,7 +1012,8 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
>  	}
>  
>  	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
> -						  IMX7_CSI_PAD_SRC, false);
> +						  IMX7_CSI_PAD_SRC, false,
> +						  DEVICE_TYPE_IMX78);
>  	if (IS_ERR(csi->vdev))
>  		return PTR_ERR(csi->vdev);
>  
> 

