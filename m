Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C23198506
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 22:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgC3UAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 16:00:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36064 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgC3UAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 16:00:15 -0400
Received: from [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d] (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 432C3293544;
        Mon, 30 Mar 2020 21:00:08 +0100 (BST)
Subject: Re: [PATCH 1/3] media: staging: rkisp1: rsz: get the capture format
 info from the capture struct
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
 <20200328105606.13660-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <8cb695e4-9c75-384a-dd69-3210d524cf63@collabora.com>
Date:   Mon, 30 Mar 2020 17:00:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200328105606.13660-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/28/20 7:56 AM, Dafna Hirschfeld wrote:
> Currently the format info of the capture is retrieved by calling
> the function  v4l2_format_info. This is not needed since it is
> already save in the capture object.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 87799fbf0363..8704267a066f 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -387,8 +387,7 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>  	if (rsz->fmt_type == RKISP1_FMT_YUV) {
>  		struct rkisp1_capture *cap =
>  			&rsz->rkisp1->capture_devs[rsz->id];
> -		const struct v4l2_format_info *pixfmt_info =
> -			v4l2_format_info(cap->pix.fmt.pixelformat);
> +		const struct v4l2_format_info *pixfmt_info = cap->pix.info;
>  
>  		hdiv = pixfmt_info->hdiv;
>  		vdiv = pixfmt_info->vdiv;
> 
