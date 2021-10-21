Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3866435DC1
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 11:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhJUJSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 05:18:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbhJUJSK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 05:18:10 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7ADAF2BA;
        Thu, 21 Oct 2021 11:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634807753;
        bh=T/6+QgMuTTHfslB/SXTR1IyVTkqXdr+Skb2LtMWzDTI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=P6XdrXyUKzvqFCUwcM8LXHPj2X6/TuHR8ytYg9gTdM6SsHaJXFV8+gdEe5J8J+Dks
         gsSPOyTMUnvqVAtQB40nfG8S2zU/cXVUOh1Bz6wwNbYNq6j2eaqiK+kAdc6wd3bpfO
         qdKWuTzYEA4mOJt0OUiRQaPA8V/HcoaBR5NnZwIQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211021084143.2077-1-caihuoqing@baidu.com>
References: <20211021084143.2077-1-caihuoqing@baidu.com>
Subject: Re: [PATCH] media: gspca: Make use of the helper macro kthread_run()
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Erik Andren <erik.andren@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To:     caihuoqing@baidu.com
Date:   Thu, 21 Oct 2021 10:15:50 +0100
Message-ID: <163480775070.2663858.11003042338981812432@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai,

Quoting Cai Huoqing (2021-10-21 09:41:42)
> Repalce kthread_create/wake_up_process() with kthread_run()
> to simplify the code.
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

kthread_run does look appropriate here, and is simpler.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/usb/gspca/m5602/m5602_s5k83a.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/usb/gspca/m5602/m5602_s5k83a.c b/drivers/media=
/usb/gspca/m5602/m5602_s5k83a.c
> index bc4008d5d116..4504d615b1e4 100644
> --- a/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
> +++ b/drivers/media/usb/gspca/m5602/m5602_s5k83a.c
> @@ -339,14 +339,13 @@ int s5k83a_start(struct sd *sd)
>         /* Create another thread, polling the GPIO ports of the camera to=
 check
>            if it got rotated. This is how the windows driver does it so w=
e have
>            to assume that there is no better way of accomplishing this */
> -       sd->rotation_thread =3D kthread_create(rotation_thread_function,
> -                                            sd, "rotation thread");
> +       sd->rotation_thread =3D kthread_run(rotation_thread_function,
> +                                         sd, "rotation thread");
>         if (IS_ERR(sd->rotation_thread)) {
>                 err =3D PTR_ERR(sd->rotation_thread);
>                 sd->rotation_thread =3D NULL;
>                 return err;
>         }
> -       wake_up_process(sd->rotation_thread);
> =20
>         /* Preinit the sensor */
>         for (i =3D 0; i < ARRAY_SIZE(start_s5k83a) && !err; i++) {
> --=20
> 2.25.1
>
