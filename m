Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B731532A7
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 15:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgBEORs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 09:17:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54290 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728215AbgBEORr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 09:17:47 -0500
Received: from [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae] (unknown [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D660829435E;
        Wed,  5 Feb 2020 14:17:43 +0000 (GMT)
Subject: Re: [PATCH 3/3] media: vimc: deb: Add support for GBR and BGR bus
 formats on source pad
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
 <20200202155019.1029993-4-nfraprado@protonmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <cc1e3f33-450b-2501-3b45-fddace4edcb8@collabora.com>
Date:   Wed, 5 Feb 2020 11:17:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200202155019.1029993-4-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

Thanks for the patch.

On 2/2/20 1:50 PM, Nícolas F. R. A. Prado wrote:
> Add support for GBR and BGR media bus formats for the source pad of
> debayer subdevices.
> 
> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
>  drivers/media/platform/vimc/vimc-debayer.c | 53 +++++++++++++++++-----
>  1 file changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 5d1b67d684bb..463cafbe107e 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -51,6 +51,11 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
>  	.colorspace = V4L2_COLORSPACE_DEFAULT,
>  };
>  
> +static const u32 src_rgb_codes[] = {

s/src_rgb_codes/vimc_deb_src_mbus_codes

> +	MEDIA_BUS_FMT_BGR888_1X24,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_GBR888_1X24};

The closing bracket should be in the next line.

I was also wondering if all the MEDIA_BUS_FMT_BGR888_* MEDIA_BUS_FMT_RGB888_*
MEDIA_BUS_FMT_GBR888_* variants could be added here as well.

> +
>  static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>  	{
>  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> @@ -148,14 +153,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_pad_config *cfg,
>  				   struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	/* We only support one format for source pads */
>  	if (VIMC_IS_SRC(code->pad)) {
> -		struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
> -
> -		if (code->index)
> +		if (code->index >= ARRAY_SIZE(src_rgb_codes))
>  			return -EINVAL;
>  
> -		code->code = vdeb->src_code;
> +		code->code = src_rgb_codes[code->index];
>  	} else {
>  		if (code->index >= ARRAY_SIZE(vimc_deb_pix_map_list))
>  			return -EINVAL;
> @@ -170,7 +172,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>  				    struct v4l2_subdev_pad_config *cfg,
>  				    struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
> +	int i;

unsigned

>  
>  	if (fse->index)
>  		return -EINVAL;
> @@ -181,8 +183,13 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>  
>  		if (!vpix)
>  			return -EINVAL;
> -	} else if (fse->code != vdeb->src_code) {
> -		return -EINVAL;
> +	} else {

You can declare i inside this else statement.

> +		for (i = 0; i < ARRAY_SIZE(src_rgb_codes); i++) {
> +			if (src_rgb_codes[i] == fse->code)
> +				break;
> +		}
> +		if (i == ARRAY_SIZE(src_rgb_codes))
> +			return -EINVAL;
>  	}
>  
>  	fse->min_width = VIMC_FRAME_MIN_WIDTH;
> @@ -237,6 +244,8 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>  {
>  	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *sink_fmt;
> +	unsigned int i;
> +	u32 *src_code;
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		/* Do not change the format while stream is on */
> @@ -244,8 +253,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>  			return -EBUSY;
>  
>  		sink_fmt = &vdeb->sink_fmt;
> +		src_code = &vdeb->src_code;
>  	} else {
>  		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> +		src_code = &v4l2_subdev_get_try_format(sd, cfg, 1)->code;
>  	}
>  
>  	/*
> @@ -253,9 +264,17 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>  	 * it is propagated from the sink
>  	 */
>  	if (VIMC_IS_SRC(fmt->pad)) {
> +		u32 code = fmt->format.code;
> +
>  		fmt->format = *sink_fmt;
> -		/* TODO: Add support for other formats */
> -		fmt->format.code = vdeb->src_code;
> +
> +		for (i = 0; i < ARRAY_SIZE(src_rgb_codes); i++) {
> +			if (src_rgb_codes[i] == code) {
> +				*src_code = src_rgb_codes[i];
> +				break;
> +			}
> +		}

Maybe you can add a function for this, since you also repeat this loop above.

Regards,
Helen

> +		fmt->format.code = *src_code;
>  	} else {
>  		/* Set the new format in the sink pad */
>  		vimc_deb_adjust_sink_fmt(&fmt->format);
> @@ -291,11 +310,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *vdeb,
>  						  unsigned int col,
>  						  unsigned int rgb[3])
>  {
> +	const struct vimc_pix_map *vpix;
>  	unsigned int i, index;
>  
> +	vpix = vimc_pix_map_by_code(vdeb->src_code);
>  	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> -	for (i = 0; i < 3; i++)
> -		vdeb->src_frame[index + i] = rgb[i];
> +	for (i = 0; i < 3; i++) {
> +		switch (vpix->pixelformat) {
> +		case V4L2_PIX_FMT_RGB24:
> +			vdeb->src_frame[index + i] = rgb[i];
> +			break;
> +		case V4L2_PIX_FMT_BGR24:
> +			vdeb->src_frame[index + i] = rgb[2-i];
> +			break;
> +		}
> +	}
>  }
>  
>  static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
> 
