Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E52116D4
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 12:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfEBKBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 06:01:47 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51701 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfEBKBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 06:01:46 -0400
Received: by mail-wm1-f68.google.com with SMTP id t76so1947197wmt.1;
        Thu, 02 May 2019 03:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=hFHdNN1/YEjXdeQmsbYBo++9cGNZ+Uicd3DB8o/CVVg=;
        b=phAoDDPbKaKQ1bh3tnJP/1NIrzdMZWY62fugBQTe6D9PtXcpQs5GFuuAqHrRXjWfUA
         ws+ZV/H2MWd+hUS56iS+SRP0UZ8Eu2pvg+dk6lcOxtlGC7sAO1b8A4yyUuZU/4p7taDX
         EJXOFUmrlde++J3Z1iHShe8FqLefcdmJ4T5ezH+jnsneUnQ5mgZu/Os+PRia5VP7A2oP
         nfQs7ZyQTi1P0tY6LpE/TU89aGKN1ALlQ2a2Y29IsnF9O+veOz8Ob05L/0uW30lgiDKa
         9RdHNghtkfrfUUqxfoGDzUzoFyuIfq/JVuWYsHHHzPbnTJqVvvQlu5OX3ETqFgQj9JUk
         987g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=hFHdNN1/YEjXdeQmsbYBo++9cGNZ+Uicd3DB8o/CVVg=;
        b=Mpq5vapKg6lzCv8XayZXuFg2IbyA6coxbah1CcjUYZ4nvwXdreal3Tpgnp1BT0Z9NI
         CvO/4RMM4DdACRZSMXMiGOh1KZtPy1ugcrrklbH7yuHAg4tDI6Ko87teJbTjtow/Ntnm
         T5cbEyQmF8QjySPx1g/iDvWoc4WfMvWzngfh/VrTQe09SnxGIlJFjHKZQ8H1vtIBVnqd
         gq2q8nTnAjVIKQF7WR88NaFCINzRFufmcTeAePLEexu1dRubMvm6bckYhypsnL6VMTzv
         /Wo5agRMZnR60Iodk8r6zGqgGuOY8pMFme+0F3/23FCGyP6frhoaBFaiMmcytunivoyb
         +PXw==
X-Gm-Message-State: APjAAAVaftbnJkOHS0KLELcJIOxJ6FzTAN+Obmaoe8I7NDNeeYGGID/L
        VFPQlIgDYw6uZyXaqo2JynpTwB4LdrRN5w==
X-Google-Smtp-Source: APXvYqyRJGwi+C9739pX/VMDV7tPHD5g2TMMt8G3jIpQ1UZbxxt/nndAx+p5wFg/tW86yqmDLkpeOA==
X-Received: by 2002:a7b:c0d4:: with SMTP id s20mr1760391wmh.52.1556791302654;
        Thu, 02 May 2019 03:01:42 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id q2sm19230130wrd.48.2019.05.02.03.01.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 03:01:41 -0700 (PDT)
References: <20190430225018.30252-1-slongerbeam@gmail.com> <20190430225018.30252-6-slongerbeam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list\:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list\:ARM\/FREESCALE IMX \/ MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/8] media: staging/imx: Remove capture_device_set_format
In-reply-to: <20190430225018.30252-6-slongerbeam@gmail.com>
Date:   Thu, 02 May 2019 11:01:39 +0100
Message-ID: <m3lfzp5g58.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
Thanks for v3 with bisect fixed.

On Tue 30 Apr 2019 at 23:50, Steve Longerbeam wrote:
> Don't propagate the source pad format to the connected capture device.
> It's now the responsibility of userspace to call VIDIOC_S_FMT on the
> capture device to ensure the capture format and compose rectangle
> are compatible with the connected source. To check this, validate
> the capture format with the source before streaming starts.
>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-ic-prpencvf.c   | 16 +----
>  drivers/staging/media/imx/imx-media-capture.c | 64 +++++++++++++------
>  drivers/staging/media/imx/imx-media-csi.c     | 16 +----
>  drivers/staging/media/imx/imx-media.h         |  2 -
>  drivers/staging/media/imx/imx7-media-csi.c    | 17 +----
>  5 files changed, 50 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index afaa3a8b15e9..63334fd61492 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -906,9 +906,7 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
>  		       struct v4l2_subdev_format *sdformat)
>  {
>  	struct prp_priv *priv = sd_to_priv(sd);
> -	struct imx_media_video_dev *vdev = priv->vdev;
>  	const struct imx_media_pixfmt *cc;
> -	struct v4l2_pix_format vdev_fmt;
>  	struct v4l2_mbus_framefmt *fmt;
>  	int ret = 0;
>  
> @@ -945,19 +943,9 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
>  			priv->cc[PRPENCVF_SRC_PAD] = outcc;
>  	}
>  
> -	if (sdformat->which == V4L2_SUBDEV_FORMAT_TRY)
> -		goto out;
> -
> -	priv->cc[sdformat->pad] = cc;
> +	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		priv->cc[sdformat->pad] = cc;
>  
> -	/* propagate output pad format to capture device */
> -	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt,
> -				      &priv->format_mbus[PRPENCVF_SRC_PAD],
> -				      priv->cc[PRPENCVF_SRC_PAD]);
> -	mutex_unlock(&priv->lock);
> -	imx_media_capture_device_set_format(vdev, &vdev_fmt);
> -
> -	return 0;
>  out:
>  	mutex_unlock(&priv->lock);
>  	return ret;
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 555f6204660b..b77a67bda47c 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -205,7 +205,8 @@ static int capture_g_fmt_vid_cap(struct file *file, void *fh,
>  
>  static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
>  				     struct v4l2_subdev_format *fmt_src,
> -				     struct v4l2_format *f)
> +				     struct v4l2_format *f,
> +				     struct v4l2_rect *compose)
>  {
>  	const struct imx_media_pixfmt *cc, *cc_src;
>  
> @@ -247,6 +248,13 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
>  
>  	imx_media_mbus_fmt_to_pix_fmt(&f->fmt.pix, &fmt_src->format, cc);
>  
> +	if (compose) {
> +		compose->left = 0;
> +		compose->top = 0;
> +		compose->width = fmt_src->format.width;
> +		compose->height = fmt_src->format.height;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -263,7 +271,7 @@ static int capture_try_fmt_vid_cap(struct file *file, void *fh,
>  	if (ret)
>  		return ret;
>  
> -	return __capture_try_fmt_vid_cap(priv, &fmt_src, f);
> +	return __capture_try_fmt_vid_cap(priv, &fmt_src, f, NULL);
>  }
>  
>  static int capture_s_fmt_vid_cap(struct file *file, void *fh,
> @@ -271,6 +279,7 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
>  {
>  	struct capture_priv *priv = video_drvdata(file);
>  	struct v4l2_subdev_format fmt_src;
> +	struct v4l2_rect compose;
>  	int ret;
>  
>  	if (vb2_is_busy(&priv->q)) {
> @@ -284,17 +293,14 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
>  	if (ret)
>  		return ret;
>  
> -	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, f);
> +	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, f, &compose);
>  	if (ret)
>  		return ret;
>  
>  	priv->vdev.fmt.fmt.pix = f->fmt.pix;
>  	priv->vdev.cc = imx_media_find_format(f->fmt.pix.pixelformat,
>  					      CS_SEL_ANY, true);
> -	priv->vdev.compose.left = 0;
> -	priv->vdev.compose.top = 0;
> -	priv->vdev.compose.width = fmt_src.format.width;
> -	priv->vdev.compose.height = fmt_src.format.height;
> +	priv->vdev.compose = compose;
>  
>  	return 0;
>  }
> @@ -524,6 +530,33 @@ static void capture_buf_queue(struct vb2_buffer *vb)
>  	spin_unlock_irqrestore(&priv->q_lock, flags);
>  }
>  
> +static int capture_validate_fmt(struct capture_priv *priv)
> +{
> +	struct v4l2_subdev_format fmt_src;
> +	struct v4l2_rect compose;
> +	struct v4l2_format f;
> +	int ret;
> +
> +	fmt_src.pad = priv->src_sd_pad;
> +	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	ret = v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL, &fmt_src);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_fill_pix_format(&f.fmt.pix, &fmt_src.format);
> +
> +	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, &f, &compose);
> +	if (ret)
> +		return ret;
> +
> +	return (priv->vdev.fmt.fmt.pix.width != f.fmt.pix.width ||
> +		priv->vdev.fmt.fmt.pix.height != f.fmt.pix.height ||
> +		priv->vdev.cc->cs !=
> +		ipu_pixelformat_to_colorspace(f.fmt.pix.pixelformat) ||

This fails on imx7, no ipu, it returns unknown colorspace.
Removing this check everything works ok on my setup with this
series.
Do not know the best way to fix this but you may have? :)

> +		priv->vdev.compose.width != compose.width ||
> +		priv->vdev.compose.height != compose.height) ? -EINVAL : 0;
> +}
> +
>  static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct capture_priv *priv = vb2_get_drv_priv(vq);
> @@ -531,6 +564,10 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	unsigned long flags;
>  	int ret;
>  
> +	ret = capture_validate_fmt(priv);
> +	if (ret)

Maybe some verbose output here to let know userland what failed.

> +		goto return_bufs;
> +
>  	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
>  					    true);
>  	if (ret) {
> @@ -654,19 +691,6 @@ static struct video_device capture_videodev = {
>  	.device_caps	= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING,
>  };

---
Cheers,
	Rui

