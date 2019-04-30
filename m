Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D679710233
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 00:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfD3WHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 18:07:17 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38293 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfD3WHQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 18:07:16 -0400
Received: by mail-ed1-f66.google.com with SMTP id w11so6909894edl.5;
        Tue, 30 Apr 2019 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9SMu+WlHgYEbLUBVSDeiV1gHsanLvun4cpyyZujK//I=;
        b=QC/tOkzs2vgCKb+BBUDSs1P57HTdA32o5XoJni6v19OmPJBC/sPuHoZXyMJW+JVLNb
         8TagEQDoJ5ePCUYMjG69Y9RsNN/xhF9zY8XfbtPYvGWo+yoWX6P6BljZpnmJBrOEKanW
         D9Ku0SkUzrPc/1IjeHu/7hIBFHZapNr1mXYztEBalIHjaud7RVQiSPf+K8nOQWmUimjp
         mfgyed/QufGyl4RJpYL8H5eQ6iA9yCQ2dBq0cKg0982jIHr4yUsxdGK000pr7s4VeJUt
         lffWB0u7f0AD2UjQ97EiVg6ye98nOVv9WMohfQZJt6LKnIVZfnADvb3czYBwoYcPYvOA
         6qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9SMu+WlHgYEbLUBVSDeiV1gHsanLvun4cpyyZujK//I=;
        b=c432usrAOCvgcaNoRBBQlR/s+DlXW2HtOpwh64AQ+Ud3SIkETjVuMMGVZABnyYpNle
         oYsbTdihJ6ThdvQcTXpUWaqqHP1ROIhMJ9JJBBQlp7KfQVOjJDKvfshBRmQjEjjNSguM
         uHnWpEFHYDOCnifna37IfHlKmFh0MmWaSmZvoalJKfJPaqXen98iHc/2xFpRSkIuyvYJ
         POzEOuSvxDaFtHa2sDJ8nW2TT3jxNv2DpEjaf5VsYvaBKuoyn1goqOpybGgX8gSqEZxN
         VyAajjwRAgIPMo0VWFxYNagMqS7qh0Lx04UdFANmZrnUO23C4nq7mjJa36qsDJ4YI3x1
         U/ZA==
X-Gm-Message-State: APjAAAWnoTLPvDFrlu3gVqH2/FLV5cSZvD5Rc8mSNjKXQ/vaL9imNUh2
        b30xVA86W4C0MNlDH2Ia1uo=
X-Google-Smtp-Source: APXvYqz5QqiK2l5xxdLKCIT2MX4KWodLOuC11vsnJyB2VbvlkA0dz4qLOqg8UwKE6111QMgbmIalSA==
X-Received: by 2002:aa7:c0d5:: with SMTP id j21mr43115003edp.38.1556662034267;
        Tue, 30 Apr 2019 15:07:14 -0700 (PDT)
Received: from [172.30.89.180] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id 28sm1243487ejg.27.2019.04.30.15.07.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 15:07:13 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] Revert "media: imx: Set capture compose rectangle
 in capture_device_set_format"
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        driverdev-devel@linuxdriverproject.org
Cc:     linux-media@vger.kernel.org,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20190428190916.26567-1-slongerbeam@gmail.com>
 <20190428190916.26567-5-slongerbeam@gmail.com> <m38svrnog8.fsf@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <1189a6b8-452e-cbab-3eb4-461dcfff951f@gmail.com>
Date:   Tue, 30 Apr 2019 15:07:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <m38svrnog8.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Yes, because the reverted commit was merged before the imx7 support, I 
will fix this for v3.

Steve


On 4/30/19 3:00 PM, Rui Miguel Silva wrote:
> Hi Steve,
> On Sun 28 Apr 2019 at 20:09, Steve Longerbeam wrote:
>> Rvert this commit, as imx_media_capture_device_set_format() will be
>> removed.
>>
>> This reverts commit 5964cbd8692252615370b77eb96764dd70c2f837.
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  5 ++--
>>   drivers/staging/media/imx/imx-media-capture.c | 24 +++++++++----------
>>   drivers/staging/media/imx/imx-media-csi.c     |  5 ++--
>>   drivers/staging/media/imx/imx-media-utils.c   | 20 ++++------------
>>   drivers/staging/media/imx/imx-media.h         |  6 ++---
>>   5 files changed, 23 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
>> index 8242d88dfb82..afaa3a8b15e9 100644
>> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
>> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
>> @@ -910,7 +910,6 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
>>   	const struct imx_media_pixfmt *cc;
>>   	struct v4l2_pix_format vdev_fmt;
>>   	struct v4l2_mbus_framefmt *fmt;
>> -	struct v4l2_rect vdev_compose;
>>   	int ret = 0;
>>   
>>   	if (sdformat->pad >= PRPENCVF_NUM_PADS)
>> @@ -952,11 +951,11 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
>>   	priv->cc[sdformat->pad] = cc;
>>   
>>   	/* propagate output pad format to capture device */
>> -	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt, &vdev_compose,
>> +	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt,
>>   				      &priv->format_mbus[PRPENCVF_SRC_PAD],
>>   				      priv->cc[PRPENCVF_SRC_PAD]);
>>   	mutex_unlock(&priv->lock);
>> -	imx_media_capture_device_set_format(vdev, &vdev_fmt, &vdev_compose);
>> +	imx_media_capture_device_set_format(vdev, &vdev_fmt);
>>   
>>   	return 0;
>>   out:
>> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
>> index 335084a6b0cd..555f6204660b 100644
>> --- a/drivers/staging/media/imx/imx-media-capture.c
>> +++ b/drivers/staging/media/imx/imx-media-capture.c
>> @@ -205,8 +205,7 @@ static int capture_g_fmt_vid_cap(struct file *file, void *fh,
>>   
>>   static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
>>   				     struct v4l2_subdev_format *fmt_src,
>> -				     struct v4l2_format *f,
>> -				     struct v4l2_rect *compose)
>> +				     struct v4l2_format *f)
>>   {
>>   	const struct imx_media_pixfmt *cc, *cc_src;
>>   
>> @@ -246,8 +245,7 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
>>   		}
>>   	}
>>   
>> -	imx_media_mbus_fmt_to_pix_fmt(&f->fmt.pix, compose,
>> -				      &fmt_src->format, cc);
>> +	imx_media_mbus_fmt_to_pix_fmt(&f->fmt.pix, &fmt_src->format, cc);
>>   
>>   	return 0;
>>   }
>> @@ -265,7 +263,7 @@ static int capture_try_fmt_vid_cap(struct file *file, void *fh,
>>   	if (ret)
>>   		return ret;
>>   
>> -	return __capture_try_fmt_vid_cap(priv, &fmt_src, f, NULL);
>> +	return __capture_try_fmt_vid_cap(priv, &fmt_src, f);
>>   }
>>   
>>   static int capture_s_fmt_vid_cap(struct file *file, void *fh,
>> @@ -273,7 +271,6 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
>>   {
>>   	struct capture_priv *priv = video_drvdata(file);
>>   	struct v4l2_subdev_format fmt_src;
>> -	struct v4l2_rect compose;
>>   	int ret;
>>   
>>   	if (vb2_is_busy(&priv->q)) {
>> @@ -287,14 +284,17 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, f, &compose);
>> +	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, f);
>>   	if (ret)
>>   		return ret;
>>   
>>   	priv->vdev.fmt.fmt.pix = f->fmt.pix;
>>   	priv->vdev.cc = imx_media_find_format(f->fmt.pix.pixelformat,
>>   					      CS_SEL_ANY, true);
>> -	priv->vdev.compose = compose;
>> +	priv->vdev.compose.left = 0;
>> +	priv->vdev.compose.top = 0;
>> +	priv->vdev.compose.width = fmt_src.format.width;
>> +	priv->vdev.compose.height = fmt_src.format.height;
>>   
>>   	return 0;
>>   }
>> @@ -655,8 +655,7 @@ static struct video_device capture_videodev = {
>>   };
>>   
>>   void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
>> -					 const struct v4l2_pix_format *pix,
>> -					 const struct v4l2_rect *compose)
>> +					 struct v4l2_pix_format *pix)
>>   {
>>   	struct capture_priv *priv = to_capture_priv(vdev);
>>   
>> @@ -664,7 +663,6 @@ void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
>>   	priv->vdev.fmt.fmt.pix = *pix;
>>   	priv->vdev.cc = imx_media_find_format(pix->pixelformat, CS_SEL_ANY,
>>   					      true);
>> -	priv->vdev.compose = *compose;
>>   	mutex_unlock(&priv->mutex);
>>   }
>>   EXPORT_SYMBOL_GPL(imx_media_capture_device_set_format);
>> @@ -770,8 +768,10 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
>>   	}
>>   
>>   	vdev->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> -	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt.fmt.pix, &vdev->compose,
>> +	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt.fmt.pix,
>>   				      &fmt_src.format, NULL);
>> +	vdev->compose.width = fmt_src.format.width;
>> +	vdev->compose.height = fmt_src.format.height;
>>   	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
>>   					 CS_SEL_ANY, false);
>>   
>> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
>> index c70fa6b509ae..09b89a72eaa2 100644
>> --- a/drivers/staging/media/imx/imx-media-csi.c
>> +++ b/drivers/staging/media/imx/imx-media-csi.c
>> @@ -1512,7 +1512,6 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
>>   	struct v4l2_pix_format vdev_fmt;
>>   	struct v4l2_mbus_framefmt *fmt;
>>   	struct v4l2_rect *crop, *compose;
>> -	struct v4l2_rect vdev_compose;
>>   	int ret;
>>   
>>   	if (sdformat->pad >= CSI_NUM_PADS)
>> @@ -1568,11 +1567,11 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
>>   	priv->cc[sdformat->pad] = cc;
>>   
>>   	/* propagate IDMAC output pad format to capture device */
>> -	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt, &vdev_compose,
>> +	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt,
>>   				      &priv->format_mbus[CSI_SRC_PAD_IDMAC],
>>   				      priv->cc[CSI_SRC_PAD_IDMAC]);
>>   	mutex_unlock(&priv->lock);
>> -	imx_media_capture_device_set_format(vdev, &vdev_fmt, &vdev_compose);
>> +	imx_media_capture_device_set_format(vdev, &vdev_fmt);
>>   
>>   	return 0;
>>   out:
>> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
>> index 8a6e57652402..a80ef0b087ad 100644
>> --- a/drivers/staging/media/imx/imx-media-utils.c
>> +++ b/drivers/staging/media/imx/imx-media-utils.c
>> @@ -577,8 +577,7 @@ void imx_media_fill_default_mbus_fields(struct v4l2_mbus_framefmt *tryfmt,
>>   EXPORT_SYMBOL_GPL(imx_media_fill_default_mbus_fields);
>>   
>>   int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>> -				  struct v4l2_rect *compose,
>> -				  const struct v4l2_mbus_framefmt *mbus,
>> +				  struct v4l2_mbus_framefmt *mbus,
>>   				  const struct imx_media_pixfmt *cc)
>>   {
>>   	u32 width;
>> @@ -625,17 +624,6 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>>   	pix->sizeimage = cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
>>   			 stride * pix->height;
>>   
>> -	/*
>> -	 * set capture compose rectangle, which is fixed to the
>> -	 * source subdevice mbus format.
>> -	 */
>> -	if (compose) {
>> -		compose->left = 0;
>> -		compose->top = 0;
>> -		compose->width = mbus->width;
>> -		compose->height = mbus->height;
>> -	}
>> -
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
>> @@ -647,11 +635,13 @@ int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
>>   
>>   	memset(image, 0, sizeof(*image));
>>   
>> -	ret = imx_media_mbus_fmt_to_pix_fmt(&image->pix, &image->rect,
>> -					    mbus, NULL);
>> +	ret = imx_media_mbus_fmt_to_pix_fmt(&image->pix, mbus, NULL);
>>   	if (ret)
>>   		return ret;
>>   
>> +	image->rect.width = mbus->width;
>> +	image->rect.height = mbus->height;
>> +
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_ipu_image);
>> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
>> index 71e20f53ed7b..ddea972b7bc4 100644
>> --- a/drivers/staging/media/imx/imx-media.h
>> +++ b/drivers/staging/media/imx/imx-media.h
>> @@ -174,8 +174,7 @@ void imx_media_fill_default_mbus_fields(struct v4l2_mbus_framefmt *tryfmt,
>>   					struct v4l2_mbus_framefmt *fmt,
>>   					bool ic_route);
>>   int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>> -				  struct v4l2_rect *compose,
>> -				  const struct v4l2_mbus_framefmt *mbus,
>> +				  struct v4l2_mbus_framefmt *mbus,
>>   				  const struct imx_media_pixfmt *cc);
> Also here you change this function arguments and only remove it
> from imx7-media-csi.c in the next patch, triggering:
>
>
> vers/staging/media/imx/imx7-media-csi.c: In function 'imx7_csi_set_fmt':
> drivers/staging/media/imx/imx7-media-csi.c:1089:43: error: passing argument 2 of 'imx_media_mbus_fmt_to_pix_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
>    imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt, &vdev_compose,
>                                             ^~~~~~~~~~~~~
> In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
> drivers/staging/media/imx/imx-media.h:177:34: note: expected 'struct v4l2_mbus_framefmt *' but argument is of type 'struct v4l2_rect *'
>         struct v4l2_mbus_framefmt *mbus,
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> drivers/staging/media/imx/imx7-media-csi.c:1090:11: error: passing argument 3 of 'imx_media_mbus_fmt_to_pix_fmt' from incompatible pointer type [-Werror=incompatible-pointer-types]
>             &csi->format_mbus[IMX7_CSI_PAD_SRC],
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
> drivers/staging/media/imx/imx-media.h:178:38: note: expected 'const struct imx_media_pixfmt *' but argument is of type 'struct v4l2_mbus_framefmt *'
>         const struct imx_media_pixfmt *cc);
>         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
> drivers/staging/media/imx/imx7-media-csi.c:1089:2: error: too many arguments to function 'imx_media_mbus_fmt_to_pix_fmt'
>    imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt, &vdev_compose,
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
> drivers/staging/media/imx/imx-media.h:176:5: note: declared here
>   int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/imx/imx7-media-csi.c:1093:2: error: too many arguments to function 'imx_media_capture_device_set_format'
>    imx_media_capture_device_set_format(vdev, &vdev_fmt, &vdev_compose);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/staging/media/imx/imx7-media-csi.c:30:
> drivers/staging/media/imx/imx-media.h:281:6: note: declared here
>   void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
>
> ---
> Cheers,
> 	Rui
>

