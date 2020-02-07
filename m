Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147DC1557FD
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 13:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgBGM5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 07:57:35 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53048 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGM5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 07:57:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 0665D295891
Subject: Re: [PATCH 1/4] media: staging: rkisp1: change function to return
 void instead of int
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
 <20200207085951.5226-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <bc776484-af3a-381e-c847-eaefd21e8d3e@collabora.com>
Date:   Fri, 7 Feb 2020 09:57:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200207085951.5226-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/7/20 6:59 AM, Dafna Hirschfeld wrote:
> There are functions that return int but actually return always 0.
> Change them to return void and then there is no need to check
> for error return value.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-isp.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index 2b0513e826fe..56bd95d01f65 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -504,7 +504,7 @@ static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
>  	return 0;
>  }
>  
> -static int rkisp1_isp_stop(struct rkisp1_device *rkisp1)
> +static void rkisp1_isp_stop(struct rkisp1_device *rkisp1)
>  {
>  	u32 val;
>  
> @@ -540,8 +540,6 @@ static int rkisp1_isp_stop(struct rkisp1_device *rkisp1)
>  		     RKISP1_CIF_IRCL_MIPI_SW_RST | RKISP1_CIF_IRCL_ISP_SW_RST,
>  		     RKISP1_CIF_IRCL);
>  	rkisp1_write(rkisp1, 0x0, RKISP1_CIF_IRCL);
> -
> -	return 0;
>  }
>  
>  static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
> @@ -555,7 +553,7 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
>  	rkisp1_write(rkisp1, val, RKISP1_CIF_ICCL);
>  }
>  
> -static int rkisp1_isp_start(struct rkisp1_device *rkisp1)
> +static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_sensor_async *sensor = rkisp1->active_sensor;
>  	u32 val;
> @@ -580,8 +578,6 @@ static int rkisp1_isp_start(struct rkisp1_device *rkisp1)
>  	 * the MIPI interface and before starting the sensor output.
>  	 */
>  	usleep_range(1000, 1200);
> -
> -	return 0;
>  }
>  
>  /* ----------------------------------------------------------------------------
> @@ -956,9 +952,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  	int ret = 0;
>  
>  	if (!enable) {
> -		ret = rkisp1_isp_stop(rkisp1);
> -		if (ret)
> -			return ret;
> +		rkisp1_isp_stop(rkisp1);
>  		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
>  		return 0;
>  	}
> @@ -981,9 +975,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (ret)
>  		return ret;
>  
> -	ret = rkisp1_isp_start(rkisp1);
> -	if (ret)
> -		rkisp1_mipi_csi2_stop(rkisp1->active_sensor);
> +	rkisp1_isp_start(rkisp1);
>  
>  	return ret;
>  }
> 
