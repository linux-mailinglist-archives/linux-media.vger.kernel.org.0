Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6EB4D324B
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbiCIP6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbiCIP6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:58:24 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E305F13C38E
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:57:20 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id o6so3794850ljp.3
        for <linux-media@vger.kernel.org>; Wed, 09 Mar 2022 07:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=uRrJk9I6I0JygYS8Nfm7oF2KaRsOGVLsz5+/Z+5DKdE=;
        b=VPNzwdaICMWP+EwcBw4RXmo2Mko+vMO35NpzFDt8YOSfsOBS2RO7S1t3f44S7cEszK
         pwKepkjKmBisHMP2LrBSm6Bg64iNty4Pm9COy63ogtE4rJ22BRkCXssF1rU1YqxCjteF
         sAo5wzdXNHtw52IDksDW32pri8yjr0y49Wa7ButgLuETxzP2lVfnFtp90jOJvZ+0Aos7
         DEE87Fd+wVsTJWA9AqHsQ+80rJCXyOAlgRP/NU+4FmCpmHGzmWOxFaooKYX2PFMRBwnh
         7Z9DIja7xMpkFpvp2yk2tA82ti+p8ibJDiiSP/OLbROIP0Sg3l8uLbwSZRbm9vRqYJZJ
         Y8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=uRrJk9I6I0JygYS8Nfm7oF2KaRsOGVLsz5+/Z+5DKdE=;
        b=YqyHYO+uppa4cKGtvtaUn8liXzc6qNGuE2IWn351s1wtyg7q51gON8fijHh1Nzn8TJ
         yrrU7b9r8C7JHKE5jPI1AAO69QcWR/8EDyzNDdxJdpLIRoWP1t+G8613qauCnMD2wFum
         pAR1Dl1yUnLJYgBLJ1g6aecdQ/zMLB7yaqwCx74Wr0bIUTwaC5qluaXgoKjL1lVOHn5w
         wff60jYyLqtwI8pzKppd0Gr7OhYJfEkmnO2Zevpco+EES7M/pvBN9fNPOUBQ49lzJVtp
         YJWA1SVzPevqwr87UtaBWOM5FO+HY7RSSfl8OaReJY6hUEFut+640u417PzikoGh4s7N
         ULAw==
X-Gm-Message-State: AOAM533P0Y191PcTvGHuoYNBVeP4iBodQThGy0rT6Y+6wB32MRA/BU2s
        YDZrDduP/CarqBqyCIkH1u0=
X-Google-Smtp-Source: ABdhPJwc2p8FrmsFOnupdbkv170YmGlqBlD/MOx29Q4JV8Lzh2r3v5sYI77eOZGoyM0b8SA/wdF19w==
X-Received: by 2002:a2e:5855:0:b0:23a:d545:ace6 with SMTP id x21-20020a2e5855000000b0023ad545ace6mr96677ljd.140.1646841436732;
        Wed, 09 Mar 2022 07:57:16 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id h12-20020a0565123c8c00b0044826d6ba04sm459231lfv.208.2022.03.09.07.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 07:57:16 -0800 (PST)
Date:   Wed, 9 Mar 2022 17:57:13 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Shashank Sharma <contactshashanksharma@gmail.com>,
        linux-media@vger.kernel.org,
        Shashank Sharma <shashank.sharma@amd.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Message-ID: <20220309175713.7eecddae@eldfell>
In-Reply-To: <0504cf48-ee7f-3de8-fc3b-5e5b14aeeed1@xs4all.nl>
References: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
        <faf5be22-07a2-f928-085e-1a1e2aa01b12@xs4all.nl>
        <20220308163053.70c81c0d@eldfell>
        <ac619e70-bedf-8855-f3e5-7f2aa3dc4f17@xs4all.nl>
        <20220309160933.78aba02a@eldfell>
        <0504cf48-ee7f-3de8-fc3b-5e5b14aeeed1@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6okYZctNvL967IBB4y+e3sY";
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

--Sig_/6okYZctNvL967IBB4y+e3sY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Mar 2022 15:45:29 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> On 3/9/22 15:09, Pekka Paalanen wrote:
> > On Tue, 8 Mar 2022 17:36:47 +0100
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >  =20
> >> Hi Pekka,
> >>
> >> On 3/8/22 15:30, Pekka Paalanen wrote: =20
> >>> On Tue, 8 Mar 2022 13:09:37 +0100
> >>> Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>>    =20
> >>>> Hi Shashank,
> >>>>
> >>>> There is no cover letter for this series, so I'll just reply to the
> >>>> first patch, but my comments are high-level and not specific to this
> >>>> patch.
> >>>>
> >>>> To be honest, I am not at all convinced that using edid-decode as a
> >>>> parser library is the right thing to do. It was never written with t=
hat
> >>>> in mind.   =20
> >>>
> >>> Hi Hans,
> >>>
> >>> in https://www.spinics.net/lists/linux-media/msg190064.html you wrote=
: =20
> >=20
> > ...
> >  =20
> >>>> I think edid-decode can function very well as a reference source for
> >>>> a real EDID parser since edid-decode is very complete, but not as a
> >>>> EDID parser library.   =20
> >>>
> >>> It would be a shame to have to fork edid-decode into something else a=
nd
> >>> then play catch-up with the real edid-decode for all times to come. Or
> >>> are you perhaps hoping that the fork would eventually completely
> >>> supersede the original project and developers would migrate to the new
> >>> one?
> >>>
> >>> It would be really nice to be able to involve the community around
> >>> edid-decode to make sure we get the library right, but if the library
> >>> is somewhere else, would that happen? Or are we left with yet another
> >>> half-written ad hoc EDID parsing code base used by maybe two display
> >>> servers?
> >>>
> >>> Maybe we could at least work on this proposal for a while to see what
> >>> it will start to look like before dismissing it?   =20
> >>
> >> If you are willing to put in the effort, then I think you would have to
> >> first rework the code bit by bit into different layers: =20
> >=20
> > Hi Hans,
> >=20
> > thanks! If Shashank agrees, we can see how this would start to look
> > like. I suppose there would be the occasional patch series sent to this
> > mailing list and publicly discussed between me and Shashank while we
> > iterate. You could mostly ignore it if you want until the two of us
> > need your guidance. =20
>=20
> I am generally available on irc (channel #linux-media at irc.oftc.net)
> during office hours (CET), so if you want to discuss this a bit more
> interactively, then contact me there.

Cool, I'm on EET.

> Just to make expectations clear: I'm happy to give advice, and of course =
review
> patches, but I don't have the time to help with the actual coding.

That is what I was hoping for, thanks!

> The main reason C++ is used for edid-decode (originally it was written in=
 plain
> C) are the STL containers. It's a pain to do that in C.
>=20
> Creating data structures for the parsed EDID data is definitely going to =
be
> tricky. And remember that e.g. new CTA/DisplayID Data Block types appear
> regularly, or new fields are added to existing Data Block types. So this
> will need some careful thought.

Right.

> > Btw. how does edid-decode regression testing work? I thought I asked in
> > the past, but I can't find my question or answer. I know what
> > edid-decode README and test/README says about it, but how does one
> > actually run through the tests? =20
>=20
> I clone https://github.com/linuxhw/EDID.git, then I have a little create.=
sh script
> located in the checked-out EDID directory:
>=20
> $ cat create.sh
> rm -rf data test x.pl update.sh lst
> cp -r ../edid-decode/data .
> cp -r ../edid-decode/test .
> rm test/README
> find Analog Digital data test -type f >lst
> cat <<'EOF' >x.pl
> while (<>) {
>         chomp;
>         $f =3D $_;
>         printf("( edid-decode --skip-sha -c -p -n \"$f\" >\"$f.new\" ; mv=
 \"$f.new\" \"$f\" ) &\n");
>         if (++$cnt % 5000 =3D=3D 0) {
>                 printf("sleep 5;\n");
>         }
> }
> EOF
> perl x.pl lst >update.sh
>=20
> echo >>update.sh
> echo 'echo Test for non-ASCII characters:' >>update.sh
> echo "git grep '[^ -~]' Analog Digital data" >>update.sh
> chmod +x update.sh
>=20
> rm x.pl lst
> ------------------------------------------------------
>=20
> It assumes the edid-decode directory is a sibling directory.
>=20
> Run this, and it will generate an update.sh script. Then run that in turn
> and it will update all EDIDs using the currently installed edid-decode.
> Then do 'git add data test' to add the data and test directories, and
> 'git commit -an' to commit it all (you probably want to make a branch
> first).
>=20
> Then, whenever I make changes to edid-decode I install it and run update.=
sh
> again and check with 'git diff' that the changes are what I expected.

Thanks for explaining.

Shashank, I think you need to use this testing procedure routinely to
make sure your patches do not change edid-decode behaviour, at least
with a sub-set of the EDID files.

> >=20
> > One thing I'm a little wary of is the edid-decode.js target in the
> > Makefile. How do you test that? =20
>=20
> Not :-)
>=20
> Someone else contributed that code, and it worked for him. I really should
> try to set something up so I can check it locally.

Do you mind if we won't be testing that either?

> >=20
> > On the other hand, if merging into edid-decode does not work, a new
> > project could have several benefits if I get to decide:
> >=20
> > - Meson build system
> > - automated test suite in the project
> > - Gitlab workflow hosted by freedesktop.org
> > - CI
> >=20
> > I must admit it is really tempting, but I'm scared of the amount of
> > work needed to establish a new project.
> >=20
> > I assume you are not interested in any of that in the current upstream
> > project, are you? =20
>=20
> It's currently too small of a project for Meson, but if this library thing
> becomes a reality, then that makes sense.
>=20
> Better automated testing is always welcome.

Those are great to hear!

> I don't want to move it to
> freedesktop, mostly because as media kernel developer I do all my work
> on linuxtv.org. So as long as I remain maintainer that's unlikely to chan=
ge.

Of course.

> CI is already done: it's build every day together with the kernel media c=
ode
> and v4l-utils in my daily build. Results of that are posted on the linux-=
media
> mailinglist.

Nice, but that is after merging patches, right? I was thinking
pre-merge.


Thanks,
pq

--Sig_/6okYZctNvL967IBB4y+e3sY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIozlkACgkQI1/ltBGq
qqfy8xAAmpsCdiV8PX3gVf0b6nLZTlZ5YKsfew+JDi+gKIGfgQlslZVRGjHq53Se
gYrqyu76T7TNaezve+jmR3RxgiHPZywGGf5jpZxYl1N3bqfGW2tnYXDvZq7J0Ial
PImVKE+33ruODFbKBYvWyTbu+vlhh0nTsnSQwZVga3b02GX/xDoSl75GA6IkWlT0
6B8Wfbrt3vfiey1O70NlmmvqvSnNivbB0UratjuCOiJMCwxysPhxTSUB+m9212VV
4K6HqEa5CcifObPmTbH8H1ba1DVQJEA40jWuICmuYpw+guxuzm+1/+LSMfNxkZOB
rY9QA1m8jXOXcEcHkUiiexG6yz5Gj2svsP3V1e3zzE8zJfVUwzRX44QBMn3ds2Hx
G2hZThlLjZ/AHRhD+k0HPd8jC8y6YBPsMilg7bAAbm9MlTK7KzjX8wZBO6ZG5TbG
MGiMoJt4VWtug4pv3gemgD3PMRpceMYuOY2E+tzZ/K9/9q7mwI3au5ttJoa/q+PN
yD2aOOcCHz75Uibi/uPCfxt1uESbScSKMQG728pUni2nDjd/9MwAgdzhDLT/Uz3D
BpilBq4zLXhi9Z8mcNS3xeoQlbS/VlTntviPsSfnvhjk87IGvDcikfyKe+Hdsj0q
ZLLdN16Sk0Sxr1mgS5nts9Fivh3r9sgOF1qMYypIMqaHbVSerMw=
=SQhb
-----END PGP SIGNATURE-----

--Sig_/6okYZctNvL967IBB4y+e3sY--
