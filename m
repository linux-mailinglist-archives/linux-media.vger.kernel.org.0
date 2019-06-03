Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAB2832F12
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 13:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfFCLzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 07:55:06 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51473 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726179AbfFCLzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 07:55:05 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id XlYKhLBiNsDWyXlYNhsugW; Mon, 03 Jun 2019 13:55:04 +0200
Subject: Re: [PATCH] media: davinci: vpif_capture: fix memory leak in
 vpif_probe()
To:     Young Xiao <92siuyang@gmail.com>, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1559135399-28998-1-git-send-email-92siuyang@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9a2b8351-cdb7-cec7-87d0-7aafb93ab647@xs4all.nl>
Date:   Mon, 3 Jun 2019 13:55:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559135399-28998-1-git-send-email-92siuyang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGcufboZE2BlEtyVUpsP+OXKLTXUYPNtp8CXNw0P33UYkdPzpCk0niF5iWxotMGdVXp7MWIvxavg4/AjqMtuLMDY0swCYt2YGreqy4R9d+PlImFUgYOf
 J3eWAJLaEU1LbZG1m56yXsVKchz2pSqIgI4a3LI9xMf6EptHTA6Ttkr71RFhtxbZACihQebc5nx8/QwmOYcYX3Qs3gcP0Ho5mS6DOYaunBegDs9SOMVqGUCZ
 vnHAdu6aFid3oT5P4vtZEEFky7Pw0HaHKCLtznKQBXx+/wjc4LGBS66qsp3KCLqEeh8U/EFTUWwGs+aTvs+Jng==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/19 3:09 PM, Young Xiao wrote:
> If vpif_probe() fails on vpif_probe_complete(), then memory
> allocated at initialize_vpif() for global vpif_obj.dev[i]
> become unreleased.
> 
> The patch adds deallocation of vpif_obj.dev[i] on the error path.
> 
> Signed-off-by: Young Xiao <92siuyang@gmail.com>
> ---
>  drivers/media/platform/davinci/vpif_capture.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index b5aacb0..63e6ec4 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -1621,6 +1621,14 @@ vpif_capture_get_pdata(struct platform_device *pdev)
>  	return NULL;
>  }
>  
> +static void free_vpif_objs(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < VPIF_DISPLAY_MAX_DEVICES; i++)
> +		kfree(vpif_obj.dev[i]);
> +}
> +
>  /**
>   * vpif_probe : This function probes the vpif capture driver
>   * @pdev: platform device pointer
> @@ -1701,7 +1709,10 @@ static __init int vpif_probe(struct platform_device *pdev)
>  				  "registered sub device %s\n",
>  				   subdevdata->name);
>  		}
> -		vpif_probe_complete();
> +		err = vpif_probe_complete();
> +		if (err) {
> +			goto probe_subdev_out;
> +		}

No need for { and } as per kernel coding style.

>  	} else {
>  		vpif_obj.notifier.ops = &vpif_async_ops;
>  		err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
> @@ -1722,6 +1733,7 @@ static __init int vpif_probe(struct platform_device *pdev)
>  	v4l2_device_unregister(&vpif_obj.v4l2_dev);
>  cleanup:
>  	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
> +	free_vpif_objs();

This would break the case where initialize_vpif() returns an error, since
initialize_vpif already frees these objects on error.

In this case the easiest way of doing this is to just return if initialize_vpif
returns an error. No need to clean up anything.

Regards,

	Hans

>  
>  	return err;
>  }
> @@ -1748,8 +1760,8 @@ static int vpif_remove(struct platform_device *device)
>  		ch = vpif_obj.dev[i];
>  		/* Unregister video device */
>  		video_unregister_device(&ch->video_dev);
> -		kfree(vpif_obj.dev[i]);
>  	}
> +	free_vpif_objs()
>  	return 0;
>  }
>  
> 

