Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67A238FAC8
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 08:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhEYGVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 02:21:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230509AbhEYGVb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 02:21:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1528A61409;
        Tue, 25 May 2021 06:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621923602;
        bh=pZte7A544Ja11bu7ye2ggOgy7fArcTgJxzGJ9g9SEVg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lyJ04Pn6UHaCJrEUyspICy1pehxxALfea5ZjtOv6nxSRzsVpAG3PZn3RhQf0ekqRr
         yZiR3ppqqspa9e9AAHwwKCUKaX13pjHoFIcoVns3KmvcUJoMdZ1HXpjm22xo8hyLSu
         N7zbeEhSTA0IrdmayDBZmJUNL2Eh3+l2H2jrbil9d3TU4pC+Dyewv/s5ImslqxstKG
         RC8WondfAY7hrCmowjpImaJerRhOaQqUOOcGSDkKLheD0E1Fjdy+sEu8SIIT4l7J6D
         GLvZG9CSDl4t0y9/XYHPf0GY83YFHhzpdJx1jZjONwS9g3gzVpAYjelN8R2gBV+Erc
         AIRnw+zT29jGg==
Date:   Tue, 25 May 2021 08:19:58 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: dvd_usb: memory leak in cinergyt2_fe_attach
Message-ID: <20210525081958.22f1e2b6@coco.lan>
In-Reply-To: <20210525053359.1147899-1-mudongliangabcd@gmail.com>
References: <20210525053359.1147899-1-mudongliangabcd@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 25 May 2021 13:33:59 +0800
Dongliang Mu <mudongliangabcd@gmail.com> escreveu:

> When cinergyt2_frontend_attach returns a negative value, the allocation
> is already successful, but in the error handling, there is no any clean
> corresponding operation, which leads to memory leak.
> 
> Fix it by freeing struct cinergyt2_fe_state when the return value is
> nonzero.
> 
> backtrace:
>   [<0000000056e17b1a>] kmalloc include/linux/slab.h:552 [inline]
>   [<0000000056e17b1a>] kzalloc include/linux/slab.h:682 [inline]
>   [<0000000056e17b1a>] cinergyt2_fe_attach+0x21/0x80 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
>   [<00000000ae0b1711>] cinergyt2_frontend_attach+0x21/0x70 drivers/media/usb/dvb-usb/cinergyT2-core.c:74
>   [<00000000d0254861>] dvb_usb_adapter_frontend_init+0x11b/0x1b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
>   [<0000000002e08ac6>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:84 [inline]
>   [<0000000002e08ac6>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
>   [<0000000002e08ac6>] dvb_usb_device_init.cold+0x4d0/0x6ae drivers/media/usb/dvb-usb/dvb-usb-init.c:287
> 
> Reported-by: syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
> index 0a7f8ba90992..f9f004fb0a92 100644
> --- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
> @@ -288,7 +288,7 @@ int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
>  		}
>  
>  		ret = adap->props.fe[i].frontend_attach(adap);
> -		if (ret || adap->fe_adap[i].fe == NULL) {
> +		if (adap->fe_adap[i].fe == NULL) {
>  			/* only print error when there is no FE at all */
>  			if (i == 0)
>  				err("no frontend was attached by '%s'",
> @@ -297,6 +297,12 @@ int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
>  			return 0;
>  		}
>  
> +		if (ret) {
> +			struct dvb_frontend *fe = adap->fe_adap[i].fe;
> +
> +			fe->ops.release(fe);
> +			return 0;
> +		}
> +

Touching dvb-usb core doesn't seem the right fix here, as it will
affect all other drivers that depend on it.

Basically, when a driver returns an error, it has to cleanup
whatever it did, as the core has no way to know where the
error happened inside the driver logic.

The problem seems to be at cinergyt2_frontend_attach() instead:

	adap->fe_adap[0].fe = cinergyt2_fe_attach(adap->dev);

        mutex_lock(&d->data_mutex);
        st->data[0] = CINERGYT2_EP1_GET_FIRMWARE_VERSION;

        ret = dvb_usb_generic_rw(d, st->data, 1, st->data, 3, 0);
        if (ret < 0) {
                deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
        }
        mutex_unlock(&d->data_mutex);

        /* Copy this pointer as we are gonna need it in the release phase */
        cinergyt2_usb_device = adap->dev;

        return ret;

See, this driver returns an error if it fails to talk with the hardware
when it calls dvb_usb_generic_rw(). Yet, it doesn't cleanup its own mess,
as it keeps the frontend attached. The right fix would be to call 
cinergyt2_fe_release() if ret < 0.

E. g., the above code should be, instead:

	if (ret < 0) {
		fe->ops.release(adap->fe_adap[0].fe);
                deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
        }

Thanks,
Mauro
