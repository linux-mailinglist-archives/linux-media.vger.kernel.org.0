Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7219E13A7B1
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 11:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgANKrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 05:47:42 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:49733 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbgANKrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 05:47:42 -0500
Received: from [IPv6:2001:420:44c1:2577:11b:d594:936e:b16a]
 ([IPv6:2001:420:44c1:2577:11b:d594:936e:b16a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id rJjUiummLrNgyrJjXixpOF; Tue, 14 Jan 2020 11:47:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578998860; bh=RImSbumVOqz0CgO3MNvrtKFbdoOd5oafg/KCzGlOyPs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D7vXB/oAcg2N96H8Jin3CiDZ5un+oG7l7qn1qY0zGWBaLqIFjhZxNDXKh0wd3D5AJ
         XBqs+HzcyTZS8l6laMRRrTo/3SZ0+YrH2tPG9NW4KlNzYlO5V6vqGC4TKw8pylvc9F
         U/4g68uiWBwa52E8kZHhvLENczWthEzH/iDEGcLt392Ipxh10Xg6tPF3lc9y6bYnBz
         +d1T9wb06YNo2FsazaY7yas4Yz39CKgtv6y+JAbXIkuEO3RbmPwSmgxMZfMgjfIbUm
         5RV1LQWP+HrbzJHtYHcntNOyEWUZcZMkuNzOe2xt57pFl14H/0cbK2rlVVwdFzdO3r
         YyZ4+a4TNcgaA==
Subject: Re: [PATCH v4 6/6] media: vimc: Track the media device by calling
 v4l2_device_get/put
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        skhan@linuxfoundation.org, kernel@collabora.com, dafna3@gmail.com
References: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
 <20200113215506.13329-7-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6f02119a-a1b4-a543-72a9-efbd11c03474@xs4all.nl>
Date:   Tue, 14 Jan 2020 11:47:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200113215506.13329-7-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIPBQljO06Ku0AmobTMr5mnWVWgFU3ZpFrRCzG9poGiRGL4CkNp3EzxjhYfcTjRZWYj9j7AtSvPyLhpIVc4NuR86gHaLkBnyAUy40Lepny3Y1n74N5Nh
 pi2TrEznE2a6vPkCPYeFtgU2zmF/WyUAgnMpzlRVHBCC0ybV8ZFlXK1t50EtWewV9U+RV9l+oLGjmEWMFUEWIigDOZSfRIsb2KvammePw8epIZ9+05r24NOp
 ZmhL5/pVUCHkLwput3Gbo7Vtbt6bMrAlUFeODjJtz5gIEQdW87eqTl5zx7/t4XTqAbUMQZx7LCMULnZnj2jp24OMzSrCL7/J4mTrLKjeimwgQFiMYHksrdQ0
 jXb0v3itaCdcZP5dTsSbhgoK2924gKwXeuX8sBDtxpH12ZHLxSuGCw50/ozUKQr4Dx1Sw+fpDCCkfdw+oLR9QlE3XRhEP0h/xJcomHb1ZVCGRH/p4CMLT70N
 Woh/OXHuXHOraXQqu8NYiCl4eU8QaG1JQJwmsA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 1/13/20 10:55 PM, Dafna Hirschfeld wrote:
> After a successful media_device_register call, call v4l2_device_get().
> and set the media_devnode release callback to a function that
> calls v4l2_device_put().
> That should ensure that the v4l2_device's release callback is called
> when the very last user of any of the registered device nodes has
> closed its fh.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/vimc/vimc-core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index 9d4e8bc89620..0f03e9cec075 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -214,6 +214,14 @@ static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
>  	kfree(vimc);
>  }
>  
> +static void vimc_media_device_release(struct media_devnode *devnode)
> +{
> +	struct media_device *mdev = devnode->media_dev;
> +	struct vimc_device *vimc = container_of(mdev, struct vimc_device, mdev);
> +
> +	v4l2_device_put(&vimc->v4l2_dev);
> +}
> +
>  static int vimc_register_devices(struct vimc_device *vimc)
>  {
>  	int ret;
> @@ -252,6 +260,8 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  		goto err_rm_subdevs;
>  	}
>  
> +	v4l2_device_get(&vimc->v4l2_dev);
> +	vimc->mdev.devnode->release = vimc_media_device_release;
>  	/* Expose all subdev's nodes*/
>  	ret = v4l2_device_register_subdev_nodes(&vimc->v4l2_dev);
>  	if (ret) {
> 

I like the idea, but I think the roles of v4l2_device and media_device should
be swapped. Logically the media device is the top-level device, and the v4l2_device
sits below it. So rather than cleaning everything up in the v4l2_device release
callback, that should be done in the mdev.devnode->release callback.

So during the probe you need a call to get_device(&mdev.devnode->dev) and in the
v4l2_device release callback you call put_device(&mdev.devnode->dev). And the
mdev.devnode->release() callback is then used to clean everything up.

I think it is a good idea to add helper functions media_device_get/put that take
a media_device pointer as argument, but I'd do that as a new last patch, replacing
any get/put_device() calls for mdev.devnode in one go. There may be some
discussion about that, so having this as the last patch makes it easier to postpone
merging it if needed.

Regards,

	Hans
