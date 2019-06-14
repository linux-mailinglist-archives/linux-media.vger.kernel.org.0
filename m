Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69B86459C4
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 12:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfFNKA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 06:00:27 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56833 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfFNKA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 06:00:26 -0400
X-Originating-IP: 37.177.88.254
Received: from uno.localdomain (unknown [37.177.88.254])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CD4C9C0002;
        Fri, 14 Jun 2019 10:00:20 +0000 (UTC)
Date:   Fri, 14 Jun 2019 12:01:33 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>,
        Libin Yang <lbyang@marvell.com>,
        Albert Wang <twang13@marvell.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v5 03/10] [media] marvell-ccic: don't generate EOF on
 parallel bus
Message-ID: <20190614100133.euxhdaktlemnd2ep@uno.localdomain>
References: <20190505140031.9636-1-lkundrak@v3.sk>
 <20190505140031.9636-4-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mmzrrql2dydy5u5w"
Content-Disposition: inline
In-Reply-To: <20190505140031.9636-4-lkundrak@v3.sk>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mmzrrql2dydy5u5w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Lubomir,

On Sun, May 05, 2019 at 04:00:24PM +0200, Lubomir Rintel wrote:
> The commit 05fed81625bf ("[media] marvell-ccic: add MIPI support for
> marvell-ccic driver") that claimed to add CSI2 turned on C0_EOF_VSYNC for
> parallel bus without a very good explanation.
>
> That broke camera on OLPC XO-1.75 which precisely uses a sensor on a
> parallel bus. Revert that chunk.
>
> Tested on an OLPC XO-1.75.
>
> Fixes: 05fed81625bf755cc67c5864cdfd18b69ea828d1

Use the proper fixes format here
Fixes: 05fed81625bf ("[media] marvell-ccic: add MIPI support for marvell-ccic driver")

I have this simple entry in my git config:

[pretty]
	fixes = Fixes: %h (\"%s\")

With
        abbrev=12

in the [core] section.

You can now
$git show 05fed81625bf755cc67c5864cdfd18b69ea828d1 --pretty=fixes

> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  drivers/media/platform/marvell-ccic/mcam-core.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> index d97f39bde9bd6..d24e5b7a3bc52 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> @@ -792,12 +792,6 @@ static void mcam_ctlr_image(struct mcam_camera *cam)
>  	 * Make sure it knows we want to use hsync/vsync.
>  	 */
>  	mcam_reg_write_mask(cam, REG_CTRL0, C0_SIF_HVSYNC, C0_SIFM_MASK);
> -	/*
> -	 * This field controls the generation of EOF(DVP only)
> -	 */
> -	if (cam->bus_type != V4L2_MBUS_CSI2_DPHY)
> -		mcam_reg_set_bit(cam, REG_CTRL0,
> -				C0_EOF_VSYNC | C0_VEDGE_CTRL);

This change seems in facts unrelated to the original patch. As you
remove all usages of C0_EOF_VSYNC and C0_VEDGE_CTRL you can drop their
definition in mcam-core.h.

As I've said, the change seems unrelated to CSI-2 support and could
probably be salfey dropped, but pay attention, you're also dropping
C0_VEDGE_CTRL, which seems to enable VSYNC detection on the signal
falling edge. Is this intentional ?

Thanks
   j

>  }
>
>
> --
> 2.21.0
>

--mmzrrql2dydy5u5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0DcH0ACgkQcjQGjxah
VjyxcRAAoBs1nLSqKz9dDuh1ExoER+gBlhUSp11xMqI770WvPzLLiSgVImxYpd3f
JfLjOEzypnmiitZ8+V6+erHY0uTNnQaVgeaZpkLSe+uLBNqxzcMioFWoxBEgPDSq
Uo1GYLMJ/bXEb2gmgH2/5EOjLME6fGyOlsUbU//ft0eAvOmS8qTA3z1cmvpRfume
a+e2qav1MUXZ5EoImgWSSjn6YS8Epr96uKWg+lmoYzUaSuFJ8MvY7dc9Cq+yn5lz
EVDCHkA7JMvfA6j1sbiPMwN+kB1QCKp8c2+IfQFQAo2A/M7MyYOl9oz45YOkqNKL
Ub6olMo3EN6ZRePt2ooFLOuUJNLwnbgB4g4TQ8QlNW1dMrT0D2eRZw01sw6Sh6Qu
xqmfrf9Jgjei1epV1/8KPNBUOTs/tr/AJGn00SSgpd/TcSnXTguPGZbkhvxs/1Un
8A2pF8y1pR8l3FDbGkwWg1HzcbReyVrPmpTG2F+Z72SGAVsDDmOfapRi9++1owNf
DTNjRshLw2fjmjFvrTgdyKEPJ7ENv1I57CLC7OdkdPf4uISeXfvuMkU2OIgP5j9x
3Wf2WGumaR8U1uMQy98V5JYJzA+pNKhgzSlK6TWQQDCdpUt+LwlWFVjv4LmT1EQ/
BnSdMDXuA1rBQ32TtrBIqVk9oDOrk51uXGuo5c48wz7htS8Tu4M=
=DOfD
-----END PGP SIGNATURE-----

--mmzrrql2dydy5u5w--
