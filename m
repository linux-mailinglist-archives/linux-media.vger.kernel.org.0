Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FD12BC707
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 17:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgKVQb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 11:31:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:52608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728034AbgKVQb4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 11:31:56 -0500
Received: from coco.lan (ip5f5ad5ca.dynamic.kabel-deutschland.de [95.90.213.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF72A20781;
        Sun, 22 Nov 2020 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606062716;
        bh=g/VMqJGooMoX5AWFrOayNxrsrT0sKYN97bodLDhKmjE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LN8DVVPwU6a0aCc1yebnLY6lcs6WsG+oQkIWvaC8oJCCJyrHso8B7C3QuAKoyvwP7
         eHiCGBjqyoDpYgHM+z943FJ+clnw1hMIe9UwvMST2sdpEvYEigce6pzAnyVL92QtQ5
         zVTNoxtZ7+7Xt3hr9ujLt832UVXHu7d3JcnYPvg0=
Date:   Sun, 22 Nov 2020 17:31:52 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Antti Palosaari <crope@iki.fi>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 014/141] media: usb: dvb-usb-v2: Fix fall-through
 warnings for Clang
Message-ID: <20201122173152.1fbd8de1@coco.lan>
In-Reply-To: <173371a50a3e26a2ab39baaa6aa883f6bd416b8a.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
        <173371a50a3e26a2ab39baaa6aa883f6bd416b8a.1605896059.git.gustavoars@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 20 Nov 2020 12:26:16 -0600
"Gustavo A. R. Silva" <gustavoars@kernel.org> escreveu:

> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding a couple of break statements instead of
> just letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  drivers/media/usb/dvb-usb-v2/af9015.c  | 1 +
>  drivers/media/usb/dvb-usb-v2/lmedm04.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/af9015.c b/drivers/media/usb/dvb-usb-v2/af9015.c
> index c70b3cef3176..d33514acc2b5 100644
> --- a/drivers/media/usb/dvb-usb-v2/af9015.c
> +++ b/drivers/media/usb/dvb-usb-v2/af9015.c
> @@ -51,6 +51,7 @@ static int af9015_ctrl_msg(struct dvb_usb_device *d, struct req_t *req)
>  		if (((req->addr & 0xff00) == 0xff00) ||
>  		    ((req->addr & 0xff00) == 0xae00))
>  			state->buf[0] = WRITE_VIRTUAL_MEMORY;
> +		break;
>  	case WRITE_VIRTUAL_MEMORY:
>  	case COPY_FIRMWARE:
>  	case DOWNLOAD_FIRMWARE:
> diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> index 5a7a9522d46d..67c37fb267e3 100644
> --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> @@ -336,6 +336,7 @@ static void lme2510_int_response(struct urb *lme_urb)
>  				st->signal_level = ibuf[5];
>  				st->signal_sn = ibuf[4];
>  				st->time_key = ibuf[7];
> +				break;
>  			default:
>  				break;
>  			}



Thanks,
Mauro
