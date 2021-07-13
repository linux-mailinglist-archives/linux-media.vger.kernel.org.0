Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132B83C6CAF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 10:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbhGMIzw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 04:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234599AbhGMIzv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 04:55:51 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31249C0613DD;
        Tue, 13 Jul 2021 01:53:02 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E2EC7C64D7; Tue, 13 Jul 2021 09:52:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1626166379; bh=G/2d8fKlYxrIrlXIyG7DS5u7VSl3e6PA0spKSFRiuCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lrgc7lYLc4gcn41dqJI+og4bYsq+wTJ6k2As1pzNKfvFlPi6zw+ZFw48JX18+FsEl
         9hrUU6t0A8+Ym80jV1+ZAKdSvDOgLcE03tuSrXst1eqOd8jn/m0yxCqwVn4kHH/YW+
         gdpX296eA6h0vP6O0DQnWBMZt2J7o61d+MjnfXHuxcGwEUNFDtzOp3NH8HDVV4zPsQ
         imZJAg8qdz0GT8atWov7KV3fwpG5eAcBwFvTn/2fBIOYC1uBFoK+vunqDQP2owGmIl
         x/Jra06jmSh8Kf+JvZnI0pMDLNMelo1TWfNZ43DioxhdMMyOWte8P0wFTUBSIamA5K
         OUVRJ8Uj0Oyhg==
Date:   Tue, 13 Jul 2021 09:52:59 +0100
From:   Sean Young <sean@mess.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3 v2] media: dvb-usb: break long strings in
 dvb_usb_device_init
Message-ID: <20210713085259.GB6572@gofer.mess.org>
References: <20210621113959.53320-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621113959.53320-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 21, 2021 at 07:39:59PM +0800, Dongliang Mu wrote:
> Break long strings into multiple lines.
> 
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/dvb-usb-init.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> index 28e1fd64dd3c..edc477cedaa9 100644
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -286,13 +286,15 @@ int dvb_usb_device_init(struct usb_interface *intf,
>  
>  	desc = dvb_usb_find_device(udev, &d->props, &cold);
>  	if (!desc) {
> -		deb_err("something went very wrong, device was not found in current device list - let's see what comes next.\n");
> +		deb_err("something went very wrong, "
> +			"device was not found in current device list.\n");

Long lines are acceptable unto 100 columns or more if they are string
constants.  Breaking them up does not increase readability.

>  		ret = -ENODEV;
>  		goto error;
>  	}
>  
>  	if (cold) {
> -		info("found a '%s' in cold state, will try to load a firmware", desc->name);
> +		info("found a %s in cold state, will try to load a firmware",
> +		     desc->name);

No reason for removing the quotes, I think.

>  		ret = dvb_usb_download_firmware(udev, props);
>  		if (!props->no_reconnect || ret != 0)
>  			goto error;
> @@ -314,7 +316,7 @@ int dvb_usb_device_init(struct usb_interface *intf,
>  	if (du)
>  		*du = d;
>  
> -	info("%s successfully initialized and connected.", desc->name);
> +	info("%s is successfully initialized and connected.", desc->name);

"is" doesn't really add anything here, and the message is fine without it.

>  	return 0;
>  
>   error:
> -- 
> 2.25.1
