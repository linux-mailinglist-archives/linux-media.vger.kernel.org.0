Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58DF3700DE
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 15:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbfGVNTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 09:19:20 -0400
Received: from kadath.azazel.net ([81.187.231.250]:37486 "EHLO
        kadath.azazel.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728529AbfGVNTU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 09:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
         s=20190108; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=BJZaPv+ZzOIR8B7tw6DrhELBhHNpgCujcs9EdlLvffI=; b=HCEqoqhwpCNV9mX4vPh3vjc+aa
        o0AmZ8zyOinCSarqcysgs9v+lhMgPR6RX8NrzyDcKekfw6OHHA/cW6IkoaBuJfj8jCrSaPAuM1jvS
        nmdiEG9FGEMXKMVSTRclxkKl5xVy7qXnofRqccb/QJgrAGmiBw1TwYLNHSVzucbDPWckjj9M47Dy+
        erPO4HnEnZg2g+/ucJinCyGpDZSm30IXzn8XVZmNCfhfJey0UcwT8iNNsEsvQixeXnWODNC5jr4zf
        dDN9Adf9fQeJycJ9CIFFLyC+DGrBQ4l7LwCuucpeFQa8T4E4ejR0DGJyHjRM8gcQhWzodJLnAzO4Q
        q+nplM8A==;
Received: from pnakotus.dreamlands ([192.168.96.5] helo=azazel.net)
        by kadath.azazel.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jeremy@azazel.net>)
        id 1hpYDe-0007Bw-TS; Mon, 22 Jul 2019 14:19:10 +0100
Date:   Mon, 22 Jul 2019 14:19:11 +0100
From:   Jeremy Sowden <jeremy@azazel.net>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        maxime.ripard@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] staging: media: sunxi: Add bool cast to value
Message-ID: <20190722131910.GC2695@azazel.net>
References: <20190722060651.6538-1-nishkadg.linux@gmail.com>
 <20190722111225.GA2695@azazel.net>
 <20190722122438.GA1908@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline
In-Reply-To: <20190722122438.GA1908@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 192.168.96.5
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on kadath.azazel.net); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2019-07-22, at 14:24:38 +0200, Paul Kocialkowski wrote:
> On Mon 22 Jul 19, 12:12, Jeremy Sowden wrote:
> > On 2019-07-22, at 11:36:51 +0530, Nishka Dasgupta wrote:
> > > Typecast as bool the return value of cedrus_find_format in
> > > cedrus_check_format as the return value of cedrus_check_format is
> > > always treated like a boolean value.
> > >
> > > Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Add !! to the returned pointer to ensure that the return value
> > >   is always either true or false, and never a non-zero value other
> > >   than true.
> > >
> > >  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > index e2b530b1a956..b731745f21f8 100644
> > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > > @@ -86,7 +86,7 @@ static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
> > >  static bool cedrus_check_format(u32 pixelformat, u32 directions,
> > >  				unsigned int capabilities)
> > >  {
> > > -	return cedrus_find_format(pixelformat, directions, capabilities);
> > > +	return !!(bool)cedrus_find_format(pixelformat, directions, capabilities);
> > >  }
> >
> > I think the original was fine.  The return value of
> > cedrus_find_format will be automatically converted to bool before
> > being returned from cedrus_check_format since that is the
> > return-type of the function, and the result of converting any
> > non-zero value to bool is 1.
>
> Okay I was a bit unsure about that and wanted to play it on the safe
> side without really looking it up, but that gave me the occasion to
> verify.
>
> From what I could find (from my GNU system's
> /usr/include/unistring/stdbool.h):
>
>    Limitations of this substitute, when used in a C89 environment:
>
>        - In C99, casts and automatic conversions to '_Bool' or 'bool'
>          are performed in such a way that every nonzero value gets
>          converted to 'true', and zero gets converted to 'false'.
>          This doesn't work with this substitute.  With this
>          substitute, only the values 0 and 1 give the expected result
>          when converted to _Bool' or 'bool'.
>
> So since the kernel is built for C89 (unless I'm mistaken), I don't
> think the compiler provides any guarantee about bool values being
> converted to 1 when they are non-zero.

Ick.  I checked the C99 standard and assumed that GCC would use the same
semantics.  I've just tested with "gcc-8 -std=gnu89" and it appears to
do the right thing:

  [azazel@ulthar:/space/azazel/tmp] $ cat test.c
  #include <stdbool.h>
  #include <stdio.h>

  int
  main (void)
    {
    char *p = "test";
    bool b = p;

    fprintf (stderr, "%p, %d\n", (void *) p, b);

    return 0;
    }
  [azazel@ulthar:/space/azazel/tmp] $ gcc-8 -O2 -std=gnu89 -Wall -Wextra
  test.c -o test
  [azazel@ulthar:/space/azazel/tmp] $ ./test
  0x55d984e0e004, 1

> As a result, I think it's best to be careful.

Fair enough.

> However, I'm not sure I really see what cocinelle was unhappy about.
> You mentionned single-line functions, but I don't see how that can be
> a problem.
>
> So in the end, I think we should keep the !! and drop the (bool) cast
> if there's no particular warning about it.
>
> What do you think?

Seems sensible.

J.

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZ8d+2N/NBLDbUxIF0Z7UzfnX9sMFAl01t8oACgkQ0Z7UzfnX
9sM6EBAAkkQYvSH24qMbABICcjH8XzSNpn+DAmj5ODDs0l9jFd+hNMLROg3zffgx
nS8+BuuBmBbI0Ds5XOWj9fbRcCB0J1FxmjotL3msjVORITaHs/IiEllgiZw0ab0v
Skbzu3XG6dcCRtKiHBR9iGRLuuZfubS9+19qAmKrMARtl07mtMGyvEwkJbRybgk1
EAmGKwKx6aY8XHnd10IXXV5JpYxi+MEja98yrIEwrAmFcfvPZtF2JVbU3liekq8r
NJ8eGDpchmICX3oqi7zjewPbu5zG7zOw/pAg5lciF/nGU6Y9r+sNBcbA+dFkIPfa
Zd8tfvHn//bHn9yUTLpQOW1bm6QgIP7//dSFHzYV0C+6N2esOR6L1xpTh7+uH1sT
lc0MsZ3qrdk50uCBNXSMgb5eYzUUW18FneKf7uBBlXDXOU1PF3LpCExukftddEGZ
lCZXTvtCSKpduxc8hNZ83F0eySr+mZ/5/lv7Tm5gD6irapyLxLfYFfcWkVp2Jqoq
X0IqbyPV+UKL8i4yUz6S1qje5cZs4OUlCnAX6r/65syBAlYt4R5pj0DFiw5avicd
MMGrj39m5EKetc+7g0aVs8C60hmYfx0qXQkwrw4lz8ca68mEgDJcYYHlfTx8lU5x
yOL1dsoVDw18MAB9T6pBg/OYIzKsBSj9Nl60M+u5qo+QuIooh9Q=
=NPHQ
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
