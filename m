Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 556B8133FFC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 12:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgAHLMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 06:12:36 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48903 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726276AbgAHLMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 06:12:36 -0500
Received: from [IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1]
 ([IPv6:2001:420:44c1:2577:919a:30e7:f323:4bf1])
        by smtp-cloud8.xs4all.net with ESMTPA
        id p9GHiV3dApLtbp9GKiGC94; Wed, 08 Jan 2020 12:12:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578481954; bh=HjHnpxh6njZ/ifYT+aXVcwibl0Q16oWFN8PmQeMH+Hc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=t3n04/pJTgKfzpT5FXhyr6n7O5xCxjwIgOQLVB0FZ7SzQXciVYluVDAxmy3cDx5us
         jzihFiHx+9jtDSjinZ0kmdy5QIGMAFInLg502ByEykY9fhWKTL7kgRhzzP+d01yWfb
         4M+R/Qhe5lnCvc4M+xJm+DYwq1kPZ0tB0z9+28BNxxE2vQmNy8krlzbKcf54+hn+pC
         veJG+DmD4N3yivw/pm1ykFgGUXTQasbL7UsAu/lUTqKGBuxtKi+LzNeSzq2oMZ5MU3
         cjFt26JZhAPjmkUTvDrh6qRFXzWaBYNqGbUVTxFRaSFI6HHrKOl6/0YhCKUqXjHaoS
         uT9Eomu90mlKw==
Subject: Re: [PATCH] media: v4l2-core: Fix Oops in ioctl
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Vandana BN <bnvandana@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <20200108105929.7kxwf5rthxnhwbuh@kili.mountain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4907cc69-9355-203e-76fc-33fb9452102b@xs4all.nl>
Date:   Wed, 8 Jan 2020 12:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200108105929.7kxwf5rthxnhwbuh@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDtYK+y4zkYbiVrOe9ffGH3NssUJO1OORw20n7Ty/UP2fjImBGSWnOu4NmWabfOJmAr7eCE7g4lhKTHkbHjt4/ajUZgvWuv25yXEmAhgpAPRDxc43jvm
 nZi49otTbxzpfcjdALpqekOflYaROFKI+4lCNyJ/ljBR4+UHoUiefqWUP8ZyT0D/3sVyZea32aZQek/kwPbYjIj8WrXxDIixsHgvxK5SHOPZ0vlyxvgobAOr
 QT5070TSQoLwv4REFpLOJzltSCt/m1U/PJ2RM59Gklyad3Q+bd5+vBVMWPjoa+J9Hd4gfylaLWzxncwX9z7x4vuCMFS1C35ClxH3A5EP1Tm7UDPbUz14yMAh
 2jEftWKQciPl2PTWNmM009flk/EAsz95x83/+gvXWQ6ruug4zZMZHTZa5lJkGcAaxM99jY7hHcWBLgyVtDCQch4tooFwM+eiB1BXxjOAzp8ucmZEWmZ143xH
 5a77dmMokotX5VZf8MPjzvkMtR52y7J8A3BYGXuPgwTKNOpls0zmVTeaPDc4xMUyxzKTAUK49ff9m4ZJx+zaHMvQ2inJ+xKsjx00rqymsZjdTREEC3m7KZtU
 L6rWOo11WiHiAc84gHfIqNNZTxkETk0KjRefLZTvfeXqLw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Marking this as Obsoleted in patchwork since Arnd posted an identical patch for
this already.

Regards,

	Hans

On 1/8/20 11:59 AM, Dan Carpenter wrote:
> Syzbot reported a crash in video_usercopy().  It turns out when we
> broke video_get_user() into a separate function then we accidentally
> moved it outside the if block so it tries to memset a user pointer.
> 
> Reported-by: syzbot+9240c422be249a8422bd@syzkaller.appspotmail.com
> Fixes: c8ef1a6076bf ("media: v4l2-core: split out data copy from video_usercopy")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not actually tested.  :(  Sorry.
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index b68ff06009cd..aaf83e254272 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3205,12 +3205,12 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>  			parg = mbuf;
>  		}
>  
> +		err = video_get_user((void __user *)arg, parg, orig_cmd,
> +				     &always_copy);
> +		if (err)
> +			goto out;
>  	}
>  
> -	err = video_get_user((void __user *)arg, parg, orig_cmd, &always_copy);
> -	if (err)
> -		goto out;
> -
>  	err = check_array_args(cmd, parg, &array_size, &user_ptr, &kernel_ptr);
>  	if (err < 0)
>  		goto out;
> 

