Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0773510C688
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 11:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfK1KTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 05:19:42 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60853 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1KTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 05:19:42 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DB106FF80D;
        Thu, 28 Nov 2019 10:19:37 +0000 (UTC)
Date:   Thu, 28 Nov 2019 11:21:41 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Adam Ford <adam.ford@logicpd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: ov5640: Fix check for PLL1 exceeding max allowed
 rate
Message-ID: <20191128102141.beq7wzdu5vxwx7wk@uno.localdomain>
References: <20191029124211.15052-1-aford173@gmail.com>
 <CAHCN7xKAJ3koJc1H2zyGFG3J6qu+uw0jozT=pQ_0i8HStX5TbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iej6shqa67f73dq2"
Content-Disposition: inline
In-Reply-To: <CAHCN7xKAJ3koJc1H2zyGFG3J6qu+uw0jozT=pQ_0i8HStX5TbQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--iej6shqa67f73dq2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Adam,

On Tue, Nov 26, 2019 at 08:08:05PM -0600, Adam Ford wrote:
> On Tue, Oct 29, 2019 at 7:42 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > The variable _rate is by ov5640_compute_sys_clk() which returns
> > zero if the PLL exceeds 1GHz.  Unfortunately, the check to see
> > if the max PLL1 output is checking 'rate' and not '_rate' and
> > 'rate' does not ever appear to be 0.

This seems a bit convoluted. What about:

"The PLL calculation routine checks the wrong variable 'rate' to
verify that the calculated PLL1 output frequency does not exceed
1GHz. Fix this by using the correct '_rate' one."

Or something against these lines

> >
> > This patch changes the check against the returned value of
> > '_rate' to determine if the PLL1 output exceeds 1GHz.
> >
> > Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
> >
>
> I haven't seen any responses to this patch.  Has anyone had a chance
> to review this?  It's been nearly a month.

You're totally right! Sorry about this

> I think it would be appropriate to backport to stable if deemed acceptable.
>

Indeed! This fixes a real issue

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> adam
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 5e495c833d32..bb968e764f31 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -874,7 +874,7 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
> >                          * We have reached the maximum allowed PLL1 output,
> >                          * increase sysdiv.
> >                          */
> > -                       if (!rate)
> > +                       if (!_rate)
> >                                 break;
> >
> >                         /*
> > --
> > 2.17.1
> >

--iej6shqa67f73dq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3fn7EACgkQcjQGjxah
Vjy86RAAw1kxOzkw1nnyB56pcH62BlNk9zY7bCQtKMIUFrqzDkEFM8qvECDtlbab
6SU8TTSN5kcc0gRS8g95reKyefbdclhN4sSBQ8EZtOO7uj/UpkIzj3iHXG9kKmEB
+ffUjBhnWlCP6x7Im6t740b7wwJ6+OXVAskL32Ts9yAqTapAEtJfswxj+DADCJsa
CpSy6OSBgR3o95Y2WuRS7i6e6Llr5ria3d1fzWO8gD4GFACAZJnotJ8NKmzyAZPM
mMAtMu0XebSsMiFjHbfbD7dB4g/pyD6qxqwVJTLGa/Lhr5kpIcsKgkENO2jNEIpo
CeUm71EJ4S133iYCarDCDHArqoOzeYWfBTSli6c38FGdk7zrEE1/ijFJw5sEJmO3
PfhcxXxcpjHOyqxxHZmXnlKDmPDbyKqsTY7wKViVfTQWN+4qCuRBZTyKDC5LG+uB
NMa9FYoDGoWCegpXcFHPy/KRNgJwyJoCEe7o8s9wDJHetJv1foufBaxoHlxGNsbl
XgHtA8cKxQyVLcGmxRbQss/BLSHkR7479KjFgiRRppkh/+WPNjReO/2Kfna5MJuQ
VkuSfgxKDVzlD20PTkvlqOv6+WwdFJLI0+9/mpJVfndcJ331sBqpZogW1g8uNrRa
DC8g5qnayGYym4M3rqlDk6mld3psDdkatENsj6K3uUVL7yUvUW0=
=Zsgt
-----END PGP SIGNATURE-----

--iej6shqa67f73dq2--
