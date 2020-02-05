Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24128153222
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 14:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgBENpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 08:45:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgBENpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 08:45:34 -0500
Received: from [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae] (unknown [IPv6:2804:214:85ec:bd22:b29b:72b8:8fc3:cfae])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4F222947F3;
        Wed,  5 Feb 2020 13:45:26 +0000 (GMT)
Subject: Re: [PATCH] media: staging: rkisp1: don't lock media's graph_mutex
 when calling rkisp1_create_links
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
References: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <fe913642-4092-afcb-90c7-5c51b8f3a2e5@collabora.com>
Date:   Wed, 5 Feb 2020 10:45:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204214446.20381-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/4/20 7:44 PM, Dafna Hirschfeld wrote:
> The function rkisp1_create_links calls media_entity_get_fwnode_pad
> and media_create_pad_link in the mc api. Those calls don't require
> locking the graph_mutex so remove the locking.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index 9d866396a5de..64e61ab29143 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -219,19 +219,17 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
>  		container_of(notifier, struct rkisp1_device, notifier);
>  	int ret;
>  
> -	mutex_lock(&rkisp1->media_dev.graph_mutex);
>  	ret = rkisp1_create_links(rkisp1);
>  	if (ret)
> -		goto unlock;
> +		return ret;
> +
>  	ret = v4l2_device_register_subdev_nodes(&rkisp1->v4l2_dev);
>  	if (ret)
> -		goto unlock;
> +		return ret;
>  
>  	dev_dbg(rkisp1->dev, "Async subdev notifier completed\n");
>  
> -unlock:
> -	mutex_unlock(&rkisp1->media_dev.graph_mutex);
> -	return ret;
> +	return 0;
>  }
>  
>  static int rkisp1_fwnode_parse(struct device *dev,
> 
