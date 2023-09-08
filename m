Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68EB799112
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 22:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239020AbjIHUhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 16:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbjIHUhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 16:37:31 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763731704
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 13:37:10 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-414d37bd1e9so17240421cf.3
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 13:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1694205414; x=1694810214; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dx4aWCPb9+Waki0VOtq0duYEl5Fd6pBxKq3tHZzgJ3Y=;
        b=0rjIwaz0yQXxntLrDilSBNwhS1Dgo/PIjIjiqoGulXSUSj0UUlPsUwdVnkWK+jHXbm
         tm5D69hZbM0dr6xhUgVbgR9sVfgPNtxFiTtgnHii4yzkeBFSAKkJ1KhufyMUsW7+aeg6
         FEG+rZ7r8v5WftOeGwztj9rEoFmJkZoqnN5701mRhSzgPOU0tS+5pQomKzARoWgNLpHF
         43NBr33kJ85vnltQWEJ+Ehnl/LqwNdEFAl7D1Lc9y8orMwMqXL1KG9UC12vLnSzRLZqL
         nY/Ooi+qls1MnqI4i8shmqUAvnvtvFtqWYz4LNnfUS0DmBGK1KjYIol27vPD246Cj8Zy
         /QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694205414; x=1694810214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dx4aWCPb9+Waki0VOtq0duYEl5Fd6pBxKq3tHZzgJ3Y=;
        b=JHwCT6/UCTp4TMZ26OoCqlGIIzedaL5zWcDE95TgMIqEUzvvzobz+GpXqiTRhS2cXa
         gN5rUpMAXym7OYDV3FC5k3zwqGm11JpSN6rNtBvLE1U3qDD+KpVLHYYDU2lqyugd29gv
         gVjK17agTYAz9Ofd9D+iiOvVZE2NZbs14FYvkRBdMSZJvXJGMWys1GSa4az662ZPSM7C
         uDvf1AcVGZHywyZAKqZWhXoryFDbSovwz8LxGhLmf2v9zQ73TaK7UzxGosgDvFPFeZpn
         GOwNh030DgyO2KWZaD3NX4IoRace+liqGryUskTBWDtxyWr8Cz0TVMyy3KGetN0ENsMK
         r0TA==
X-Gm-Message-State: AOJu0YwXJOTUmSOOK1fs7uJv6wB8qjEuQ0tHBEcYWpNcjexo3Wvx3SN/
        DnZ0vI3YfJCX5yeJsopFRS5LThfuiJWq9nfgzes=
X-Google-Smtp-Source: AGHT+IGXhNFimRmUFpdFgMtOMvJodr4NNqMAlnkyAiBhUlj8Isdu5EPB5/XhV9elfP1qxGr4UUUKJw==
X-Received: by 2002:a05:622a:1042:b0:413:3384:d43f with SMTP id f2-20020a05622a104200b004133384d43fmr4628190qte.11.1694205413730;
        Fri, 08 Sep 2023 13:36:53 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
        by smtp.gmail.com with ESMTPSA id u8-20020ac858c8000000b00403ff38d855sm875151qta.4.2023.09.08.13.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 13:36:53 -0700 (PDT)
Message-ID: <acc2aaffde5d74500917a5113b7d87f9c2c6b7a4.camel@ndufresne.ca>
Subject: Re: [ANN] Introducing build scripts to test
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Fri, 08 Sep 2023 16:36:51 -0400
In-Reply-To: <CANiDSCtzzhppS0r5OjKLvneXByh-urD+g_bUtn=25UT6uOxMcw@mail.gmail.com>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
         <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
         <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
         <20230828142622.GO14596@pendragon.ideasonboard.com>
         <9fc67ba3-0951-ffdc-7fe9-b23598570f77@xs4all.nl>
         <20230828144538.GQ14596@pendragon.ideasonboard.com>
         <cb9546494cf5fb2cf50bb8d72a6adf1da68dd0b8.camel@ndufresne.ca>
         <CANiDSCtzzhppS0r5OjKLvneXByh-urD+g_bUtn=25UT6uOxMcw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 08 septembre 2023 =C3=A0 21:44 +0200, Ricardo Ribalda a =C3=A9c=
rit=C2=A0:
> Hi Nicolas
>=20
> On Fri, 8 Sept 2023 at 17:44, Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
> >=20
> > Le lundi 28 ao=C3=BBt 2023 =C3=A0 17:45 +0300, Laurent Pinchart a =C3=
=A9crit :
> > > On Mon, Aug 28, 2023 at 04:38:32PM +0200, Hans Verkuil wrote:
> > > > On 28/08/2023 16:26, Laurent Pinchart wrote:
> > > > > On Mon, Aug 28, 2023 at 04:14:56PM +0200, Hans Verkuil wrote:
> > > > > > On 28/08/2023 16:05, Jacopo Mondi wrote:
> > > > > > > On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:
> > > > > > > > Hi all,
> > > > > > > >=20
> > > > > > > > We have been working on simplifying the media maintenance, =
and one part of that is
> > > > > > > > standardizing on build tools, in particular to make it easi=
er for patch submitters
> > > > > > > > to run their patches through the same set of tests that the=
 daily build does.
> > > > > > > >=20
> > > > > > > > This helps detect issues before you submit your patches.
> > > > > > > >=20
> > > > > > > > I have been working since July on transforming my hackish s=
cripts to something
> > > > > > > > that is easier to use and of better quality. While there ar=
e still a few rough
> > > > > > > > edges, I consider it good enough to have others start to us=
e it.
> > > > > > > >=20
> > > > > > > > To get the build scripts run:
> > > > > > > >=20
> > > > > > > > git clone git://linuxtv.org/hverkuil/build-scripts.git
> > > > > > > >=20
> > > > > > > > All the test builds will happen within this directory. It i=
s completely separate
> > > > > > > > from where you do you normal development, instead you point=
 it to where your
> > > > > > > > git repository is.
> > > > > > > >=20
> > > > > > > > See the README contained in the build-scripts git repo for =
all the details on
> > > > > > > > how to set it up.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > I've been using your scripts since after ELC-E and I can tell=
 they're
> > > > > > > useful!
> > > > > > >=20
> > > > > > > > Currently the scripts expect a debian 12-based distro (like=
ly debian 11 will work
> > > > > > > > as well). I have no idea if it works well on Red Hat or Sus=
e. If you use one of
> > > > > > > > those distros, and you get it to work, then a patch updatin=
g the README file with
> > > > > > > > the correct list of packages to install would be welcome.
> > > > > > >=20
> > > > > > > Speaking about distros, I was wondering if you still consider=
 a
> > > > > > > requirement to build all compiler or we should instead try to=
 use the
> > > > > > > distro provided ones when possible to test the distro-shipped=
 version
> > > > > > > ?
> > > > > >=20
> > > > > > I strongly believe we should build the cross compilers. The rea=
son is that
> > > > > > otherwise you get a wide variety of compiler versions, each wit=
h typically
> > > > > > different compiler warnings. It's a pain for a developer to see=
 different
> > > > > > warnings than the person that merges those patches.
> > > > > >=20
> > > > > > It's a a regular problem that the daily build sees different wa=
rnings than
> > > > > > you do locally with the distro's compiler.
> > > > > >=20
> > > > > > Doing it this way also makes it easier to upgrade to the latest=
 compiler
> > > > > > version, certainly quicker than a distro would do.
> > > > > >=20
> > > > > > It's about reproducibility, really.
> > > > >=20
> > > > > There's value in testing with different compiler versions though.=
 The
> > > > > kernel's documented minimum gcc version is v5.1 at the moment. I
> > > > > certainly don't want to build myself with all versions between v5=
.1 and
> > > > > v13.2, but collectively we could cover more ground.
> > > > >=20
> > > > > Regardless of this, I already have recent cross compilers (built =
with
> > > > > buildroot) for ARM and ARM64, and I'd rather use those than dupli=
cating
> > > > > compilers. Anything that consumes extra disk space is a serious
> > > > > hinderance.
> > > >=20
> > > > Feel free, but you run the risk that your PR is rejected because wh=
en I
> > > > run with these compiler versions I see new warnings. The whole poin=
t is
> > > > to be able to do the same tests before you make the PR to reduce th=
e risk
> > > > of having to make a v2.
> > > >=20
> > > > FYI: the cross directory takes about 10 GB on my system. That can b=
e
> > > > streamlined a bit by deleting some temporary directories needed whi=
le
> > > > building, probably to something closer to 5-6 GB.
> > >=20
> > > It may not be huge by itself, but it quickly adds up when you need to
> > > maintain multiple userspace cross-built enviroments, including Chrome
> > > OS, Android, Yocto, ... :-( I have half a TB of disk on my main
> > > development machine, and I would need at least 4 times that to cover =
my
> > > current needs comfortably.
> >=20
> > I suppose this is irrelevant if you have a mean to send you PR to a mac=
hine that
> > will validate it for you. This is something I'd like to see happen in t=
he
> > future. Considering the very tiny number of devs doing PR, a first step=
 could be
> > to have a shared server in the cloud with the appropriate distro, compi=
lers, and
> > just one more script to run test against a PR URI. This is quite minima=
l infra
> > and maintenance, since this is identical to what everyone may have loca=
lly, plus
> > having to install an SSH server and manages keys. Of course, scripts re=
mains,
> > and can be used locally with of course the possible oops of running som=
ething
> > slightly different, but with the benefit of not having to "push somewhe=
re" to
> > validate.
>=20
> This is something we have just started to work on:
>=20
> https://docs.google.com/document/d/1HTpk73qqfZLjrrvUwbd4g11wd8e9TkXTXvz5F=
ZBd52g/edit#heading=3Dh.4v9g2243whew
>=20
> The plan is to be able to test locally and in gitlab.

Ok,let comment in there, though, I hope something will be sent to the ML fo=
rm
time to time, since that document will turn down many. I saw the quickly re=
ading
"life of a patch", and wasn't very impressed. I'd like to see something a b=
it
more forward looking, get out of the bubble of "maintainer" testing.

Currently, reading this document, all the benefit of gitlab endup being "fo=
r
maintainer only". I'd like to see a better vision for future of patch submi=
ssion
that helps the submitter directly. It is the latency between reviewers to
submitters that kills the flow, the more the submitters can fix by themself=
, the
better.

>=20
> >=20
> > We could also have an FDO project and use their infra, which would be a=
 lot
> > nicer imho, but we can't enter FDO without bringing matching sponsorshi=
p for the
> > resources we'd be using. At least we should ask first, not serve oursel=
f there.
>=20
> I aleady got some some google cloud sponsorship for the project if we
> can land it ;)

That is great news. Make sure to contact FDO admins. What about having a
namespace there ?

Nicolas

>=20
>=20
> >=20
> > Nicolas
> > >=20
> > > > > > > > Please note that running the regression tests using virtme-=
ng is currently only
> > > > > > > > supported on Debian 12, not on e.g. Ubuntu. Someone is look=
ing into that, and
> > > > > > > > hopefully we can support that in the future. Running regres=
sions tests are
> > > > > > > > primarily useful when making changes to core frameworks and=
 public APIs, and
> > > > > > > > it is possible to run them manually (see the README).
> > > > > > > >=20
> > > > > > > > Since running this locally can take a fair amount of time, =
we hope to have
> > > > > > > > build servers available in the future so this can be offloa=
ded.
> > > > > > > >=20
> > > > > > > > To give an idea of the expected build times:
> > > > > > > >=20
> > > > > > > > On an AMD Ryzen 9 6900HX (8 cores) a standard build of the =
staging tree
> > > > > > > > (build.sh -test all) takes 39 minutes.
> > > > > > > >=20
> > > > > > > > On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bi=
t over 13 minutes.
> > >=20
> >=20
> >=20
> > _______________________________________________
> > linuxtv-ci mailing list
> > linuxtv-ci@linuxtv.org
> > https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci
>=20
>=20
>=20

