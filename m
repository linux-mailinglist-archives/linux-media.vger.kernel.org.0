Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9F4C0CBD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbfI0UkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:50842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbfI0UkB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:40:01 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 283532146E;
        Fri, 27 Sep 2019 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569616800;
        bh=rfFx7/Qa1NodMojkHqJ/WvpDVCYU/CvrlgV8M5WPv/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RTduQbCyxIfWf6uf4IkSsNYcq/EKivPSFz6QRCOoEYU+m8ojJiQ3xaaBOrG+nAE4h
         eurd1gJEHne+mfapdyUi6H/Z/2E2OUYb6dx2FqutcFJTAD9T69JFeQH1DrMtVi0Q5b
         Gmjju86bidPHDScAFwWDGdMebfAKe+1yS8cN4nKM=
Date:   Fri, 27 Sep 2019 22:39:57 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
Message-ID: <20190927203957.tmgdxny2hw5sdfxc@gilmour>
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
 <20190923150213.2ub26ys4mhpp2hm5@uno.localdomain>
 <20190923161934.GF5056@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uru5qpy3vry324gz"
Content-Disposition: inline
In-Reply-To: <20190923161934.GF5056@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--uru5qpy3vry324gz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Sep 23, 2019 at 07:19:34PM +0300, Laurent Pinchart wrote:
> On Mon, Sep 23, 2019 at 05:02:13PM +0200, Jacopo Mondi wrote:
> > On Mon, Sep 23, 2019 at 04:12:55PM +0200, Hans Verkuil wrote:
> > > Hi all,
> > >
> > > Since we have three separate half-day sessions for different topics I decided
> > > to split the announcement for this in three emails as well, so these things
> > > can be discussed in separate threads.
> > >
> > > All sessions are in room Terreaux VIP Lounge - Level 0.
> > > There is a maximum of 15 people.
> > >
> > > The first session deals with the codec API and is on Tuesday morning from
> > > 8:30 (tentative, might change) to 12:00 (we have to vacate the room at that
> > > time).
> > >
> > > Confirmed attendees for this session:
> > >
> > > Boris Brezillon <boris.brezillon@collabora.com>
> > > Alexandre Courbot <acourbot@chromium.org>
> > > Nicolas Dufresne <nicolas@ndufresne.ca>
> > > Tomasz Figa <tfiga@chromium.org>
> > > Ezequiel Garcia <ezequiel@collabora.com>
> > > Daniel Gomez <daniel@qtec.com>
> > > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > Eugen Hristev <Eugen.Hristev@microchip.com>
> > > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Helen Koike <helen.koike@collabora.com>
> > > Michael Tretter <m.tretter@pengutronix.de>
> > > Hans Verkuil <hverkuil@xs4all.nl>
> > >
> > > Tentative:
> > >
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Jacopo Mondi <jacopo@jmondi.org>
> > >
> > > Jacopo, please confirm if you want to attend this session. I didn't find
> > > an email with explicit confirmation, so it was probably done via irc. But since
> > > this session is getting close to capacity I would prefer to keep attendance to
> > > those are actually working with codecs (or will work with it in the near future).
> >
> > I'm not really working on codecs, so if you're running almost at full
> > capacity please feel free to re-assign my seat.
>
> Same here. I think that Maxime Ripard, who isn't in the above list,
> would be able to contribute more than I could.

I wasn't sure I would be able to make it, but I can, so if it's still
an option count me in :)

Maxime

--uru5qpy3vry324gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXY5znQAKCRDj7w1vZxhR
xbKNAP9XV69eLtLc39feWe6K/HAlTtHRlpZzBEQN0KfPpjY7EAD/cAefKVZETvho
guavQ7/NoOzf5WBJgaKNr/af6kvndg4=
=cGhm
-----END PGP SIGNATURE-----

--uru5qpy3vry324gz--
