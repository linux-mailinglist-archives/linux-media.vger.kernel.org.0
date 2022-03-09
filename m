Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759EB4D30D3
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 15:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiCIOKu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 09:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbiCIOKt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 09:10:49 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5D4C7D65
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 06:09:48 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id o6so3297507ljp.3
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=CPe8bKDOGFbEJYuovUcGVJlaIhVK9FMPHHZCWAVe7aw=;
        b=m3DsSZ0xqQSdl6tGkBZQ37CW9ZPstB64sVo+5SHt+HE3aIPyr4m+OKyvwPmaVqPeBu
         cgp7JAXxRwQaqcktR/ytbRav/r0rYkm0GFhjG0lrW8vxFIvV8ZqDn0d0WD698LBL79kG
         gDzwdNZFnPgqxwg5AbXKEfq0eFfC+4IdeZNNL5NsRiJC2a1KSIURFIAj7il01dgBvmbz
         WinbObOsIs+Cpae3Vk0xpV9JXjDgtiOhXO+wwqzsRBGeOp8wlLUsIZ5r8DAap0ybtfKR
         zrzaHlEGZwAd2kHNYR00oIrwmO0XDadKoNrq3rU+Cn1juUib3dM7s7scmKWFggMiv6zb
         Z01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=CPe8bKDOGFbEJYuovUcGVJlaIhVK9FMPHHZCWAVe7aw=;
        b=USu3Q+yGLx+jDjDKZQho/qw6FefwyM4/cjm0Ul6PYl2uEh8k24TT0Xx2+60mtMHIDc
         XKRG8TPwGfGqFVTQ95kad/42mUFjbdr9t3f8P7h6RTrPDKDiH3lR+cSEL2Vet8CYBHpQ
         gB6eex/uO3RNXpVa0q08Usf9s/4JyymQI5+HIdPZhvrqaoRcSEjPIi18ISi5fPVn8wXf
         A+KWKGXom1Xx7fJd4ROXESSaf6Qo0hz679e9ZnM84s3xkEOaVRyf+h7kXpBi8KyvuIEa
         16/lDwSY5QDfvsYSrK2CxHUCiS5TjjN3YVVpBo6c0dVtEKXTeI1yxH/Wtf/kSeSF+iCP
         tu9Q==
X-Gm-Message-State: AOAM533N/9eo7xinErG8SMuumhd5SmOPrCcHagsKU0rMPYCLXsR4s5eE
        zqYmZbAaY03E4+BkbZNQTz8=
X-Google-Smtp-Source: ABdhPJx4eLwmqa4CmKhlC3REWkJYzkANkc3bXMaN94T0hNw5vstNU93xQIi2wlNPLEU0t8LfQAiM4w==
X-Received: by 2002:a2e:a587:0:b0:247:b6ba:82f6 with SMTP id m7-20020a2ea587000000b00247b6ba82f6mr13919624ljp.492.1646834984965;
        Wed, 09 Mar 2022 06:09:44 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25581000000b004484e0360a0sm413070lfg.226.2022.03.09.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 06:09:44 -0800 (PST)
Date:   Wed, 9 Mar 2022 16:09:33 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220309160933.78aba02a@eldfell>
In-Reply-To: <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
 <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
 <20220308163053.70c81c0d@eldfell>
 <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vfEzAq0GQt/8+FXAl2+Sytx";
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

--Sig_/vfEzAq0GQt/8+FXAl2+Sytx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Mar 2022 17:36:47 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Hi Pekka,
>=20
> On 3/8/22 15:30, Pekka Paalanen wrote:
> > On Tue, 8 Mar 2022 13:09:37 +0100
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >  =20
> >> Hi Shashank,
> >>
> >> There is no cover letter for this series, so I'll just reply to the
> >> first patch, but my comments are high-level and not specific to this
> >> patch.
> >>
> >> To be honest, I am not at all convinced that using edid-decode as a
> >> parser library is the right thing to do. It was never written with that
> >> in mind. =20
> >=20
> > Hi Hans,
> >=20
> > in https://www.spinics.net/lists/linux-media/msg190064.html you wrote:

...

> >> I think edid-decode can function very well as a reference source for
> >> a real EDID parser since edid-decode is very complete, but not as a
> >> EDID parser library. =20
> >=20
> > It would be a shame to have to fork edid-decode into something else and
> > then play catch-up with the real edid-decode for all times to come. Or
> > are you perhaps hoping that the fork would eventually completely
> > supersede the original project and developers would migrate to the new
> > one?
> >=20
> > It would be really nice to be able to involve the community around
> > edid-decode to make sure we get the library right, but if the library
> > is somewhere else, would that happen? Or are we left with yet another
> > half-written ad hoc EDID parsing code base used by maybe two display
> > servers?
> >=20
> > Maybe we could at least work on this proposal for a while to see what
> > it will start to look like before dismissing it? =20
>=20
> If you are willing to put in the effort, then I think you would have to
> first rework the code bit by bit into different layers:

Hi Hans,

thanks! If Shashank agrees, we can see how this would start to look
like. I suppose there would be the occasional patch series sent to this
mailing list and publicly discussed between me and Shashank while we
iterate. You could mostly ignore it if you want until the two of us
need your guidance.

Even if it turns out that this cannot go into edid-decode upstream, I
don't think the exercise is going to go to waste. It would be the
beginnings of a new project.

> E.g. parse_base_block() would be split into two functions: a parse_base_b=
lock()
> that parses the base block into C structures, and it also does the confor=
mity
> checks, where the output of that is just written to an internal buffer, as
> happens today. The --check-inline option functionality would be hard to s=
upport,
> I suspect, but I think it is OK to drop that. I at least rarely use it.

For --check-inline, maybe, maybe not. open_memstream() is a thing,
giving us a FILE*. Depending on --check-inline, the FILE* to complain
to could be either stderr or an internal buffer from open_memstream().
Or the C++ equivalent.

> And on top of that there is a print_base_block that produces the human
> readable output based on the result of the parse_base_block.
>=20
> Later the parse functions can be put in a library which edid-decode uses.
>=20
> It should be possible to do this conversion bit by bit, so it's easier to=
 merge
> and maintain.
>=20
> But it is a *lot* of work since you will also have to make C headers for =
all
> the EDID structures.

Thank you for the suggestions and warnings. I suspect we shouldn't aim
to land the first part until we have a good idea of the later parts, so
that edid-decode does not end up with half a conversion if the later
parts turn out too messy.

> Can the library be C++ or do you need C structs only? If C++ is OK, then =
that
> will simplify matters.

The only thing that absolutely must be C is the library public API.
What I've been imagining so far is that we would have a low-level and a
high-level API, as I alluded to in my previous email. Other than that,
I don't know yet.

Internals are totally fine to keep as C++.

> In any case, I think I would like to see a proof-of-concept where the base
> block parsing is modified in such a way as I described above. If that mak=
es
> sense, then this can be extended to the other extension blocks. And for t=
he
> CTA and DisplayID extension blocks you can probably do the conversion one
> Data Block type at a time.
>=20
> In any case, this series is just not useful as proof-of-concept.

I agree. A cover letter to set up your expectations would have been in orde=
r.

Btw. how does edid-decode regression testing work? I thought I asked in
the past, but I can't find my question or answer. I know what
edid-decode README and test/README says about it, but how does one
actually run through the tests?

One thing I'm a little wary of is the edid-decode.js target in the
Makefile. How do you test that?

On the other hand, if merging into edid-decode does not work, a new
project could have several benefits if I get to decide:

- Meson build system
- automated test suite in the project
- Gitlab workflow hosted by freedesktop.org
- CI

I must admit it is really tempting, but I'm scared of the amount of
work needed to establish a new project.

I assume you are not interested in any of that in the current upstream
project, are you?


Thanks,
pq

--Sig_/vfEzAq0GQt/8+FXAl2+Sytx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIotR0ACgkQI1/ltBGq
qqdCXxAAi2aFRG3Mdk7mAGXew/HrCu0aPm904r+8fIEZXkOdJh7MHtWD7Hs9YRcc
XNnyI04+qjm/MYiybY+3gH2TtKJ7qJRbKs7hMBq80YIbih9x0nQOZdW2sdqDvN+C
RCAZXAr5k3niOw/MEXwTclhmP99HQwL3OCJozL6OiPTLAipTL40Mb4Ktr0sbjMjH
hDFKgSa3JmFSTDQgkpkFOOivtzcLWZo2ki0uPJNTDZGOotu8IggksLSqUnnuLifg
+h+Uib200wemBANjq5DNkAJvak8SXMZO2A3OhBkcoRLQ05SKG+2JYoF6Zqrq9OcG
obEPiytTOYhZPgL04E3lP9cR1/Y7wCCG1iGBRvYB0Z8wz+aW3C16ZTJxT6INliu0
jRnq7sdUCWn0H3JaVxRffuLNPkZ7sRd79qcuW/rxWBMI9uRc5Htszx7a8Uja0jY4
OVv4cEE1n+BdtsurBEnsoSn6SU9B6v5znNm8pgPRVyx4IDRiMwAac+QqmMrL98uI
+o3LXGYZW7Otmsope7/LsBHNvg6nvx+05Q/fvEjsl5fHlkidM+kySoKhXcg7pSR2
Uj5JvHDUev2ATDvULf8BrqUtNb35Ibv2JhDfNO6oCEV24Wzi+fn1F4WeU7XpXFkM
PlZjdDNXZ+cXp64YgsjR/YBosRxgIn40IZbmFnmhJ3wWExcBMJU=
=fQXJ
-----END PGP SIGNATURE-----

--Sig_/vfEzAq0GQt/8+FXAl2+Sytx--
