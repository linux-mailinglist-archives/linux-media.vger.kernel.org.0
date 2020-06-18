Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDCE1FF2BE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 15:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgFRNNR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 09:13:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45708 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgFRNNQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 09:13:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 70EEE2A48E5
Subject: Re: [PATCH v4 4/4] media: staging: rkisp1: rsz: set default format if
 the given format is not RKISP1_ISP_SD_SRC
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200618113518.30057-1-dafna.hirschfeld@collabora.com>
 <20200618113518.30057-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c3bd4e70-e026-6559-8cc3-894ab1120cea@collabora.com>
Date:   Thu, 18 Jun 2020 10:13:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200618113518.30057-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/18/20 8:35 AM, Dafna Hirschfeld wrote:
> When setting the sink format of the 'rkisp1_resizer'
> the format should be supported by 'rkisp1_isp' on
> the video source pad. This patch checks this condition
> and sets the format to default if the condition is false.
> 
> Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h  | 3 +++
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 3 ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 0c4fe503adc9..12bd9d05050d 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -22,6 +22,9 @@
>  #include "rkisp1-regs.h"
>  #include "uapi/rkisp1-config.h"
>  
> +#define RKISP1_ISP_SD_SRC BIT(0)
> +#define RKISP1_ISP_SD_SINK BIT(1)
> +
>  #define RKISP1_ISP_MAX_WIDTH		4032
>  #define RKISP1_ISP_MAX_HEIGHT		3024
>  #define RKISP1_ISP_MIN_WIDTH		32
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index abfedb604303..b21a67aea433 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -23,9 +23,6 @@
>  
>  #define RKISP1_ISP_DEV_NAME	RKISP1_DRIVER_NAME "_isp"
>  
> -#define RKISP1_ISP_SD_SRC BIT(0)
> -#define RKISP1_ISP_SD_SINK BIT(1)
> -
>  /*
>   * NOTE: MIPI controller and input MUX are also configured in this file.
>   * This is because ISP Subdev describes not only ISP submodule (input size,
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index d64c064bdb1d..137298b77341 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -542,7 +542,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>  					    which);
>  	sink_fmt->code = format->code;
>  	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
> -	if (!mbus_info) {
> +	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
>  		sink_fmt->code = RKISP1_DEF_FMT;
>  		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>  	}
> 
