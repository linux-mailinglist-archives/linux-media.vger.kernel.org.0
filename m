Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F71623B13D
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 01:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgHCXtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 19:49:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51936 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbgHCXtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 19:49:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 03582291EDC
Subject: Re: [PATCH v3 04/10] media: staging: rkisp1: don't support bayer
 format on selfpath resizer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <91720e95-3b13-798a-6e95-f86f3c6b92fa@collabora.com>
Date:   Mon, 3 Aug 2020 20:49:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723132014.4597-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
> The selfpath capture does not support bayer formats.
> Therefore there is no reason to support bayer formats
> on the selfpath resizer. The selfpath resizer should
> support only MEDIA_BUS_FMT_YUYV8_2X8.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks,
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c |  7 -------
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 13 ++++++++++++-
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index fd0864194203..27efec004686 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1186,13 +1186,6 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  	struct v4l2_subdev_format sd_fmt;
>  	int ret;
>  
> -	if (cap->id == RKISP1_SELFPATH &&
> -	    isp->src_fmt->mbus_code != MEDIA_BUS_FMT_YUYV8_2X8) {
> -		dev_err(cap->rkisp1->dev,
> -			"selfpath only supports MEDIA_BUS_FMT_YUYV8_2X8\n");
> -		return -EPIPE;
> -	}
> -
>  	if (cap_pix_enc != isp_pix_enc &&
>  	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
>  	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index c66d2a52fd71..066d22096a7d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -437,6 +437,13 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>  	u32 pad = code->pad;
>  	int ret;
>  
> +	if (rsz->id == RKISP1_SELFPATH) {
> +		if (code->index > 0)
> +			return -EINVAL;
> +		code->code = MEDIA_BUS_FMT_YUYV8_2X8;
> +		return 0;
> +	}
> +
>  	/* supported mbus codes are the same in isp video src pad */
>  	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>  	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
> @@ -540,7 +547,11 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>  	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
>  	sink_crop = rkisp1_rsz_get_pad_crop(rsz, cfg, RKISP1_RSZ_PAD_SINK,
>  					    which);
> -	sink_fmt->code = format->code;
> +	if (rsz->id == RKISP1_SELFPATH)
> +		sink_fmt->code = MEDIA_BUS_FMT_YUYV8_2X8;
> +	else
> +		sink_fmt->code = format->code;
> +
>  	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>  	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
>  		sink_fmt->code = RKISP1_DEF_FMT;
> 
