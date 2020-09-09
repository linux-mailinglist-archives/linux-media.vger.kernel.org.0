Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B856F2633D0
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 19:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbgIIRKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 13:10:50 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51023 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727976AbgIIPfE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 11:35:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id G14wkjX7EXgwIG14xkZkWe; Wed, 09 Sep 2020 16:28:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599661688; bh=+xRI7RCVjWPFLjTuzSdpKFeCB3MzDQJw+96p0B8ybuQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GhZMVx7pRGfoeYUSkx+6M0RckAcR1G9X/4Z1Z7eKsxh9pkUJuKeQkeHnsrDfozlB7
         fV1d5JNDKC61U1UFhVchtDeVN3NaJxdVdmFBRbzDoyaTDB8l/K0yYz0oj0ZT1MCIO6
         TOfNLINWQVC4n7rQq5AThsjvsPmygt8tmZ6ll8qlBvgzZCimKb1VEIbmhreGVeoZTc
         fLZ85a/y1BBSAcV5fczOpK5HQ0Wpv0QjvKH4qfdMYKaH41yINXEpkBQbb4X740v1KB
         1CBv6JL9Qk9JzlYLkmNnMgMdcqeBHT8YuVDaq/HZBogfWRz55VpFtTsfwvyi9gn47y
         hxuBCrPmakEBw==
Subject: Re: [PATCH] media: em28xx: fix function pointer check
To:     trix@redhat.com, mchehab@kernel.org, natechancellor@gmail.com,
        ndesaulniers@google.com, brad@nextdimension.cc, mkrufky@linuxtv.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20200903145038.20076-1-trix@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <65584276-f49c-15c9-5f20-a4e5f5fe5085@xs4all.nl>
Date:   Wed, 9 Sep 2020 16:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903145038.20076-1-trix@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK0x4z69G0pcN0tTyBl9g89oLI40CCA1Pcs6+GL8aCFjhEJWXG1+Fp/IEtwiTOlOPLh63xcX/ctPdCy/4klHm+VaxJzPhy+afVtZY62B2TEirP2HL1qf
 YV/AfjMvr86y2vsJj//XYI3hm8N57Og9gM30h6lUlp9j+94aX/BSkc5DzA9hJF/3Qzqy9zCQ2ovoCZoX2oN/ynVm+bMoVvJ9mXoVw+dS/ECWlUZyTyT6ZQNG
 qmBqg4DFcYXVSz1HLXcvyXQ66fz50w5zNVJHdbMzE7xTrxHlFUNBdDwvLckTvbRQD6RRu+iMx2jKZXBYlM0LMusm6z0Wdly4uY25757jT6wJ2Uvj2JkKoVtL
 7EDr/cykZK+ssUldtBs17BGk7XZd/V8fH3hbcuEj6MNvlB5nu1LS5L1STLA37L14Yy8bl24HxIWRRTG39hvNz52p1+OOU5c88TW/YguYpjq2c954K2MQYryY
 c2dSOckvGMqKK5W1okBJ3RE/UfoNy3pDnj3oJW/UcNb5ekMesMT7V+U1gJF+dEagNWHtMPX+ioSIEW7ERdqOYadyQ5DTAHQpFRXKVA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/09/2020 16:50, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analyzer reports this problem
> 
> em28xx-core.c:1162:4: warning: Called function pointer
>   is null (null dereference)
>         ops->suspend(dev->dev_next);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is the problem block
> 
> 	if (ops->suspend)
> 		ops->suspend(dev);
> 	if (dev->dev_next)
> 		ops->suspend(dev->dev_next);
> 
> The check for ops->suspend only covers one statement.
> So fix the check consistent with other similar in
> the file.
> 
> Change a similar check in em28xx_resume_extension()
> to use consistent logic as its siblings.
> 
> Fixes: be7fd3c3a8c5 ("media: em28xx: Hauppauge DualHD second tuner functionality")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/media/usb/em28xx/em28xx-core.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
> index e6088b5d1b80..d60f4c2a661d 100644
> --- a/drivers/media/usb/em28xx/em28xx-core.c
> +++ b/drivers/media/usb/em28xx/em28xx-core.c
> @@ -1156,10 +1156,11 @@ int em28xx_suspend_extension(struct em28xx *dev)
>  	dev_info(&dev->intf->dev, "Suspending extensions\n");
>  	mutex_lock(&em28xx_devlist_mutex);
>  	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
> -		if (ops->suspend)
> +		if (ops->suspend) {
>  			ops->suspend(dev);
> -		if (dev->dev_next)
> -			ops->suspend(dev->dev_next);
> +			if (dev->dev_next)
> +				ops->suspend(dev->dev_next);
> +		}
>  	}
>  	mutex_unlock(&em28xx_devlist_mutex);
>  	return 0;
> @@ -1172,11 +1173,11 @@ int em28xx_resume_extension(struct em28xx *dev)
>  	dev_info(&dev->intf->dev, "Resuming extensions\n");
>  	mutex_lock(&em28xx_devlist_mutex);
>  	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
> -		if (!ops->resume)
> -			continue;

Actually, this code is fine: if !ops->resume, then just continue.

So there is no need to change this resume code.

And in fact, I think it would be best if the same approach was used in
em28xx_suspend_extension.

Regards,

	Hans

> -		ops->resume(dev);
> -		if (dev->dev_next)
> -			ops->resume(dev->dev_next);
> +		if (ops->resume) {
> +			ops->resume(dev);
> +			if (dev->dev_next)
> +				ops->resume(dev->dev_next);
> +		}
>  	}
>  	mutex_unlock(&em28xx_devlist_mutex);
>  	return 0;
> 

