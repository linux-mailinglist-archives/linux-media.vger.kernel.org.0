Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817C14D161B
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 12:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346435AbiCHLWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 06:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346444AbiCHLWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 06:22:24 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C0A46175
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 03:21:26 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id w27so31596098lfa.5
        for <linux-media@vger.kernel.org>; Tue, 08 Mar 2022 03:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=+uNq7Qvm2neIu86Z5POTG4YYnpXm0Y6yOM6cvyBwkTA=;
        b=H03XSyDt/CENmSha2sArcgQdxPJC5ZoHBSF2/FwW8tZDZqaW51jcI5a77Uyk0cPXrH
         pZYWdcEXijNuaCRtMxNDOEZEK3bzgyN8sHbEfZyzi+preZRPn9x5JLRLw2MguQhCN628
         5I1OPLWhOflEnVy8t7i7aUlmGaT9vBSZyoAZLjVxgZzfPKxD+oo111/ZoUzDH1QcchjQ
         E2S6AsATH+NzkgPVG+n1Hcb9z8I6C8dwuNCSughWvwTuEo31dRlEKgv4ALw5hs5XKLfK
         OGR12IquwbfzeZkFwRnV6HMxAZSqj+dnoUwva8GbMk3uuRh23JWVtVO1y0yjLcKhZv0z
         Xj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=+uNq7Qvm2neIu86Z5POTG4YYnpXm0Y6yOM6cvyBwkTA=;
        b=htv9kS3h4/amfUD+6B7ZM7qhlptEbMYu679L2lEjmgomlMSJH6631fOdA+lFs0Nzmb
         QIx8MM2vJj8wFXG2BATS4iBBuVjOiTzelJKCYll3FeYkvEqCSIbZb+keuLjik192denG
         3XcLK/DQBsX079HcpxAHUGkKWoAT+mFSKrk99ijidLdfdCnD73T6V7yg5ifqsv7ZJTp7
         +N65liQhi5GqWTCc9LQbnKbmIWbm3Epa9LVjJygCdtZvwOwMGlg5rtMRCLeSuWjvJOTU
         JYPSxdljcbl5HIGWgb6Fex/afmcvji4VDQ70AJ/k7d03RUTDbvthZlm4UYifMWuDqyIl
         d+9w==
X-Gm-Message-State: AOAM533nwkMQkavOcz393bqyAwazfCbo08eiFvo063rY68rF1dltzXLo
        sPEEjFAUHJFCaTjuNQ3cUHQ=
X-Google-Smtp-Source: ABdhPJzg/ESmLSzdstM8PBgtmbKfo+V0aPoHLeTtA9WoN+GtRGOo036jJBWVq3sfS5EPhT3wW6lfyg==
X-Received: by 2002:a05:6512:3994:b0:448:3821:a416 with SMTP id j20-20020a056512399400b004483821a416mr3877287lfu.613.1646738484330;
        Tue, 08 Mar 2022 03:21:24 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id m25-20020a195219000000b0044846bbda49sm234928lfb.121.2022.03.08.03.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 03:21:23 -0800 (PST)
Date:   Tue, 8 Mar 2022 13:21:13 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Shashank Sharma <contactshashanksharma@gmail.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220308132113.187c1e77@eldfell>
In-Reply-To: <d696b1f6-e5ee-7636-3ab7-693bdf80e15f@gmail.com>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
        <20220307175452.73918180@eldfell>
        <d696b1f6-e5ee-7636-3ab7-693bdf80e15f@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0J7g_WQz85J/2L6SkixfN6=";
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

--Sig_/0J7g_WQz85J/2L6SkixfN6=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Mar 2022 17:48:38 +0100
Shashank Sharma <contactshashanksharma@gmail.com> wrote:

> Hello Pekka,
>=20
> On 07.03.22 16:54, Pekka Paalanen wrote:
> > On Fri,  4 Mar 2022 13:49:59 +0100
> > Shashank Sharma <contactshashanksharma@gmail.com> wrote:
> > =20
> >> From: Shashank Sharma <shashank.sharma@amd.com>
> >>
> >> This patch does some small changes to make the core logic of
> >> edid-decode tool available to a shared library wrapper. With
> >> these changes, the EDID's 'state' variable will be avialble
> >> to another process via some library API calls.
> >>
> >> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> >> Cc: Jani Nikula <jani.nikula@intel.com>
> >>
> >> Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com> =20
> > Hi Shashank,
> >
> > thank you very much for working on this!
> > =20
> >> ---
> >>   Makefile        | 22 +++++++++++++++++++++-
> >>   edid-decode.cpp | 15 ++++++++++++++-
> >>   2 files changed, 35 insertions(+), 2 deletions(-)

...

> >> diff --git a/edid-decode.cpp b/edid-decode.cpp
> >> index 4a90aba..babff4a 100644
> >> --- a/edid-decode.cpp
> >> +++ b/edid-decode.cpp
> >> @@ -21,7 +21,7 @@
> >>   #define STR(x) #x
> >>   #define STRING(x) STR(x)
> >>  =20
> >> -static edid_state state;
> >> +edid_state state;
> >>  =20
> >>   static unsigned char edid[EDID_PAGE_SIZE * EDID_MAX_BLOCKS];
> >>   static bool odd_hex_digits;
> >> @@ -1012,6 +1012,19 @@ static bool extract_edid(int fd, FILE *error)
> >>   	state.edid_size =3D edid_data.size();
> >>   	return true;
> >>   }
> >> +struct edid_state *extract_edid_state(int fd, FILE *error)
> >> +{
> >> +	bool ret;
> >> +
> >> +	ret =3D extract_edid(fd, error);
> >> +	if (ret) {
> >> +		/* update the number of blocks */
> >> +		state.num_blocks =3D state.edid_size / EDID_PAGE_SIZE;
> >> +		return &state; =20
> > A library should not give out pointers to global mutable data. That
> > would break having multiple EDIDs loaded at the same time.
> >
> > I would expect to be able to keep and cache 'struct edid_state'
> > instances created by this library until I explicitly destroy them.
> > I would not expect parsing a new EDID to overwrite the previously
> > returned object. IOW, I would expect to own the object created by the
> > library. =20
>=20
> Till now, I was under the impression of a design where a compositor=20
> parses the EDID, and saves all the information in its state immediately,=
=20

It may well be that all compositors will work like that. However, from
a library API design point of view it makes no sense for to require
that. It would be surprising. Surprises lead to bugs.

If you are thinking of optimizing away a few mallocs of few kB of data
for each new EDID to parse, that would be completely premature. Ease of
use wins this one.

> so that when the second EDID is loaded, it can override first one. But=20
> based on your inputs I myself feel that its a bit rigid. Now I am=20
> thinking about extending it to something which remains until the process=
=20
> lifetime. How does this look to you:
>=20
> - The compositor passes the EDID file node to library.

As mentioned, compositors don't have files for EDID.

>=20
> - The library parses the EDID, creates a state variable and caches it,=20
> and gives back a handle(unique) to the compositor.
>=20
>  =C2=A0 /* in compositor's display/connector init part */
>=20
>  =C2=A0connector.handle =3D libedid_parse_edid(EDID_NODE);

Why play with handles when you can simply return a pointer to an opaque
type?

I don't see a good reason to make the library more complicated in order
to guard against invalid handles, nor to garbage-collect everything
allocated even if the user of the library forgot to do so. Doing the
latter would just make memory leaks in the callers undetectable when the
library frees them all on exit.

Handles are just not how C works, contrary to what OpenGL tries to make
us think. Handles (that are not just opaque pointers in disguise) do
have their uses, but this does not seem like one.

> - While calling the subsequent APIs, compositor passes the handle with=20
> the API, like
>=20
>  =C2=A0/* Somewhere later in the same compositor */
>=20
> ret =3D libedid_is_ycbcr420_supported(connector.handle);
>=20
> if (ret) {
>=20
>  =C2=A0=C2=A0=C2=A0 /* Prepare a YCBCR420 modeset */
>=20
> }
>=20
> and so on .....

That is good.


Thanks,
pq

--Sig_/0J7g_WQz85J/2L6SkixfN6=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmInPCkACgkQI1/ltBGq
qqfpLQ//Qi887b6mONcrQmmxvrfCrqGuZAb/ByLUjiK85qARNP3qNRtXJuhfbf0H
bYnedvqiGT39B1XTdOZEq6hoghDQDiteeL+DLtoW1uX/U3n/9cpjxXLtgeyqBbjF
ghfHivPKdgmd32UkX1AsjY8vO3w56/lnIbXDV+dknsXS1mGmQv95pQaSgtpIoKmR
kcMeISTJelBqrx0CbanDUj0weQJ59y85fbpHkYxFTE4Pd6UmuAWwMN4eFOMW44UR
TYgsXlNarOcjWMa9RwNLpijML8OaYehDCGBzEfLVqVJ3TeS+Fzfs4MlhZATPl66w
bmKQeg9gekmuRAc8MoeoLIDJ8EQBbcmGTcY5sTAgS3+bfIq3GoCem4llyXpbbS5x
nudV9bxZxz6bEc8K2B2tPg63gsC+VwYoHFA2zSWOSb8ewr1EWC8uN8KFT02IEF6Y
/54zVCGlS0wCv9qjxxrrLwCtcHV/HwFt8jm5kxY5NJlyXLE/BE8yw7VvW8zA6fqX
/jqdOf40SVEJrqFQ7EY1ngPHlvLym44Mrj/iLqfSWhMJzCCrAciGvLr8eeITXuXl
oVtUAm2epzdvEzbNiBGDXprCqWKPFnNnWyeK+VwXpsCa1kGtut0N7A+fBT+amENv
RIcS6XnQVHAJ7G4OFpYiZld3z8tF406wRH3OV+PxBBU+VVVk5GE=
=Culf
-----END PGP SIGNATURE-----

--Sig_/0J7g_WQz85J/2L6SkixfN6=--
