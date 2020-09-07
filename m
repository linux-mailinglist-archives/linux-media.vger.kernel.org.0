Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE24925FF4C
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 18:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbgIGQaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 12:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbgIGO1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:27:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A68C061756
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 07:19:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1E1BD29226B
Subject: Re: [PATCH v4 09/10] media: staging: rkisp1: cap: simplify the link
 validation by compering the media bus code
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-10-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <671e22c5-2856-d527-e3dd-3bceb77844d5@collabora.com>
Date:   Mon, 7 Sep 2020 11:19:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901111612.10552-10-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

typo in the title

s/compering/comparing

On 9/1/20 8:16 AM, Dafna Hirschfeld wrote:
> The capture has a mapping of the mbus code needed for each pixelformat.
> This can be used to simplify the link validation by comparing the mbus
> code in the capture with the code in the resizer.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>


Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 531381e1801a..79ee6795a58f 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1265,22 +1265,11 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  	struct v4l2_subdev *sd =
>  		media_entity_to_v4l2_subdev(link->source->entity);
>  	struct rkisp1_capture *cap = video_get_drvdata(vdev);
> -	struct rkisp1_isp *isp = &cap->rkisp1->isp;
> -	u8 isp_pix_enc = isp->src_fmt->pixel_enc;
> -	u8 cap_pix_enc = cap->pix.info->pixel_enc;
> +	const struct rkisp1_capture_fmt_cfg *fmt =
> +		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
>  	struct v4l2_subdev_format sd_fmt;
>  	int ret;
>  
> -	if (cap_pix_enc != isp_pix_enc &&
> -	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
> -	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
> -		dev_err(cap->rkisp1->dev,
> -			"format type mismatch in link '%s:%d->%s:%d'\n",
> -			link->source->entity->name, link->source->index,
> -			link->sink->entity->name, link->sink->index);
> -		return -EPIPE;
> -	}
> -
>  	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  	sd_fmt.pad = link->source->index;
>  	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
> @@ -1288,7 +1277,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  		return ret;
>  
>  	if (sd_fmt.format.height != cap->pix.fmt.height ||
> -	    sd_fmt.format.width != cap->pix.fmt.width)
> +	    sd_fmt.format.width != cap->pix.fmt.width ||
> +	    sd_fmt.format.code != fmt->mbus)
>  		return -EPIPE;
>  
>  	return 0;
> 
