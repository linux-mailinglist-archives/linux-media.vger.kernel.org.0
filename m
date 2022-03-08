Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0BA94D1A9A
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 15:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347476AbiCHOcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 09:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235428AbiCHOcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 09:32:02 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B344E4BFF6
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 06:31:05 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id z26so17082478lji.8
        for <linux-media@vger.kernel.org>; Tue, 08 Mar 2022 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=pEk0gdgEoIod+PiNhllu11lkxTGxVbqa2Mb4ngQvR4I=;
        b=V/aDcArLnum+v8UkrjL/qZixOlGgi8pmp7tVaHloCAcwhzMP1t3yZFdhHiY+pu+9zw
         IHd3+tEWLLjympFHQnPxIL8H55+fknXfN+eraUjWwPpOCxjiMxLSFW6yfxzYgI75DJt4
         G4+kFUThiF4jyYrh7ufZbU13Qft4SPtymnjJ6ZKYeWvh8Y5UZGH5k4Zv5FrBd2NAYll2
         2RHj1ci3cFwgFZHo3QqJtGfloaX+06pW2W/WC3fUDcsfu7x4tfRSwfrkCdF6mR9v81w/
         YDnNYy42DYm1KWyaCqEyj7/qX2LsZrEMgGTxkxEnlIN+5HWrC16rYR+u1FIa6US5epTQ
         NfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=pEk0gdgEoIod+PiNhllu11lkxTGxVbqa2Mb4ngQvR4I=;
        b=7yRyQaog896k3Ez0w04PLcyaeQdQ8EHUKE92XS8nue7mAUpPENEh9kEXd9s/obIgeD
         Eiy6QjhOmWosOdsimXykR/EiNc9cv411ifXh5pvtxgzan1WlFb2wZzLtuuQjGt1W5jUO
         bH/Jc8pBw3OfnTy/rlQz7+c5/WzWJj4T21BoOstcuUSWi0ybJZVjvgLmRvSxgECyUE5b
         0gnr/eZuVVSeq3ON3LEoJvGSRv6LAcb5MMVSYLVyU7Fg+Bqs8Itm+w53eGHYR4idAVlz
         BRLSg5A8286TzafhFq/6qIKTd1MpQ3jec9tXUX7GDscgdkShbWGhWHsIDTOTjpup+qKE
         bnKg==
X-Gm-Message-State: AOAM530BlxQdbbjYkgfr0UWF9SEsdFq+OP21/x812Pz1JtjXs6A7dhOG
        ECAhe84QWM2FbHdR0Kf50eI=
X-Google-Smtp-Source: ABdhPJwhveZiuTguyCbT15EJuN3u7FstODQXA51yvVvHH4lIiT4zrV1ltb5rxfUyS9bQ/liYySyetQ==
X-Received: by 2002:a2e:b78f:0:b0:246:6331:c1bc with SMTP id n15-20020a2eb78f000000b002466331c1bcmr10606818ljo.188.1646749863814;
        Tue, 08 Mar 2022 06:31:03 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id i10-20020a056512340a00b0044821f25257sm2273993lfr.82.2022.03.08.06.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:31:03 -0800 (PST)
Date:   Tue, 8 Mar 2022 16:30:53 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220308163053.70c81c0d@eldfell>
In-Reply-To: <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
        <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gdPHgDBD/WW0FyV7=s+wDZ/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/gdPHgDBD/WW0FyV7=s+wDZ/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Mar 2022 13:09:37 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Hi Shashank,
>=20
> There is no cover letter for this series, so I'll just reply to the
> first patch, but my comments are high-level and not specific to this
> patch.
>=20
> To be honest, I am not at all convinced that using edid-decode as a
> parser library is the right thing to do. It was never written with that
> in mind.

Hi Hans,

in https://www.spinics.net/lists/linux-media/msg190064.html you wrote:

	"I would be open to that. The best way would be to create a C
	library that turns the EDID blocks into C structures, while
	edid-decode itself remains C++ and uses the C library to do the
	parsing. While edid-decode supports a large range of Extension
	Blocks, a C library could probably limit itself to the base
	block, CTA-861 blocks and DisplayID blocks."

and

	"I think it would make sense if it is grown as a library used
	by edid-decode. The edid-decode utility is under active
	maintenance and follows the latest EDID standards, so that will
	probably help the quality of the library. My main requirement
	would be that the edid-decode functionality is not affected,
	especially the conformity checks are still performed. And that
	support for new/updated EDID standards can easily be
	implemented, but that's exactly what you would want in an edid
	library."

EDID blocks as C structures is not the API we are looking for from a
library, but more like what edid-decode already prints out yet in
native C types rather than strings or bit patterns. The former could
still be the low-level library API while the latter is the high-level
API. So perhaps edid-decode would be using the low-level API directly.
Then the high-level C API is implemented on top of the low-level C API.
Time would tell how much of edid-decode will move behind the low-level
C API.

On the down-side, the high-level API implementation would need to
duplicate the logic that already(?) exists in edid-decode to find the
most accurate source for a piece of information in case one block
overrides another or information from multiple blocks have to be
combined.

In my opinion this draft does not yet have enough structure to tell
what the interfacing between edid-decode tool and library will look
like.

> The two purposes of edid-decode are to:
>=20
> 1) Convert the EDID to a human readable text, and
> 2) Verify if the EDID conforms to the various standards and is internally
>    consistent.
>=20
> As a result the state information that edid-decode stores is just the
> state that it needs to check conformity across Extension Blocks and/or
> Data Blocks. Most of the parsed data is just printed to stdout and checked
> and then forgotten.

Sounds like it should be easy to store the data everywhere where
anything is printed. Is something wrong with that? (This would be a
different approach than what you drafted a year ago.)

> I have considered if it would make sense to make a library to parse and
> store the EDID data and have edid-decode sit on top of that, but that will
> make the conformity tests much harder. It's kind of interwoven with the
> parsing and a parser library is really not interested in that anyway.

Why would conformity testing be contradictory to a parsing library?

Does edid-decode just stop when it finds a problem without looking at
the rest of the data, and would doing the latter be somehow difficult?

I would naively think that conformity testing would be easy to make
conditional, or leave it unconditional but redirect the reports when
the user needs to use the information even when it is broken.

The more I think of it, the more I think that display servers should do
EDID conformance testing as part of their normal operations and log the
results. A desktop environment could even have an UI for that: "We
found something strange with your monitor, it might not work as
expected. Details here..." in the more serious cases.

In the long run, maybe it would make people return more monitors to
sellers, which might cause manufacturers to pay more attention to
getting EDID/DisplayID right. I can dream, right? :-)

> I think edid-decode can function very well as a reference source for
> a real EDID parser since edid-decode is very complete, but not as a
> EDID parser library.

It would be a shame to have to fork edid-decode into something else and
then play catch-up with the real edid-decode for all times to come. Or
are you perhaps hoping that the fork would eventually completely
supersede the original project and developers would migrate to the new
one?

It would be really nice to be able to involve the community around
edid-decode to make sure we get the library right, but if the library
is somewhere else, would that happen? Or are we left with yet another
half-written ad hoc EDID parsing code base used by maybe two display
servers?

Maybe we could at least work on this proposal for a while to see what
it will start to look like before dismissing it?

If all that fails and there is still someone left to do some work, it's
not unthinkable to set up a completely new project with the goal to
replicate exactly the output of edid-decode with the full EDID sample
database you have gathered. That just feels like a lot of work without
any help until it's perfect.


Thanks,
pq

> On 3/4/22 13:49, Shashank Sharma wrote:
> > From: Shashank Sharma <shashank.sharma@amd.com>
> >=20
> > This patch does some small changes to make the core logic of
> > edid-decode tool available to a shared library wrapper. With
> > these changes, the EDID's 'state' variable will be avialble
> > to another process via some library API calls.
> >=20
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> >=20
> > Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
> > ---
> >  Makefile        | 22 +++++++++++++++++++++-
> >  edid-decode.cpp | 15 ++++++++++++++-
> >  2 files changed, 35 insertions(+), 2 deletions(-)

--Sig_/gdPHgDBD/WW0FyV7=s+wDZ/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmInaJ0ACgkQI1/ltBGq
qqe2CQ//Xk569X08hXqDlQsgrb4JEKcuNXcjvqNHa9AH98ogQvdVc1sGfhH3x7CO
oCa6rijslrPLhe5zpQmyHFXxvb9yCUkIPv6RAC4vs6nmA5++nI6sE8g1lVepfoJw
cCiu2+JRKCIJvkRWvw9/g14q/s6x1dCK9bCTyBXGS8kGVibgHkStPWYP+wEN+XFi
GtLENSA9Abnmsl+TSQbmauYEmF2toMrTIukT8QQ1iY5z1jXhNBr7/hgfpthfxlBU
e2wOu45EIFarmTZ2MtpI3LZqJMF2eyTpFE6ClUcAH0kDA0Mlodck0hqCiigyejPJ
dRHUI6XUMfLP0eFLrYJ/+wKwDcHcjxAD+S6dBP9Fy+Q1qOe9ln4gXWy+t22AieZF
+Yvx7xB+yLRQPu3hPrnV7ojObpeqhekZensiM216kyqTuX6g7d1X0d3P9qncxNlD
/kaqSAdshZCd/TXi5HIreoowcfAZn7U49I+t991OYrLiByzfaXhhOpU87hHkuh0R
dyYO2GnuAVHUdmz8Uatsv4mp4DH03/GFnItwK8X6oDCLhaJUrOjv36pghMfyTbIh
EtDzopX6g9+dttgAgpXBqLvCmtizJ1u1v/ExVCyZZ/gG75GSRVWFn1ZuhdwQhWTY
aUG2i01ANt+412GmOeeh0YsCGSYkxiM58O0o2asjMC3n2phHpDk=
=zS6W
-----END PGP SIGNATURE-----

--Sig_/gdPHgDBD/WW0FyV7=s+wDZ/--
