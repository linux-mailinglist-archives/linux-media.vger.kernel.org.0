Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD29198512
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 22:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgC3UEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 16:04:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36098 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbgC3UEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 16:04:53 -0400
Received: from [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d] (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 081B1293EAE;
        Mon, 30 Mar 2020 21:04:47 +0100 (BST)
Subject: Re: [PATCH 2/3] media: staging: rkisp1: rsz: change (hv)div only if
 capture format is YUV
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
 <20200328105606.13660-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <7445ddcb-75f5-7792-0807-47c0b0d0d54a@collabora.com>
Date:   Mon, 30 Mar 2020 17:04:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200328105606.13660-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/28/20 7:56 AM, Dafna Hirschfeld wrote:
> RGB formats in selfpath should receive input format as YUV422.
> The resizer input format is always YUV422 and therefore
> if the capture format is RGB, the resizer should not change
> the YUV rations.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 8704267a066f..5721eee29ecb 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -389,8 +389,18 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>  			&rsz->rkisp1->capture_devs[rsz->id];
>  		const struct v4l2_format_info *pixfmt_info = cap->pix.info;
>  
> -		hdiv = pixfmt_info->hdiv;
> -		vdiv = pixfmt_info->vdiv;
> +		/*
> +		 * The resizer always get the input as YUV422
> +		 * If the capture encoding is also YUV, then the resizer should
> +		 * change the 4:2:2 sampling to the sampling of the capture
> +		 * format (4:2:2 -> 4:2:0 for example).
> +		 * If the capture format is RGB then the memory input should
> +		 * be YUV422 so we don't change the default hdiv, vdiv
> +		 */
> +		if (v4l2_is_format_yuv(pixfmt_info)) {

Can't this be moved with && in the outer if statement block?

Regards,
Helen

> +			hdiv = pixfmt_info->hdiv;
> +			vdiv = pixfmt_info->vdiv;
> +		}
>  	}
>  	src_c.width = src_y.width / hdiv;
>  	src_c.height = src_y.height / vdiv;
> 
