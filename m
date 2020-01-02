Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8EBF12E3A7
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2020 09:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgABIJd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 03:09:33 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:53653 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727714AbgABIJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jan 2020 03:09:32 -0500
X-Originating-IP: 82.61.57.109
Received: from uno.localdomain (host109-57-dynamic.61-82-r.retail.telecomitalia.it [82.61.57.109])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E0168240002;
        Thu,  2 Jan 2020 08:09:28 +0000 (UTC)
Date:   Thu, 2 Jan 2020 09:11:39 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] media: mt9v111: constify copied structure
Message-ID: <20200102081139.omdtomdecbbl4l42@uno.localdomain>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
 <1577864614-5543-7-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cyu25jnciggoxa63"
Content-Disposition: inline
In-Reply-To: <1577864614-5543-7-git-send-email-Julia.Lawall@inria.fr>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cyu25jnciggoxa63
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Julia,
   thanks for the patch

On Wed, Jan 01, 2020 at 08:43:24AM +0100, Julia Lawall wrote:
> The mt9v111_def_fmt structure is only copied into another structure,
> so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
> ---
>  drivers/media/i2c/mt9v111.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index bb41bea950ac..61ae6a0d5679 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -103,7 +103,7 @@
>  #define MT9V111_MAX_CLKIN				27000000
>
>  /* The default sensor configuration at startup time. */
> -static struct v4l2_mbus_framefmt mt9v111_def_fmt = {
> +static const struct v4l2_mbus_framefmt mt9v111_def_fmt = {
>  	.width		= 640,
>  	.height		= 480,
>  	.code		= MEDIA_BUS_FMT_UYVY8_2X8,
>

--cyu25jnciggoxa63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl4NpbsACgkQcjQGjxah
VjxWAw/7BXbE2ajrCEdQEVdH+Mvd31VIHw+dUwHxWlz68PxEH4fwHbZmTdNX3AJ4
lXqW/E/YpeuKv/4PkuKdU5Sm6mrIC4AoEU0Mxkac9ih1Zhr1xTNudhgmoeytOrH3
vcA5Qx+3feHHvebZ8gZWAOaRnSo0C1YAOgW0Yy9lGFY40suxHABQ8h37Mss2hh/Q
0IZTa/nQIUUzNDFvJM2lxrm3Di8z9yqFFVrmiVZKbPuUc+t6LjqlB9LrX7X2NJny
JQLBM6jHmZ7/WJjZDGc5asREk0LP19VgfOgeibW+EjQ1FwPVnsg1K6KY0RcZ3wtW
qXwSa/6yeYXJFxX3igNhLgrTzy+lzMedKnijf/g4A0XjA9rOzjW6qpZQAIEybFvb
5YQuIScZ83ZG0Hlkfus1rMrHhccRv6aXIjVc4dre/1Dr+iFWCEgDLsPC+iOdXqxC
UrSejcypZBx/kMs+F6sgAdeyxKhwYaKnX+mNZbTodMPffSrdSPdc8JpgXeEMPQtQ
T+VbHJ+ZP4U9Ey8QzWbMV6SJa3g923kBN2BY1hU8f7vpStM8H/w/Yz5AEkLLjJS7
jWtuy3ad+CHh5i0ud47cS5iXXsVJZCoFe/fpZKFIUJHexX4PBXYNA4j1sLDALLt/
zrU0yg/3adK03trBxx2JOheLIgx2uq/U/Ys+pQ27NeSjZoZPWa8=
=xj3Z
-----END PGP SIGNATURE-----

--cyu25jnciggoxa63--
