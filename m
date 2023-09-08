Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF6C799065
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 21:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233399AbjIHTpu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 15:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbjIHTpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 15:45:49 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6ED268F
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 12:45:23 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-76dcf1d8957so132958685a.1
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 12:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694202257; x=1694807057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boNADrxjoGsXtT2/AtLNSaOvtbjHovyilK3E15ZLlS4=;
        b=leYdXa2uJSsUHP0XnXymb01TBCjLcSMhVBxAC+FL+g1rZ8t18lJ2G+2OvxBTkDcuaA
         2/AkB029NvOqdpb0gzudGNuL99nGIeQgbvOTxEvH6i+X9Hm1UjsA7sxzX9O9zI2gqABu
         2DEK7btwBgTv7F5bP3JAw1iDkxFvXPspGQsvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694202257; x=1694807057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boNADrxjoGsXtT2/AtLNSaOvtbjHovyilK3E15ZLlS4=;
        b=IFnp7UOF10gVCcNwf6GV2DRyvHXj/1nToBSeJAb5wJEQOWJ3MXfAYaca002F4eEoYo
         KM3uGHiLi/EAVJ1cwZFeVLKTgyD5DYAhgjMxZuX95SFRRvxQT9grtElVNZ5w7EBKLByO
         3dYBjjLy+LKEXHEuAFZl7Xn3Ap5zGniTStFYwLTjXTUXIYQ64JUik47USkXKVwoSf812
         xDJCZ1ochBDOaIuNOs+RElFMxtbYf1wv9a3SuACN0NgqrYbrNNN5Ejc6z692f+OC81Wh
         QrIU/ZYZTOjMi3Pn7srJkIz8mFNKtU1xt+MCVWVHLe5OEk/iGRaOID/G8fJSzcUvLkbg
         xazg==
X-Gm-Message-State: AOJu0YzjpCC4jw+PF+g+2mnjYe1sZQd00/lDaR7YrA9lPjbGkaXgl1x5
        WwCn2wLMd6tEFx9ozq6Ri1iO/Z03J3jSXtrERxg=
X-Google-Smtp-Source: AGHT+IFcuTo3cw+AdGTsRtdrsHbGXmiiORas6tK+k4+zNVF4tJMbhDfJ48XGHW2MXyVMISg+8R64SQ==
X-Received: by 2002:a05:620a:2991:b0:76e:e352:667a with SMTP id r17-20020a05620a299100b0076ee352667amr4046699qkp.35.1694202257414;
        Fri, 08 Sep 2023 12:44:17 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id q17-20020ae9e411000000b0076cb0ed2d7asm826130qkc.24.2023.09.08.12.44.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 12:44:16 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-655d1cf74faso2978996d6.1
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 12:44:15 -0700 (PDT)
X-Received: by 2002:a0c:b311:0:b0:655:6f63:17ee with SMTP id
 s17-20020a0cb311000000b006556f6317eemr2894007qve.61.1694202255455; Fri, 08
 Sep 2023 12:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
 <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
 <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl> <20230828142622.GO14596@pendragon.ideasonboard.com>
 <9fc67ba3-0951-ffdc-7fe9-b23598570f77@xs4all.nl> <20230828144538.GQ14596@pendragon.ideasonboard.com>
 <cb9546494cf5fb2cf50bb8d72a6adf1da68dd0b8.camel@ndufresne.ca>
In-Reply-To: <cb9546494cf5fb2cf50bb8d72a6adf1da68dd0b8.camel@ndufresne.ca>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 8 Sep 2023 21:44:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCtzzhppS0r5OjKLvneXByh-urD+g_bUtn=25UT6uOxMcw@mail.gmail.com>
Message-ID: <CANiDSCtzzhppS0r5OjKLvneXByh-urD+g_bUtn=25UT6uOxMcw@mail.gmail.com>
Subject: Re: [ANN] Introducing build scripts to test
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
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

Hi Nicolas

On Fri, 8 Sept 2023 at 17:44, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Le lundi 28 ao=C3=BBt 2023 =C3=A0 17:45 +0300, Laurent Pinchart a =C3=A9c=
rit :
> > On Mon, Aug 28, 2023 at 04:38:32PM +0200, Hans Verkuil wrote:
> > > On 28/08/2023 16:26, Laurent Pinchart wrote:
> > > > On Mon, Aug 28, 2023 at 04:14:56PM +0200, Hans Verkuil wrote:
> > > > > On 28/08/2023 16:05, Jacopo Mondi wrote:
> > > > > > On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > We have been working on simplifying the media maintenance, an=
d one part of that is
> > > > > > > standardizing on build tools, in particular to make it easier=
 for patch submitters
> > > > > > > to run their patches through the same set of tests that the d=
aily build does.
> > > > > > >
> > > > > > > This helps detect issues before you submit your patches.
> > > > > > >
> > > > > > > I have been working since July on transforming my hackish scr=
ipts to something
> > > > > > > that is easier to use and of better quality. While there are =
still a few rough
> > > > > > > edges, I consider it good enough to have others start to use =
it.
> > > > > > >
> > > > > > > To get the build scripts run:
> > > > > > >
> > > > > > > git clone git://linuxtv.org/hverkuil/build-scripts.git
> > > > > > >
> > > > > > > All the test builds will happen within this directory. It is =
completely separate
> > > > > > > from where you do you normal development, instead you point i=
t to where your
> > > > > > > git repository is.
> > > > > > >
> > > > > > > See the README contained in the build-scripts git repo for al=
l the details on
> > > > > > > how to set it up.
> > > > > > >
> > > > > >
> > > > > > I've been using your scripts since after ELC-E and I can tell t=
hey're
> > > > > > useful!
> > > > > >
> > > > > > > Currently the scripts expect a debian 12-based distro (likely=
 debian 11 will work
> > > > > > > as well). I have no idea if it works well on Red Hat or Suse.=
 If you use one of
> > > > > > > those distros, and you get it to work, then a patch updating =
the README file with
> > > > > > > the correct list of packages to install would be welcome.
> > > > > >
> > > > > > Speaking about distros, I was wondering if you still consider a
> > > > > > requirement to build all compiler or we should instead try to u=
se the
> > > > > > distro provided ones when possible to test the distro-shipped v=
ersion
> > > > > > ?
> > > > >
> > > > > I strongly believe we should build the cross compilers. The reaso=
n is that
> > > > > otherwise you get a wide variety of compiler versions, each with =
typically
> > > > > different compiler warnings. It's a pain for a developer to see d=
ifferent
> > > > > warnings than the person that merges those patches.
> > > > >
> > > > > It's a a regular problem that the daily build sees different warn=
ings than
> > > > > you do locally with the distro's compiler.
> > > > >
> > > > > Doing it this way also makes it easier to upgrade to the latest c=
ompiler
> > > > > version, certainly quicker than a distro would do.
> > > > >
> > > > > It's about reproducibility, really.
> > > >
> > > > There's value in testing with different compiler versions though. T=
he
> > > > kernel's documented minimum gcc version is v5.1 at the moment. I
> > > > certainly don't want to build myself with all versions between v5.1=
 and
> > > > v13.2, but collectively we could cover more ground.
> > > >
> > > > Regardless of this, I already have recent cross compilers (built wi=
th
> > > > buildroot) for ARM and ARM64, and I'd rather use those than duplica=
ting
> > > > compilers. Anything that consumes extra disk space is a serious
> > > > hinderance.
> > >
> > > Feel free, but you run the risk that your PR is rejected because when=
 I
> > > run with these compiler versions I see new warnings. The whole point =
is
> > > to be able to do the same tests before you make the PR to reduce the =
risk
> > > of having to make a v2.
> > >
> > > FYI: the cross directory takes about 10 GB on my system. That can be
> > > streamlined a bit by deleting some temporary directories needed while
> > > building, probably to something closer to 5-6 GB.
> >
> > It may not be huge by itself, but it quickly adds up when you need to
> > maintain multiple userspace cross-built enviroments, including Chrome
> > OS, Android, Yocto, ... :-( I have half a TB of disk on my main
> > development machine, and I would need at least 4 times that to cover my
> > current needs comfortably.
>
> I suppose this is irrelevant if you have a mean to send you PR to a machi=
ne that
> will validate it for you. This is something I'd like to see happen in the
> future. Considering the very tiny number of devs doing PR, a first step c=
ould be
> to have a shared server in the cloud with the appropriate distro, compile=
rs, and
> just one more script to run test against a PR URI. This is quite minimal =
infra
> and maintenance, since this is identical to what everyone may have locall=
y, plus
> having to install an SSH server and manages keys. Of course, scripts rema=
ins,
> and can be used locally with of course the possible oops of running somet=
hing
> slightly different, but with the benefit of not having to "push somewhere=
" to
> validate.

This is something we have just started to work on:

https://docs.google.com/document/d/1HTpk73qqfZLjrrvUwbd4g11wd8e9TkXTXvz5FZB=
d52g/edit#heading=3Dh.4v9g2243whew

The plan is to be able to test locally and in gitlab.

>
> We could also have an FDO project and use their infra, which would be a l=
ot
> nicer imho, but we can't enter FDO without bringing matching sponsorship =
for the
> resources we'd be using. At least we should ask first, not serve ourself =
there.

I aleady got some some google cloud sponsorship for the project if we
can land it ;)


>
> Nicolas
> >
> > > > > > > Please note that running the regression tests using virtme-ng=
 is currently only
> > > > > > > supported on Debian 12, not on e.g. Ubuntu. Someone is lookin=
g into that, and
> > > > > > > hopefully we can support that in the future. Running regressi=
ons tests are
> > > > > > > primarily useful when making changes to core frameworks and p=
ublic APIs, and
> > > > > > > it is possible to run them manually (see the README).
> > > > > > >
> > > > > > > Since running this locally can take a fair amount of time, we=
 hope to have
> > > > > > > build servers available in the future so this can be offloade=
d.
> > > > > > >
> > > > > > > To give an idea of the expected build times:
> > > > > > >
> > > > > > > On an AMD Ryzen 9 6900HX (8 cores) a standard build of the st=
aging tree
> > > > > > > (build.sh -test all) takes 39 minutes.
> > > > > > >
> > > > > > > On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit =
over 13 minutes.
> >
>
>
> _______________________________________________
> linuxtv-ci mailing list
> linuxtv-ci@linuxtv.org
> https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci



--=20
Ricardo Ribalda
