Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25191BB7F4
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 09:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgD1HqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 03:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgD1HqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 03:46:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0A3C03C1A9;
        Tue, 28 Apr 2020 00:46:14 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1202C2A1111
Subject: Re: [PATCH v3 3/3] media: vimc: deb: Add support for {RGB,BGR,GBR}888
 bus formats on source pad
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20200427230234.3114565-4-nfraprado@protonmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <1fcbe67e-db71-7841-6165-e62b74d82994@collabora.com>
Date:   Tue, 28 Apr 2020 09:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427230234.3114565-4-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi,
Thanks for the patches!

On 28.04.20 01:03, Nícolas F. R. A. Prado wrote:
> Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
> the source pad of debayer subdevices.
> 
> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
> ---
> 
> Changes in v3:
> - Rename vimc_deb_is_src_code_invalid() to vimc_deb_src_code_is_valid()
> - Change vimc_deb_src_code_is_valid() to return bool
> 
> Changes in v2:
> - Change commit message to reflect v2 changes
> - Rename variables
> - Fix array formatting
> - Add vimc_deb_is_src_code_valid function
> - Add other BGR888 and RGB888 formats to debayer source pad supported
>    formats
> 
>   .../media/test-drivers/vimc/vimc-debayer.c    | 61 +++++++++++++++----
>   1 file changed, 49 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index d10aee9f84c4..7e87706d417e 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -51,6 +51,19 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
>   	.colorspace = V4L2_COLORSPACE_DEFAULT,
>   };
>   
> +static const u32 vimc_deb_src_mbus_codes[] = {
> +	MEDIA_BUS_FMT_GBR888_1X24,
> +	MEDIA_BUS_FMT_BGR888_1X24,
> +	MEDIA_BUS_FMT_BGR888_3X8,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_RGB888_2X12_BE,
> +	MEDIA_BUS_FMT_RGB888_2X12_LE,
> +	MEDIA_BUS_FMT_RGB888_3X8,
> +	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> +	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> +};
> +
>   static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
>   	{
>   		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> @@ -125,6 +138,17 @@ static const struct vimc_deb_pix_map *vimc_deb_pix_map_by_code(u32 code)
>   	return NULL;
>   }
>   
> +static bool vimc_deb_src_code_is_valid(u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(vimc_deb_src_mbus_codes); i++)
> +		if (vimc_deb_src_mbus_codes[i] == code)
> +			return true;
> +
> +	return false;
> +}
> +
>   static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
>   			     struct v4l2_subdev_pad_config *cfg)
>   {
> @@ -148,14 +172,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_subdev *sd,
>   				   struct v4l2_subdev_pad_config *cfg,
>   				   struct v4l2_subdev_mbus_code_enum *code)
>   {
> -	/* We only support one format for source pads */
>   	if (VIMC_IS_SRC(code->pad)) {
> -		struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
> -
> -		if (code->index)
> +		if (code->index >= ARRAY_SIZE(vimc_deb_src_mbus_codes))
>   			return -EINVAL;
>   
> -		code->code = vdeb->src_code;
> +		code->code = vimc_deb_src_mbus_codes[code->index];
>   	} else {
>   		if (code->index >= ARRAY_SIZE(vimc_deb_pix_map_list))
>   			return -EINVAL;
> @@ -170,8 +191,6 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>   				    struct v4l2_subdev_pad_config *cfg,
>   				    struct v4l2_subdev_frame_size_enum *fse)
>   {
> -	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
> -
>   	if (fse->index)
>   		return -EINVAL;
>   
> @@ -181,7 +200,7 @@ static int vimc_deb_enum_frame_size(struct v4l2_subdev *sd,
>   
>   		if (!vpix)
>   			return -EINVAL;
> -	} else if (fse->code != vdeb->src_code) {
> +	} else if (!vimc_deb_src_code_is_valid(fse->code)) {
>   		return -EINVAL;
>   	}
>   
> @@ -237,6 +256,7 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>   {
>   	struct vimc_deb_device *vdeb = v4l2_get_subdevdata(sd);
>   	struct v4l2_mbus_framefmt *sink_fmt;
> +	u32 *src_code;
>   
>   	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>   		/* Do not change the format while stream is on */
> @@ -244,8 +264,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>   			return -EBUSY;
>   
>   		sink_fmt = &vdeb->sink_fmt;
> +		src_code = &vdeb->src_code;
>   	} else {
>   		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> +		src_code = &v4l2_subdev_get_try_format(sd, cfg, 1)->code;
>   	}
>   
>   	/*
> @@ -253,9 +275,14 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *sd,
>   	 * it is propagated from the sink
>   	 */
>   	if (VIMC_IS_SRC(fmt->pad)) {
> +		u32 code = fmt->format.code;
> +
>   		fmt->format = *sink_fmt;
> -		/* TODO: Add support for other formats */
> -		fmt->format.code = vdeb->src_code;
> +
> +		if (vimc_deb_src_code_is_valid(code))
> +			*src_code = code;
> +
> +		fmt->format.code = *src_code;
>   	} else {
>   		/* Set the new format in the sink pad */
>   		vimc_deb_adjust_sink_fmt(&fmt->format);
> @@ -291,11 +318,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x24(struct vimc_deb_device *vdeb,
I guess the name of the function should now change to vimc_deb_set_rgb_mbus_fmt ?
Or better vimc_deb_process_rgb_frame.
Also, it seems that it is a assigned as a callback so that each src_fmt have a different callback
but you already did it with a switch case. So maybe you can add a patch to call it directly

Thanks,
Dafna

>   						  unsigned int col,
>   						  unsigned int rgb[3])
>   {
> +	const struct vimc_pix_map *vpix;
>   	unsigned int i, index;
>   
> +	vpix = vimc_pix_map_by_code(vdeb->src_code);
>   	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
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
>   }
>   
>   static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
> 
