Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0323F294130
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 19:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395308AbgJTRNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 13:13:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43428 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395204AbgJTRNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 13:13:20 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 62B641F44F32
Subject: Re: [PATCH 1/4] media: staging: rkisp1: fix coding style issues
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201019205956.6980-1-dafna.hirschfeld@collabora.com>
 <20201019205956.6980-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <42b40780-f9ca-18fb-161c-e45f8500d161@collabora.com>
Date:   Tue, 20 Oct 2020 14:13:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201019205956.6980-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 10/19/20 5:59 PM, Dafna Hirschfeld wrote:
> Fix checkpatch issues:
> Blank lines aren't necessary before a close brace '}'
> Alignment should match open parenthesis

Just a nit, usually, it's one patch per checkpatch error.

With the split:

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-dev.c     | 4 ++--
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 1 -
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index 91584695804b..4f6ae1a01253 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -254,8 +254,8 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
>  		struct rkisp1_sensor_async *rk_asd = NULL;
>  		struct fwnode_handle *ep;
>  
> -		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> -			0, next_id, FWNODE_GRAPH_ENDPOINT_NEXT);
> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev), 0, next_id,
> +						     FWNODE_GRAPH_ENDPOINT_NEXT);
>  		if (!ep)
>  			break;
>  
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index a9715b0b7264..fb23461d865c 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -1157,5 +1157,4 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>  		 */
>  		rkisp1_params_isr(rkisp1);
>  	}
> -
>  }
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 1687d82e6c68..a9d537c11ecb 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -610,8 +610,8 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>  				  RKISP1_ISP_MIN_WIDTH,
>  				  RKISP1_ISP_MAX_WIDTH);
>  	sink_fmt->height = clamp_t(u32, format->height,
> -				  RKISP1_ISP_MIN_HEIGHT,
> -				  RKISP1_ISP_MAX_HEIGHT);
> +				   RKISP1_ISP_MIN_HEIGHT,
> +				   RKISP1_ISP_MAX_HEIGHT);
>  
>  	*format = *sink_fmt;
>  
> 
