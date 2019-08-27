Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992829F193
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 19:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbfH0R3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 13:29:23 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46091 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbfH0R3W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 13:29:22 -0400
Received: by mail-qt1-f195.google.com with SMTP id j15so22031968qtl.13
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=hT4OfyVWsmbfX/E3leEiuesWwOo58NdOAYbBjbn85us=;
        b=HJIPk7RGiSP20qcgPe5BolYKxH9ZoD/636+qSyxm56MDLAVu9hVipjBDVyqHLa5dLN
         TtBrPmRzBvhgoz4ZZcmvpJokWBLn9UPVuy3nO5CX1G2iQ6TnyYORHQmR3X31JCkTm6jl
         QMMTXJHufjSYja6sQ4kLRmGrDV+IFGsJ9SjORapoISDDRDtJagy5c7yeH2GGvmwlrqF2
         fyiPQiqbSCpi0qNpa3xnOVEILwIENw7ndYh4ZVIZ2n79vQH62mi0zyav+d3oWBlTktBE
         6CCK+nrJc296ydpZjtZq331RnK8bn3TZh9WdLy2uoZ8Z6Xfg8Dx+t30Xnpe6Ap9RvPAN
         vgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=hT4OfyVWsmbfX/E3leEiuesWwOo58NdOAYbBjbn85us=;
        b=TvwfHabk5UcFpkGATbum/8OyfkirehhjHwbeD1vSvWTC8zhbNwK/Ab6coBKD93STb3
         Vy4nu+c5YSUbK+ga6Eod97P92CF4Kk6l1GH0YoVCJXE+tt2Dj/VTK4AfMO8xBwWdVTpZ
         DPf9BjjKoa2TvOs6uClR4z7spofDgtOG/9hEa4+WhzwaAFlXP4grnSxnPaC6U1cvK8k1
         19W+GvHYVNxS9MSQDUasPr4Cjk/8wtZGkDQRK8rZehqzJB/mYfn65r3dpK0MFuJx+zr6
         xQ1QUY7bAepE/qoPpSYqA1EDLkVw7KQk5VTtaAKXQIy9ALZjePGdnXqtl0EeSUN8kbr+
         dueQ==
X-Gm-Message-State: APjAAAUq3KGPSlIJ5Gvr6sdqoJtEuSVxOT2IJdDeSkY0+rJ8wd4zcI/T
        Zfl3wIOA+g7RPoky61h9qaRCNg==
X-Google-Smtp-Source: APXvYqyZFehnaOfV0plAl7QgHSVjQxOtqmMYKPk0iZnDaUyu87VxHPhRNmfVGtT/MwUvTUwY3SDBzQ==
X-Received: by 2002:a0c:94aa:: with SMTP id j39mr21134059qvj.24.1566926961784;
        Tue, 27 Aug 2019 10:29:21 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id k49sm10334063qtc.9.2019.08.27.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 10:29:20 -0700 (PDT)
Message-ID: <c2fac382b9490b2f96394ca3332e4f3db4a0e14e.camel@ndufresne.ca>
Subject: Re: [ANN] Media summit in Lisbon at September
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Tue, 27 Aug 2019 13:29:18 -0400
In-Reply-To: <CAPBb6MVUrVshUZ6OWEkadVS7oS4q4uWw7ZbxcurVWZ50aGSckg@mail.gmail.com>
References: <20190630134404.7ba170f0@coco.lan>
         <20190801093400.5c351754@coco.lan> <20190808095535.1ec92a1d@coco.lan>
         <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
         <e450c395-cc9d-ee5a-c02f-821807c48947@xs4all.nl>
         <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
         <20190814094046.GA5009@pendragon.ideasonboard.com>
         <CAPBb6MVUrVshUZ6OWEkadVS7oS4q4uWw7ZbxcurVWZ50aGSckg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-8SLlvPoFIEucvN/pcIL0"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-8SLlvPoFIEucvN/pcIL0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 16 ao=C3=BBt 2019 =C3=A0 14:52 +0900, Alexandre Courbot a =C3=
=A9crit :
> On Wed, Aug 14, 2019 at 6:40 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Aug 14, 2019 at 05:35:48PM +0900, Alexandre Courbot wrote:
> > > That could be nice. Of course something more informal is also fine.
> > > Anyone else planning to attend? I suspect Laurent and people living i=
n
> > > France might be there?
> >=20
> > I will, and so should the whole libcamera team.
>=20
> It seems to be confirmed that Tomasz and I will be attending. Maybe we
> can come with a list of topics to discuss for all people present?
>=20
> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> codecs, in particular m2m codec helpers and finalize the specification
> in general.

I can confirm that from Collabora that Boris, Ezequiel, Helen and I
will be present.

>=20
> > > On Mon, Aug 12, 2019 at 4:28 PM Hans Verkuil wrote:
> > > > On 8/12/19 6:00 AM, Alexandre Courbot wrote:
> > > > > On Thu, Aug 8, 2019 at 9:55 PM Mauro Carvalho Chehab wrote:
> > > > > > Em Thu, 1 Aug 2019 09:34:00 -0300 Mauro Carvalho Chehab escreve=
u:
> > > > > > > Em Sun, 30 Jun 2019 13:44:04 -0300 Mauro Carvalho Chehab escr=
eveu:
> > > > > > >=20
> > > > > > > > Hi all,
> > > > > > > >=20
> > > > > > > > We are organizing a media mini-summit in Lisbon to happen i=
n September,
> > > > > > > > at the same week as the Linux Plumber Conference and the Ke=
rnel Summit.
> > > > > > > >=20
> > > > > > > > We're still discussing the details about that.
> > > > > > >=20
> > > > > > > Gently reminder.
> > > > > > >=20
> > > > > > > Right now, we have just one extra theme proposal from Sean:
> > > > > > >=20
> > > > > > >       - possible dvb improvements.
> > > > > > >=20
> > > > > > > If we don't have more proposals, we may end skipping the Medi=
a
> > > > > > > Summit this year.
> > > > > >=20
> > > > > > It sounds that we won't have material to have a media summit th=
is year.
> > > > > > So, let's cancel the media summit this year.
> > > > >=20
> > > > > Loosely related, but are there people planning to go to ELCE on
> > > > > 10/28-30? Tomasz and I may attend if there is a chance to discuss
> > > > > libcamera/V4L2 codecs.
> > > >=20
> > > > I'll be there and if there is enough interest in setting up a meeti=
ng
> > > > to discuss this, then I can ask the LF to set a room aside for us f=
or,
> > > > say, half a day or so.
> >=20
> > --
> > Regards,
> >=20
> > Laurent Pinchart

--=-8SLlvPoFIEucvN/pcIL0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXWVobgAKCRBxUwItrAao
HHN9AKCF9Zey1shLbsfvV8vT6ubGWY9QKgCfQEqEL/1p/2qsIsGkNsV+TTBB7lY=
=EyFT
-----END PGP SIGNATURE-----

--=-8SLlvPoFIEucvN/pcIL0--

