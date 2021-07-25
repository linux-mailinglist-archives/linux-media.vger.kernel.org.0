Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE273D4DCC
	for <lists+linux-media@lfdr.de>; Sun, 25 Jul 2021 15:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhGYNHK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 09:07:10 -0400
Received: from gofer.mess.org ([88.97.38.141]:55723 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230029AbhGYNHJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 09:07:09 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EB1D4C65B2; Sun, 25 Jul 2021 14:47:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1627220858; bh=pO9696ntfxuCB+qciCrqbjHKSDHinXHecTlQCtVMKeg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tFokr1bhf6S9DsgrnueRD3pzaXEWiexqO0FVOue2LRo6uuMX9ukgNuJJgs9PFptkY
         AkyAePdgtOOBwWtnb9kWdNvKXbiaDIxAS09xslwLI02zjECbBQGGyWsr/SiwQ3q7zn
         Cvfq5NilzM2rtePfY2IgcSuhfCmravKOEADecmQHYUp7MouHOIQCnWZ9gv788V2+rU
         91dujfNK6qvqIO2nOc01hRVD97LztX71TCWWBKulV+RXK1mhI85C80qoT0oan7Ky14
         U+jTqM3ZQoEDtzsrPe6rDItiOnhR/ckWqXTuTw3FlBSjVl6jVGzqNcnIU0k0Web/Jc
         Lt6Ol8O+25rBA==
Date:   Sun, 25 Jul 2021 14:47:37 +0100
From:   Sean Young <sean@mess.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: dvb-usb: move kfree(d) to dvb_usb_device_exit
Message-ID: <20210725134737.GA9696@gofer.mess.org>
References: <20210621050729.3898275-1-mudongliangabcd@gmail.com>
 <20210621050729.3898275-2-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621050729.3898275-2-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 21, 2021 at 01:07:27PM +0800, Dongliang Mu wrote:
> As d is allocated in dvb_usb_device_init, so move to the deallocation of
> d from dvb_usb_exit to dvb_usb_device_exit

There is nothing wrong with this patch, however I'm not sure what this
improves though. The code is just as good/messy as before, is it not?

Sean

> 
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/dvb-usb-init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> index edc477cedaa9..21ad51be4820 100644
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -147,7 +147,6 @@ static int dvb_usb_exit(struct dvb_usb_device *d)
>  		d->props.priv_destroy(d);
>  
>  	kfree(d->priv);
> -	kfree(d);
>  	return 0;
>  }
>  
> @@ -333,9 +332,10 @@ void dvb_usb_device_exit(struct usb_interface *intf)
>  	char name[40];
>  
>  	usb_set_intfdata(intf, NULL);
> -	if (d != NULL && d->desc != NULL) {
> +	if (d && d->desc) {
>  		strscpy(name, d->desc->name, sizeof(name));
>  		dvb_usb_exit(d);
> +		kfree(d);
>  	} else {
>  		strscpy(name, default_name, sizeof(name));
>  	}
> -- 
> 2.25.1
