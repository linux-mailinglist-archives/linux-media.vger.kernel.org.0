Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BE7309D3E
	for <lists+linux-media@lfdr.de>; Sun, 31 Jan 2021 16:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhAaOyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jan 2021 09:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhAaOyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jan 2021 09:54:09 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4ACC061574;
        Sun, 31 Jan 2021 06:53:23 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8DECAC6357; Sun, 31 Jan 2021 14:53:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1612104800; bh=X8rP5fspzQTYIsOdgLeiCqmrLVJyKPVbGH5ucszGtwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cxqSca4WhQW5QCsUT0C6hfxeixbt/VFhhZdcj9aCKZTZH6AUVbNRkOxfeHRfR5dfx
         ZmdgDht+lWtaDY3pdGqRI3R4RbbVspDrk0DdyJZoHNeWyxkRy+Sqf8XkLNh5O48aS5
         RHZHUmBDIXH2yo2DqNi3+SHcGXton9xspsLMut0zrD/eOVJdVDab4EVw1C4JLm38QF
         vA9wtnFmTf0k3o0b6rHXihlq++9fH/4UNng4uYXGjTEWnL012GT6qygyyMwZZjmP/N
         0Qf1HtQ2OO3ZY1W30fUG9cq81qqgSrypKmlYUUlvuuLo6W94+W3y5V7FKMMQ0q3S+E
         FPvHASs+nPmTg==
Date:   Sun, 31 Jan 2021 14:53:20 +0000
From:   Sean Young <sean@mess.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Seyfried <seife+kernel@b1-systems.com>
Subject: Re: [PATCH 1/2] media: dvb-usb: Fix memory leak at error in
 dvb_usb_device_init()
Message-ID: <20210131145320.GA4886@gofer.mess.org>
References: <20210120102057.21143-1-tiwai@suse.de>
 <20210120102057.21143-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120102057.21143-2-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 11:20:56AM +0100, Takashi Iwai wrote:
> dvb_usb_device_init() allocates a dvb_usb_device object, but it
> doesn't release it even when returning an error.  The callers don't
> seem caring it as well, hence those memories are leaked.
> 
> This patch assures releasing the memory at the error path in
> dvb_usb_device_init().  Also it makes sure that USB intfdata is reset
> and don't return the bogus pointer to the caller at the error path,
> too.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/media/usb/dvb-usb/dvb-usb-init.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> index c1a7634e27b4..5befec87f26a 100644
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -281,15 +281,21 @@ int dvb_usb_device_init(struct usb_interface *intf,
>  
>  	usb_set_intfdata(intf, d);
>  
> -	if (du != NULL)
> +	ret = dvb_usb_init(d, adapter_nums);

dvb_usb_init() has different errors paths. 

1. It can return -ENOMEM if it cannot kzalloc(). No other side affects.
2. It can return an error if dvb_usb_i2c_init() or dvb_usb_adapter_init()
   fails. In this case, dvb_usb_exit() is called, which frees 
   struct dvb_usb_device*

In the last case we now have a double free.


Sean

> +	if (ret) {
> +		info("%s error while loading driver (%d)", desc->name, ret);
> +		goto error;
> +	}
> +
> +	if (du)
>  		*du = d;
>  
> -	ret = dvb_usb_init(d, adapter_nums);
> +	info("%s successfully initialized and connected.", desc->name);
> +	return 0;
>  
> -	if (ret == 0)
> -		info("%s successfully initialized and connected.", desc->name);
> -	else
> -		info("%s error while loading driver (%d)", desc->name, ret);
> + error:
> +	usb_set_intfdata(intf, NULL);
> +	kfree(d);
>  	return ret;
>  }
>  EXPORT_SYMBOL(dvb_usb_device_init);

> -- 
> 2.26.2
