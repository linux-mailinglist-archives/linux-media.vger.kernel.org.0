Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5612D8FC4B
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 09:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfHPH3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 03:29:49 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:38699 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfHPH3t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 03:29:49 -0400
X-Originating-IP: 87.5.130.64
Received: from uno.localdomain (host64-130-dynamic.5-87-r.retail.telecomitalia.it [87.5.130.64])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1E11540009;
        Fri, 16 Aug 2019 07:29:44 +0000 (UTC)
Date:   Fri, 16 Aug 2019 09:31:09 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Media summit in Lisbon at September
Message-ID: <20190816073109.ydqzndocuetqdajh@uno.localdomain>
References: <20190630134404.7ba170f0@coco.lan>
 <20190801093400.5c351754@coco.lan>
 <20190808095535.1ec92a1d@coco.lan>
 <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
 <e450c395-cc9d-ee5a-c02f-821807c48947@xs4all.nl>
 <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
 <20190814094046.GA5009@pendragon.ideasonboard.com>
 <CAPBb6MVUrVshUZ6OWEkadVS7oS4q4uWw7ZbxcurVWZ50aGSckg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cbqwsegfb4ciwejb"
Content-Disposition: inline
In-Reply-To: <CAPBb6MVUrVshUZ6OWEkadVS7oS4q4uWw7ZbxcurVWZ50aGSckg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cbqwsegfb4ciwejb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Alexandre,

On Fri, Aug 16, 2019 at 02:52:13PM +0900, Alexandre Courbot wrote:
> On Wed, Aug 14, 2019 at 6:40 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Wed, Aug 14, 2019 at 05:35:48PM +0900, Alexandre Courbot wrote:
> > > That could be nice. Of course something more informal is also fine.
> > > Anyone else planning to attend? I suspect Laurent and people living in
> > > France might be there?
> >
> > I will, and so should the whole libcamera team.
>
> It seems to be confirmed that Tomasz and I will be attending. Maybe we
> can come with a list of topics to discuss for all people present?
>

Apart from discussing libcamera and hope we could kickstart a review of
its API, I would like to re-start discussing multiplexed stream support,
but that would require Sakari to be there, something I'm not certain
about. Sakari?

Thanks
   j

> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> codecs, in particular m2m codec helpers and finalize the specification
> in general.
>


> >
> > > On Mon, Aug 12, 2019 at 4:28 PM Hans Verkuil wrote:
> > > > On 8/12/19 6:00 AM, Alexandre Courbot wrote:
> > > > > On Thu, Aug 8, 2019 at 9:55 PM Mauro Carvalho Chehab wrote:
> > > > >> Em Thu, 1 Aug 2019 09:34:00 -0300 Mauro Carvalho Chehab escreveu:
> > > > >>> Em Sun, 30 Jun 2019 13:44:04 -0300 Mauro Carvalho Chehab escreveu:
> > > > >>>
> > > > >>>> Hi all,
> > > > >>>>
> > > > >>>> We are organizing a media mini-summit in Lisbon to happen in September,
> > > > >>>> at the same week as the Linux Plumber Conference and the Kernel Summit.
> > > > >>>>
> > > > >>>> We're still discussing the details about that.
> > > > >>>
> > > > >>> Gently reminder.
> > > > >>>
> > > > >>> Right now, we have just one extra theme proposal from Sean:
> > > > >>>
> > > > >>>       - possible dvb improvements.
> > > > >>>
> > > > >>> If we don't have more proposals, we may end skipping the Media
> > > > >>> Summit this year.
> > > > >>
> > > > >> It sounds that we won't have material to have a media summit this year.
> > > > >> So, let's cancel the media summit this year.
> > > > >
> > > > > Loosely related, but are there people planning to go to ELCE on
> > > > > 10/28-30? Tomasz and I may attend if there is a chance to discuss
> > > > > libcamera/V4L2 codecs.
> > > >
> > > > I'll be there and if there is enough interest in setting up a meeting
> > > > to discuss this, then I can ask the LF to set a room aside for us for,
> > > > say, half a day or so.
> >
> > --
> > Regards,
> >
> > Laurent Pinchart

--cbqwsegfb4ciwejb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1WW7kACgkQcjQGjxah
Vjzx2A/8CVAr4a3okDtrH00YgTMVIpO8j/X2Hk0iPIJqAbmGinDucDdaJqsAgYwY
hCK50xGSDTsbj8DsInJYRUekx5vARVzot8DUWZ+66KGuJxelKgC5H27f7f+B/T75
JKJI1SevMd4O+uGGvApiLXTRSfRgnlwjEsveM4OY8IBzwSySLIcejzH96ZFas7oX
St8bL+JcAwql7cosIVbNCIR/mGfnDY5LVY6+4Agtly8AVFFSOmRcsA+2w5qo7CpX
A7qZpfR4atpd6SLZmDdjRu7wotzpRB1Ku8COqy0U5JUxf4dY+anibHOkTYdfFT3A
4Ff/vvZp8Nka28c6i+8L7HUrv+13p1jOOgbaiJ0afJSI4rlNeHOmrzB2UElNpoS+
ICUdP+m3NvENj2vwDIllCdRGM5X+CXF8xO35DnpwtG8qoQpQj4nhwwoJZKJ6D76m
IMVt51xApjoSJMAtXnwTZaNpG6q/q1elpVYXDAjy67MAoaQR+1uRoH2g5Ju9GhFJ
ay38mvfkxpHY2WYzjdKow9Fvp3KaySSaWL3hOKZ/OvFv5I9AN9KdPsAdoB6yl5W8
RGQ1lb34LSkU+fLChZ3LBCcxzd2yK40781CpTVg7WbS0YxUJy/lqHQ4jSaJyhtqa
IirOiSIkKX0Io6v+Wl1iztcgyYH/WG/Sfn3zHzWBiCBMP1O718I=
=Ey27
-----END PGP SIGNATURE-----

--cbqwsegfb4ciwejb--
