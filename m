Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF87342A0
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfFDJGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:06:41 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:32821 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfFDJGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:06:41 -0400
Received: by mail-wr1-f44.google.com with SMTP id n9so2515378wru.0
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n2f/TS/AZSr+XMJiw7wYDwLfFXsK/JQnErUfhyipwX8=;
        b=GOa9HgHfLidYII2Bn4aPazKgaoTS91LJ791HeIOoZc+AOjWcpYhD/B511r4XbQHwNk
         6yPPmXxp+ejqjglTwjLyfHpUp06UDVJcN1/ss0MyYobqjItzOjZuvTN4r2x9Bda3Fw+S
         E1yHgAipNoXdu4r2KW3tqPDoCqlbbhqz6YAFJbPZCOlIswuKTBNv48TNgReA2K6TKTmb
         /9MDzbiNBfTWM0to9hMcNBMsgFyKG/sSHgsYk+thGgrAiDL6omOk09TB3JvciVYbW5Yo
         7QMHI/bSuEe3n+sisG4rTy4KJ3n276MC/D9IcqjhWbr7xXCiMHoMk8/v8GmsQ671n9Bc
         ZMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n2f/TS/AZSr+XMJiw7wYDwLfFXsK/JQnErUfhyipwX8=;
        b=Q3wTOPXuJx0tJj0RV9L/kVd8pvDUW6TmLdgtMitXzJSBcat4kLbPtL6e6vH71J7dDO
         d+oOd+IrwWAD4BmKyfG6lya/4kxkw+Q/1DwOP1ko0EpA58QCbKlS9DhchimVT7RhhhAG
         NS0JzhIb+la/g5CEvbZPAj3XTMEi6kQmOCtgC69UFgfru/oa1OyqFK11WhSz12/t32hQ
         pgrFs+UlapB+j6vXLvuZf5FbYImdkzYfv9b7Pp+EZRJQxpBtItQjKQSCqhPfZEClg98A
         ITJLZKLbHpee9JESuhnGQQxxW1ouAKCSWQo7RUshJ84k2MUnTlBak/tRiHH3QxvULDq+
         bUjg==
X-Gm-Message-State: APjAAAVu0lS+YlzlJisY98Aafyn+QHelBXy5ql9Uk72dMfhZ0xe83NvH
        iyiVmVbfx3aDPGfdSC0MlIE=
X-Google-Smtp-Source: APXvYqwbhdCObECtVC3LDu4ac9tpf3WzRmPWg2KcwS3sMt7kjxHbIc2lvAPhnvA5VdL8NWftNBpoTQ==
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr5715068wru.35.1559639198547;
        Tue, 04 Jun 2019 02:06:38 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id t7sm9447378wrn.52.2019.06.04.02.06.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 02:06:37 -0700 (PDT)
Date:   Tue, 4 Jun 2019 11:06:36 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190604090636.GF9048@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <20190603112449.GA30132@ulmo>
 <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
 <20190603214117.664f6ba1@collabora.com>
 <20190604083157.GC9048@ulmo>
 <20190604104921.5f4dcbe8@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="L2Brqb15TUChFOBK"
Content-Disposition: inline
In-Reply-To: <20190604104921.5f4dcbe8@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--L2Brqb15TUChFOBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 10:49:21AM +0200, Boris Brezillon wrote:
> On Tue, 4 Jun 2019 10:31:57 +0200
> Thierry Reding <thierry.reding@gmail.com> wrote:
>=20
> > > > > > - Using flags
> > > > > >=20
> > > > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > > > represented as flags. Using flags also helps with padding.
> > > > > > It's unlikely that we'll get more than 64 flags, so using a u64=
 by
> > > > > > default for that sounds fine (we definitely do want to keep som=
e room
> > > > > > available and I don't think using 32 bits as a default is good =
enough).
> > > > > >=20
> > > > > > I think H.264/HEVC per-control flags should also be moved to u6=
4.   =20
> > > > >=20
> > > > > There was also some concensus on this, that u64 should be good en=
ough
> > > > > for anything out there, though we obviously don't know what the f=
uture
> > > > > will hold, so perhaps adding some way for possible extending this=
 in the
> > > > > future might be good. I guess we'll get new controls for new code=
cs
> > > > > anyway, so we can punt on this until then.
> > > > >    =20
> > > > > > - Clear split of controls and terminology
> > > > > >=20
> > > > > > Some codecs have explicit NAL units that are good fits to match=
 as
> > > > > > controls: e.g. slice header, pps, sps. I think we should stick =
to the
> > > > > > bitstream element names for those.
> > > > > >=20
> > > > > > For H.264, that would suggest the following changes:
> > > > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_=
header;
> > > > > > - killing v4l2_ctrl_h264_decode_param and having the reference =
lists
> > > > > > where they belong, which seems to be slice_header;   =20
> > > >=20
> > > > But now here it's being described per slice. When I look at the sli=
ce
> > > > header, I only see list of modifications and when I look at userspa=
ce,
> > > > That list is simply built from DPB, the modifications list found in=
 the
> > > > slice header seems to be only used to craft the l0/l1 list. =20
> > >=20
> > > Yes, I think there was a misunderstanding which was then clarified
> > > (unfortunately it happened on IRC, so we don't have a trace of this
> > > discussion). The reference list should definitely be per-frame, and t=
he
> > > L0/L1 slice reflists are referring to the per-frame reference list (i=
t's
> > > just a sub-set of the per-frame reflist re-ordered differently).
> > >  =20
> > > >=20
> > > > There is one thing that come up though, if we enable per-frame deco=
ding
> > > > on top of per-slice decoder (like Cedrus), won't we force userspace=
 to
> > > > always compute l0/l1 even though the HW might be handling that ? =
=20
> > >=20
> > > That's true, the question is, what's the cost of this extra re-orderi=
ng? =20
> >=20
> > I think ultimately userspace is already forced to compute these lists
> > even if some hardware may be able to do it in hardware. There's going to
> > be other hardware that userspace wants to support that can't do it by
> > itself, so userspace has to at least have the code anyway. What it could
> > do on top of that decide not to run that code if it somehow detects that
> > hardware can do it already. On the other hand this means that we have to
> > expose a whole lot of capabilities to userspace and userspace has to go
> > and detect all of them in order to parameterize all of the code.
> >=20
> > Ultimately I suspect many applications will just choose to pass the data
> > all the time out of simplicity. I mean drivers that don't need it will
> > already ignore it (i.e. they must not break if they get the extra data)
> > so other than the potential runtime savings on some hardware, there are
> > no advantages.
> >=20
> > Given that other APIs don't bother exposing this level of control to
> > applications makes me think that it's just not worth it from a
> > performance point of view.
>=20
> That's not exactly what Nicolas proposed. He was suggesting that we
> build those reflists kernel-side: V4L would provide an helper and
> drivers that need those lists would use it, others won't. This way we
> have no useless computation done, and userspace doesn't even have to
> bother checking the device caps to avoid this extra step.

Oh yeah, that sounds much better. I suppose one notable differences to
other APIs is that they have to pass in buffers for all the frames in
the DPB, so they basically have to build the lists in userspace. Since
we'll end up looking up the frames in the kernel, it sounds reasonable
to also build the lists in the kernel.

On that note, it would probably be useful to have some sort of helper
to get at all the buffers that make up the DPB in the kernel. That's got
to be something that everybody wants.

Thierry

--L2Brqb15TUChFOBK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz2NJkACgkQ3SOs138+
s6FuvA//SjlNIfKsqLqvp+XNxz1bttEzMcmHALDkV+acWvoNPYoGrcAuUYv9u+Jr
ZsAk3W+Mjhn6cbZ8dCNoFEAtTSB1gxRTEuNxIQ1WhaFL2VSN/wNfcxZ4NgZUCxdf
CsBpF7b5G0QdTmuviUqGtghCZPfwItbjqr/OVQAPMsK4CieVcRDjraD3zlcTJ1LG
sv3HxeQbPZi+2Ya6U6gEfmR3vMr59Slv33WKzc6GgpNOxGQUWUwqXZbVleRjy4R4
ylFbBhxMqFzeCm8lK5kkau3xtNenvyQLFI4T5/8XQQEpHIF6uL67gmfDNM+Mhu8U
Cytrq8QUs+ZkqN4qe2GW4vNk+RPCYHRk+nv+yxX3gd+HIl+H4PW6dKYTRiM0jTHt
SBAljLYpV8T+o1e5prsDtmu8GAsRMUwg+2lTrYswsosUlt9c2wgIj41WqF2+OFxM
nxHeDVrYtbkS7MsCW1qffab/rgUKdNGHvkPHFjBAZAwEBrOTW1WhFFMDGUdnUb8s
UKE4E5dPjbJtF14zgA5ew/joP1oyMdPIJoGmx3/hxNgD9hoqRG2czKploW47dqQ3
pqfCQmI8Nk+KDZsUDsyJUXxD6tnptbQoqQ5hrnPSSDiO5Se3dmaG0AX/IEg3hNeg
bgwXpfz8vtlCys2Eld/sHNVvQxtMfRZ6QID6TrOeU/ER/LmiTRU=
=L4pA
-----END PGP SIGNATURE-----

--L2Brqb15TUChFOBK--
