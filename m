Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CE327D342
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 18:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729519AbgI2QA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 12:00:59 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:44026 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbgI2QA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 12:00:59 -0400
Received: from [192.168.42.210] ([93.22.37.244])
        by mwinf5d16 with ME
        id Zs0w2300E5G3HaM03s0wn5; Tue, 29 Sep 2020 18:00:57 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 29 Sep 2020 18:00:57 +0200
X-ME-IP: 93.22.37.244
Subject: Re: [PATCH 10/20] media: lmedm04: use semicolons rather than commas
 to separate statements
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Malcolm Priestley <tvboxspy@gmail.com>
Cc:     =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
 <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
Date:   Tue, 29 Sep 2020 18:00:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le 29/09/2020 à 15:14, Julia Lawall a écrit :
> Replace commas with semicolons.  Commas introduce unnecessary
> variability in the code structure and are hard to see.  What is done
> is essentially described by the following Coccinelle semantic patch
> (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> index 5a7a9522d46d..9ddda8d68ee0 100644
> --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> @@ -391,7 +391,7 @@ static int lme2510_int_read(struct dvb_usb_adapter *adap)
>   	ep = usb_pipe_endpoint(d->udev, lme_int->lme_urb->pipe);
>   
>   	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
> -		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa),
> +		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa);
>   
>   	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
>   	info("INT Interrupt Service Started");
> 
> 
Ouch!

This one looks like a real issue!

CJ
