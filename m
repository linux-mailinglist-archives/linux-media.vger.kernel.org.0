Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D63178B324
	for <lists+linux-media@lfdr.de>; Mon, 28 Aug 2023 16:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjH1O3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Aug 2023 10:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbjH1O2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Aug 2023 10:28:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1EF10C
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 07:28:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CA6B60FEC
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 14:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2811C433C8
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693232927;
        bh=N7kjXP0ynpffkPJTpvnMNHrFwOATgnTbPGaRFkYy0mk=;
        h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
        b=qub9tz5xWDBXGULQn90IsuKQzId+vUyOGIzrnlV5wLmmE8Ix03ZS2ZcXHIUtUR4L9
         RB78G+1Ykg8bvjURKfQmSfi3hWkJErJRIf3srgM9koMePSsqUBFRiEz2bjSGyVmxu2
         SEAYSt2jELX9EWovo4Nfb3asPzc/V1j8+UXgbbTmT19VUhfOtbv0d4zIS0MewA5XO+
         OeCHjEXYtGbCz7ksLQGj4BeUbXzbHHMcPrnUZu6VNn75+VolVdt24dxA5nwJ8SlJ2w
         0R9yTp56G3HVvwyLb0js8R271BGXdNYP3Kmx1JFjk89lkxL8vYv0tRGyyNGYbMUG4O
         SkL0TVUGT3LbQ==
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5694a117254so1960700a12.0
        for <linux-media@vger.kernel.org>; Mon, 28 Aug 2023 07:28:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YxChOsvReAUvhNafqLN/P5mPFpyRgA05dfJcZgx84UbwbP2D1E7
        doT+A2Q8P1uTs0lqSgkpD5gEYHuny1R8tORD/fM=
X-Google-Smtp-Source: AGHT+IHUZOUNSRAljJXRT9yoRACKAdkxnZMa2DwrtmhYEiDxsg2JeRBhLZpUSxeY5FeHsWNHJ1fxVCQVvDLs3l9rTG8=
X-Received: by 2002:a17:90a:5ac6:b0:271:9e59:df28 with SMTP id
 n64-20020a17090a5ac600b002719e59df28mr1288446pji.29.1693232927210; Mon, 28
 Aug 2023 07:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
 <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4> <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
In-Reply-To: <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
Reply-To: wens@kernel.org
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 28 Aug 2023 22:28:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tsH8_5U7GQjhFuzV7=wqoihwy=3XZzbiisyf=B3s_hw@mail.gmail.com>
Message-ID: <CAGb2v67tsH8_5U7GQjhFuzV7=wqoihwy=3XZzbiisyf=B3s_hw@mail.gmail.com>
Subject: Re: [ANN] Introducing build scripts to test
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxtv-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 28, 2023 at 10:16=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>
> Hi Jacopo,
>
> On 28/08/2023 16:05, Jacopo Mondi wrote:
> > Hi Hans
> >
> > On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:
> >> Hi all,
> >>
> >> We have been working on simplifying the media maintenance, and one par=
t of that is
> >> standardizing on build tools, in particular to make it easier for patc=
h submitters
> >> to run their patches through the same set of tests that the daily buil=
d does.
> >>
> >> This helps detect issues before you submit your patches.
> >>
> >> I have been working since July on transforming my hackish scripts to s=
omething
> >> that is easier to use and of better quality. While there are still a f=
ew rough
> >> edges, I consider it good enough to have others start to use it.
> >>
> >> To get the build scripts run:
> >>
> >> git clone git://linuxtv.org/hverkuil/build-scripts.git
> >>
> >> All the test builds will happen within this directory. It is completel=
y separate
> >> from where you do you normal development, instead you point it to wher=
e your
> >> git repository is.
> >>
> >> See the README contained in the build-scripts git repo for all the det=
ails on
> >> how to set it up.
> >>
> >
> > I've been using your scripts since after ELC-E and I can tell they're
> > useful!
> >
> >> Currently the scripts expect a debian 12-based distro (likely debian 1=
1 will work
> >> as well). I have no idea if it works well on Red Hat or Suse. If you u=
se one of
> >> those distros, and you get it to work, then a patch updating the READM=
E file with
> >> the correct list of packages to install would be welcome.
> >>
> >
> > Speaking about distros, I was wondering if you still consider a
> > requirement to build all compiler or we should instead try to use the
> > distro provided ones when possible to test the distro-shipped version
> > ?
>
> I strongly believe we should build the cross compilers. The reason is tha=
t
> otherwise you get a wide variety of compiler versions, each with typicall=
y
> different compiler warnings. It's a pain for a developer to see different
> warnings than the person that merges those patches.
>
> It's a a regular problem that the daily build sees different warnings tha=
n
> you do locally with the distro's compiler.
>
> Doing it this way also makes it easier to upgrade to the latest compiler
> version, certainly quicker than a distro would do.
>
> It's about reproducibility, really.

If it's stability and/or reproducibility we want, maybe we could utilize th=
e
prebuilt toolchains from Linaro or Bootlin? That should cover a good array
of versions, while saving time by not having to build them.

ChenYu


> >> Please note that running the regression tests using virtme-ng is curre=
ntly only
> >> supported on Debian 12, not on e.g. Ubuntu. Someone is looking into th=
at, and
> >> hopefully we can support that in the future. Running regressions tests=
 are
> >> primarily useful when making changes to core frameworks and public API=
s, and
> >> it is possible to run them manually (see the README).
> >>
> >> Since running this locally can take a fair amount of time, we hope to =
have
> >> build servers available in the future so this can be offloaded.
> >>
> >> To give an idea of the expected build times:
> >>
> >> On an AMD Ryzen 9 6900HX (8 cores) a standard build of the staging tre=
e
> >> (build.sh -test all) takes 39 minutes.
> >>
> >> On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit over 13 m=
inutes.
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >> _______________________________________________
> >> linuxtv-ci mailing list
> >> linuxtv-ci@linuxtv.org
> >> https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci
>
