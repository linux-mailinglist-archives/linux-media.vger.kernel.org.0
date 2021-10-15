Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73BCC42EF6C
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 13:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238256AbhJOLOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 07:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhJOLOb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 07:14:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1708C061570;
        Fri, 15 Oct 2021 04:12:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 714062E3;
        Fri, 15 Oct 2021 13:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634296343;
        bh=uynZabXZy8nfj/k/5uQB3ukn1EYdSOycveOzbdcINP8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rAmuAb8yHDL15D8KxoZTtm6i60MM2L+sydajRhUETQbJvbbeZ8XSmSdJM80LjzI/J
         R9S2qAJ8n6Sq/0UjLpmapaCYOVgtqTHxfvC9Hmcy17AHm6NiOOXm/e8ZdZubwLd7MG
         YkLvPrAuAmz/jSZOVRaegyZnHbU5L3lepJPBAKqQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211012221144.30638-1-rikard.falkeborn@gmail.com>
References: <20211012221144.30638-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] staging: media: rkvdec: Constify static struct v4l2_m2m_ops
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Date:   Fri, 15 Oct 2021 12:12:20 +0100
Message-ID: <163429634048.4171071.2327108342733912267@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Rikard Falkeborn (2021-10-12 23:11:44)
> The only usage of rkvdec_m2m_ops is to pass its address to v4l2_m2m_init(=
),
> which takes a pointer to const v4l2_m2m_ops as argument. Make it const
> to allow the compiler to put it in read-only memory.
>=20
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/medi=
a/rkvdec/rkvdec.c
> index bf00fe6534a3..28aab5c7fe33 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -677,7 +677,7 @@ static void rkvdec_device_run(void *priv)
>                 rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  }
> =20
> -static struct v4l2_m2m_ops rkvdec_m2m_ops =3D {
> +static const struct v4l2_m2m_ops rkvdec_m2m_ops =3D {
>         .device_run =3D rkvdec_device_run,
>  };
> =20
> --=20
> 2.33.0
>
