Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166E13E9A9A
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 23:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhHKVyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 17:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbhHKVyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 17:54:49 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3EAC061765;
        Wed, 11 Aug 2021 14:54:25 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B55E7C63FA; Wed, 11 Aug 2021 22:54:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1628718861; bh=wP+KfV1K5Aheg65Q3eew3Tf/ttId206mNOCxpxd/k14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sKpPyjT6eyd2CJkNT1y9K7fKiIq7U/WLse0MX6NRuaZAoz+3xpcz4JBVeSXVF2lQA
         d+qJ2KORoXRKNndWJYgD/5g6FyQeZhH7NOOhtbufBwJBaGpg9Nb41ncS0vh/Ljxv7k
         adzmvkG91v95tnboW2LNJZLLgnylkfyozCcupoUK1jQm+yHSTHI75Imh+AVpRD3oiP
         1RXjrqz91/UHbWoiVYnGfzOR6+L5NwAWNlEJ5TYSnUgwlSPB6pLZy1hDXOr0TrtQeX
         ZgbSYmd1ptiI4+7HbeLMCK13ZbGxCatGLxYgi9u8qzGk2ZEU6+LZM39PHH/GfHi+Ys
         MC6LZDYhDb4uA==
Date:   Wed, 11 Aug 2021 22:54:21 +0100
From:   Sean Young <sean@mess.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mchehab@kernel.org, tomimo@ncircle.nullnet.fi,
        thierry.merle@free.fr, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] media: dvb-usb: fix memory leak in
 cinergyt2_frontend_attach
Message-ID: <20210811215421.GA28513@gofer.mess.org>
References: <20210620202317.4338-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210620202317.4338-1-paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 20, 2021 at 11:23:17PM +0300, Pavel Skripkin wrote:
> My local syzbot instance hit a memory leak in
> cinergyt2_frontend_attach() [1].
> 
> The problem was in non-freed dvb_frontend in case of error.
> If dvb_usb_generic_rw() call fails, an error will be returned from
> cinergyt2_frontend_attach() [1] and num_adapters_initialized of
> dvb_usb_device won't be incremented. That means dvb usb library
> won't take care of freeing allocated frontend.

This issue is already fixed by:

9ad1efee086e0 media: dvd_usb: memory leak in cinergyt2_fe_attach

Thanks for reporting and making a patch though.


Sean

> 
> Fail log:
> BUG: memory leak
> unreferenced object 0xffff88801d9c6000 (size 2048):
>   comm "kworker/1:3", pid 2960, jiffies 4295150569 (age 17.150s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 54 65 72 72 61 54 65 63  ........TerraTec
>     2f 71 61 6e 75 20 55 53 42 32 2e 30 20 48 69 67  /qanu USB2.0 Hig
>   backtrace:
>     [<ffffffff85e169f0>] kmalloc include/linux/slab.h:556 [inline]
>     [<ffffffff85e169f0>] kzalloc include/linux/slab.h:686 [inline]
>     [<ffffffff85e169f0>] cinergyt2_fe_attach+0x40/0x110 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
>     [<ffffffff85e15b31>] cinergyt2_frontend_attach+0x61/0x140 drivers/media/usb/dvb-usb/cinergyT2-core.c:74 [1]
>     [<ffffffff85dcd71e>] dvb_usb_adapter_frontend_init+0x35e/0x5b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
>     [<ffffffff88f98e83>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:90 [inline]
>     [<ffffffff88f98e83>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
> 
> Fixes: 986bd1e58b18 ("V4L/DVB (9107): Alternative version of Terratec Cinergy T2
> driver")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/media/usb/dvb-usb/cinergyT2-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c b/drivers/media/usb/dvb-usb/cinergyT2-core.c
> index 969a7ec71dff..fb60af097535 100644
> --- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
> +++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
> @@ -79,6 +79,7 @@ static int cinergyt2_frontend_attach(struct dvb_usb_adapter *adap)
>  	ret = dvb_usb_generic_rw(d, st->data, 1, st->data, 3, 0);
>  	if (ret < 0) {
>  		deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
> +		kfree(adap->fe_adap[0].fe);
>  	}
>  	mutex_unlock(&d->data_mutex);
>  
> -- 
> 2.32.0
