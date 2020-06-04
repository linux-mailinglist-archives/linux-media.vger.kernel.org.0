Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4901EEACC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 21:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbgFDTES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 15:04:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55618 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728967AbgFDTER (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 15:04:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id CDC422A2E44
Subject: Re: [PATCH 1/2] media: staging: rkisp1: rsz: supported formats are
 the isp's src formats, not sink formats
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org
References: <20200604190015.12069-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <32485b73-f4e7-84c0-1b7c-8608dddccb07@collabora.com>
Date:   Thu, 4 Jun 2020 16:04:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200604190015.12069-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 6/4/20 4:00 PM, Dafna Hirschfeld wrote:
> The rkisp1_resizer's enum callback 'rkisp1_rsz_enum_mbus_code'
> calls the enum callback of the 'rkisp1_isp' on it's video sink pad.
> This is a bug, the resizer should support the same formats
> supported by the 'rkisp1_isp' on the source pad (not the sink pad).

Nice catch!

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index d049374413dc..d64c064bdb1d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -437,8 +437,8 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
>  	u32 pad = code->pad;
>  	int ret;
>  
> -	/* supported mbus codes are the same in isp sink pad */
> -	code->pad = RKISP1_ISP_PAD_SINK_VIDEO;
> +	/* supported mbus codes are the same in isp video src pad */
> +	code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>  	ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
>  			       &dummy_cfg, code);
>  
> 
