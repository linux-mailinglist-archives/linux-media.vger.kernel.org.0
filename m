Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA7042EF4D
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 13:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238280AbhJOLJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 07:09:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52170 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238259AbhJOLJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 07:09:10 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F71B2E3;
        Fri, 15 Oct 2021 13:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634296022;
        bh=amkA06umxvSECXjb9aZ7y/nd9ttEC/OesNP1AwpyebI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OLWmeljTLC9pa83WPUuOn2inGemuxIEoLt2ja0YQkM4NFQDBdL5+ZBBsZyxV/y9lP
         eBa7LQ9bcfRdW8jS2jrZBYvstKL+StzhZMvLUfNjDVXtRu/VNOyBwLa1N62LAw1b7P
         dzjfOG1s9CT8hkftx52BVq6MgJBhJH4eLTmb73uA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211014153253.63527-1-colin.king@canonical.com>
References: <20211014153253.63527-1-colin.king@canonical.com>
Subject: Re: [PATCH] media: dvb-frontends/stv0367: remove redundant variable ADCClk_Hz
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Colin King <colin.king@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Date:   Fri, 15 Oct 2021 12:07:00 +0100
Message-ID: <163429602007.4164224.1831603223744451959@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Colin King (2021-10-14 16:32:53)
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Variable ADCClk_Hz is being initialised with a variable that is never read
> and then re-assigned immediately afterwards. Clean up the code by removing
> it and just returning the return value from the call to stv0367cab_get_mc=
lk
>=20

Indeed LGTM.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/dvb-frontends/stv0367.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/dvb-frontends/stv0367.c b/drivers/media/dvb-fr=
ontends/stv0367.c
> index 6c2b05fae1c5..95e376f23506 100644
> --- a/drivers/media/dvb-frontends/stv0367.c
> +++ b/drivers/media/dvb-frontends/stv0367.c
> @@ -1797,11 +1797,7 @@ static u32 stv0367cab_get_mclk(struct dvb_frontend=
 *fe, u32 ExtClk_Hz)
> =20
>  static u32 stv0367cab_get_adc_freq(struct dvb_frontend *fe, u32 ExtClk_H=
z)
>  {
> -       u32 ADCClk_Hz =3D ExtClk_Hz;
> -
> -       ADCClk_Hz =3D stv0367cab_get_mclk(fe, ExtClk_Hz);
> -
> -       return ADCClk_Hz;
> +       return stv0367cab_get_mclk(fe, ExtClk_Hz);
>  }
> =20
>  static enum stv0367cab_mod stv0367cab_SetQamSize(struct stv0367_state *s=
tate,
> --=20
> 2.32.0
>
