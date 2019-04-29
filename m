Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFEC9E04F
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 12:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfD2KLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 06:11:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53751 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727428AbfD2KLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 06:11:32 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L3FuhKgYUb8gSL3Fyh7pnL; Mon, 29 Apr 2019 12:11:30 +0200
Subject: Re: [PATCH v5 07/14] media: vimc: cap: Add multiplanar formats
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, helen.koike@collabora.com,
        kernel@collabora.com, lucmaga@gmail.com,
        lkcamp@lists.libreplanetbr.org
References: <20190426195114.5002-1-andrealmeid@collabora.com>
 <20190426195114.5002-8-andrealmeid@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0357d080-586f-bfd2-a565-25796584b42b@xs4all.nl>
Date:   Mon, 29 Apr 2019 12:11:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190426195114.5002-8-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBJulp+CvhCY0hBrahPOs9IdjY25P3cgvGlH+2YyElXANkoS03lE4lU8HrsQpg5ztCVLL8p5K3004O3RzPotInUAxEBgi1veg7hJAxCE9MguzISgPwNA
 HtdQ7ZxvrhUftugINOEFCwHBYoCO4Sz5Kyp1tVKhw18zPYVwSRa6EY2OwlQPAclmQuk1UVDgGqmKM2fBweRqUqrGoqPDsU2E0zjek5Sl3kJGsmVbIIT6T/js
 lBglMhTOn4oWDTSc49twYIY58H9YoPk9G1+KTcYUSXDnH3gn4bkf0b56wDl7y1ceEM3Fz91ITwSTcbTvlyzbyuc0SSRRlfrWHM34jmi8tzaZIUOXZNpIqq+d
 OlHZmjLw9enaJC6yo8D2nPlIQyG5WA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/26/19 9:51 PM, André Almeida wrote:
> Add multiplanar formats to be exposed to the userspace as
> supported formats. Since we don't want to support multiplanar
> formats when the driver is in singleplanar mode, we only access
> the multiplanar formats array if the multiplanar mode is enabled.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v5: none
> 
> Changes in v4: none
> 
> Changes in v3: none
> 
> Changes in v2:
> - Change line break style
> - Add TODO comment
> 
>  drivers/media/platform/vimc/vimc-capture.c | 34 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 652d3d08bc50..a7dafc601033 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -32,6 +32,10 @@
>  #define IS_MULTIPLANAR(vcap) \
>  	(vcap->vdev.device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE)
>  
> +/**

Just use /* instead of /**

This is a regular comment, not something that has to end up in documentation.

> + * TODO: capture device should only enum formats that all subdevices on
> + * topology accepts
> + */
>  static const u32 vimc_cap_supported_pixfmt[] = {
>  	V4L2_PIX_FMT_BGR24,
>  	V4L2_PIX_FMT_RGB24,
> @@ -58,6 +62,19 @@ static const u32 vimc_cap_supported_pixfmt[] = {
>  	V4L2_PIX_FMT_SRGGB12,
>  };
>  
> +static const u32 vimc_cap_supported_pixfmt_mp[] = {
> +	V4L2_PIX_FMT_YUV420M,
> +	V4L2_PIX_FMT_YVU420M,
> +	V4L2_PIX_FMT_YUV422M,
> +	V4L2_PIX_FMT_YVU422M,
> +	V4L2_PIX_FMT_YUV444M,
> +	V4L2_PIX_FMT_YVU444M,
> +	V4L2_PIX_FMT_NV12M,
> +	V4L2_PIX_FMT_NV21M,
> +	V4L2_PIX_FMT_NV16M,
> +	V4L2_PIX_FMT_NV61M,
> +};
> +
>  struct vimc_cap_device {
>  	struct vimc_ent_device ved;
>  	struct video_device vdev;
> @@ -156,13 +173,26 @@ static int vimc_cap_try_fmt_vid_cap_mp(struct file *file, void *priv,
>  				   format->width, format->height);
>  }
>  
> +/**

Ditto.

Because of this I get these smatch warnings:

/home/hans/work/build/media-git/drivers/media/platform/vimc/vimc-capture.c:43: warning: cannot understand function prototype: 'const u32
vimc_cap_supported_pixfmt[] = '
/home/hans/work/build/media-git/drivers/media/platform/vimc/vimc-capture.c:199: warning: Function parameter or member 'file' not described
in 'vimc_cap_enum_fmt_vid_cap'
/home/hans/work/build/media-git/drivers/media/platform/vimc/vimc-capture.c:199: warning: Function parameter or member 'priv' not described
in 'vimc_cap_enum_fmt_vid_cap'
/home/hans/work/build/media-git/drivers/media/platform/vimc/vimc-capture.c:199: warning: Function parameter or member 'f' not described in
'vimc_cap_enum_fmt_vid_cap'

Regards,

	Hans

> + * When multiplanar is true, consider that the vimc_cap_enum_fmt_vid_cap_mp
> + * is concantenate in the vimc_cap_enum_fmt_vid_cap array. Otherwise, just
> + * consider the single-planar array
> + */
>  static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(vimc_cap_supported_pixfmt))
> +	struct vimc_cap_device *vcap = video_drvdata(file);
> +	const unsigned int sp_size = ARRAY_SIZE(vimc_cap_supported_pixfmt);
> +	const unsigned int mp_size = ARRAY_SIZE(vimc_cap_supported_pixfmt_mp);
> +
> +	if (f->index >= sp_size + (IS_MULTIPLANAR(vcap) ? mp_size : 0))
>  		return -EINVAL;
>  
> -	f->pixelformat = vimc_cap_supported_pixfmt[f->index];
> +	if (f->index >= sp_size)
> +		f->pixelformat =
> +			vimc_cap_supported_pixfmt_mp[f->index - sp_size];
> +	else
> +		f->pixelformat = vimc_cap_supported_pixfmt[f->index];
>  
>  	return 0;
>  }
> 

