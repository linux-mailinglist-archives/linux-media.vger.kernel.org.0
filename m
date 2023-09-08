Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46A3799138
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 22:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235767AbjIHUrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 16:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjIHUrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 16:47:06 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB63A3
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 13:47:01 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-770ef353b8fso26191785a.0
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694206020; x=1694810820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEwQJ2LvWfcB/Tar8CPS3XxHnVT3YEM060BguGF4mtE=;
        b=aVpWLmwIN/4jDg4ztZGdkZzHrO5XQBAf3qrfN2QRhMVE1fpjqXUkPE/KxCI8Ij8htn
         8vDbNRXnPxajK7gC5vci5Bxu/kjj17Ikw/u8meJAsXp1h9/rSUMmXsbEBtv63hdNgDwP
         dLxw0nollTGAjWvkVYCV9lZlQoZ7E1eITyQos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694206020; x=1694810820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEwQJ2LvWfcB/Tar8CPS3XxHnVT3YEM060BguGF4mtE=;
        b=VZcN6s2ziO44uOb+ZrT+jQi0zHVc9I7Zv/v89PUEGTeZxvP8b1ItxMnbYYIuIDGIkc
         qs0bOZMIHM+VLgwaxss6kdj2odnrCKL7KRfd7l7wKW3e50lurSYIJfJOWaJ+JmH1Lfig
         Chzp+vZZU2NzqEutiyGHa2/uuL1vBR9W33EItV6Dx+H1atGVlFbseKzS4KgIAYeDxkLv
         x5OkD+iV5DJIeaCarpMoPSLARD7LL2GA4tcNDjpL8jhmyhyLmhK8K6xJebzSIyKQ6eIE
         keS9jFNbpXyOgdGrs7bDHHEcHLaCyL4ceDNy1xK/F/38AeYh42+vWGylOTCT6XwXrDgW
         VSTg==
X-Gm-Message-State: AOJu0Yz7SOoLxxotBGjywyZB05a1IYZOspbNInpYxUVf5WcE4g9EPOvy
        WY9qMC/ovxFiZddciWGVCjWAZrSNPPuWRm3BT6U=
X-Google-Smtp-Source: AGHT+IGrRu1loRQhYN2BoTo+L1VFaBfO7v+HrVQJoQPPxYXAH0caE27cWcQtBLuMnmymFh7CU7rkkg==
X-Received: by 2002:a05:620a:22ad:b0:76f:24bd:fef2 with SMTP id p13-20020a05620a22ad00b0076f24bdfef2mr3094362qkh.68.1694206020040;
        Fri, 08 Sep 2023 13:47:00 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id 20-20020a05620a071400b00767d6ec578csm854309qkc.20.2023.09.08.13.46.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 13:46:59 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6493389c56fso13648016d6.2
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 13:46:59 -0700 (PDT)
X-Received: by 2002:a0c:f352:0:b0:635:f899:660b with SMTP id
 e18-20020a0cf352000000b00635f899660bmr3568247qvm.36.1694206018504; Fri, 08
 Sep 2023 13:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
 <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
 <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl> <20230828142622.GO14596@pendragon.ideasonboard.com>
 <9fc67ba3-0951-ffdc-7fe9-b23598570f77@xs4all.nl> <20230828144538.GQ14596@pendragon.ideasonboard.com>
 <cb9546494cf5fb2cf50bb8d72a6adf1da68dd0b8.camel@ndufresne.ca>
 <CANiDSCtzzhppS0r5OjKLvneXByh-urD+g_bUtn=25UT6uOxMcw@mail.gmail.com> <acc2aaffde5d74500917a5113b7d87f9c2c6b7a4.camel@ndufresne.ca>
In-Reply-To: <acc2aaffde5d74500917a5113b7d87f9c2c6b7a4.camel@ndufresne.ca>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 8 Sep 2023 22:46:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCtpdBNtYOvP3cc9Q+wsdW+WGxFxBk8coSFAEWWtB2Fo_g@mail.gmail.com>
Message-ID: <CANiDSCtpdBNtYOvP3cc9Q+wsdW+WGxFxBk8coSFAEWWtB2Fo_g@mail.gmail.com>
Subject: Re: [ANN] Introducing build scripts to test
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas

On Fri, 8 Sept 2023 at 22:36, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Le vendredi 08 septembre 2023 =C3=A0 21:44 +0200, Ricardo Ribalda a =C3=
=A9crit :
> > Hi Nicolas
> >
> > On Fri, 8 Sept 2023 at 17:44, Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> > >
> > > Le lundi 28 ao=C3=BBt 2023 =C3=A0 17:45 +0300, Laurent Pinchart a =C3=
=A9crit :
> > > > On Mon, Aug 28, 2023 at 04:38:32PM +0200, Hans Verkuil wrote:
> > > > > On 28/08/2023 16:26, Laurent Pinchart wrote:
> > > > > > On Mon, Aug 28, 2023 at 04:14:56PM +0200, Hans Verkuil wrote:
> > > > > > > On 28/08/2023 16:05, Jacopo Mondi wrote:
> > > > > > > > On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrot=
e:
> > > > > > > > > Hi all,
> > > > > > > > >
> > > > > > > > > We have been working on simplifying the media maintenance=
, and one part of that is
> > > > > > > > > standardizing on build tools, in particular to make it ea=
sier for patch submitters
> > > > > > > > > to run their patches through the same set of tests that t=
he daily build does.
> > > > > > > > >
> > > > > > > > > This helps detect issues before you submit your patches.
> > > > > > > > >
> > > > > > > > > I have been working since July on transforming my hackish=
 scripts to something
> > > > > > > > > that is easier to use and of better quality. While there =
are still a few rough
> > > > > > > > > edges, I consider it good enough to have others start to =
use it.
> > > > > > > > >
> > > > > > > > > To get the build scripts run:
> > > > > > > > >
> > > > > > > > > git clone git://linuxtv.org/hverkuil/build-scripts.git
> > > > > > > > >
> > > > > > > > > All the test builds will happen within this directory. It=
 is completely separate
> > > > > > > > > from where you do you normal development, instead you poi=
nt it to where your
> > > > > > > > > git repository is.
> > > > > > > > >
> > > > > > > > > See the README contained in the build-scripts git repo fo=
r all the details on
> > > > > > > > > how to set it up.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I've been using your scripts since after ELC-E and I can te=
ll they're
> > > > > > > > useful!
> > > > > > > >
> > > > > > > > > Currently the scripts expect a debian 12-based distro (li=
kely debian 11 will work
> > > > > > > > > as well). I have no idea if it works well on Red Hat or S=
use. If you use one of
> > > > > > > > > those distros, and you get it to work, then a patch updat=
ing the README file with
> > > > > > > > > the correct list of packages to install would be welcome.
> > > > > > > >
> > > > > > > > Speaking about distros, I was wondering if you still consid=
er a
> > > > > > > > requirement to build all compiler or we should instead try =
to use the
> > > > > > > > distro provided ones when possible to test the distro-shipp=
ed version
> > > > > > > > ?
> > > > > > >
> > > > > > > I strongly believe we should build the cross compilers. The r=
eason is that
> > > > > > > otherwise you get a wide variety of compiler versions, each w=
ith typically
> > > > > > > different compiler warnings. It's a pain for a developer to s=
ee different
> > > > > > > warnings than the person that merges those patches.
> > > > > > >
> > > > > > > It's a a regular problem that the daily build sees different =
warnings than
> > > > > > > you do locally with the distro's compiler.
> > > > > > >
> > > > > > > Doing it this way also makes it easier to upgrade to the late=
st compiler
> > > > > > > version, certainly quicker than a distro would do.
> > > > > > >
> > > > > > > It's about reproducibility, really.
> > > > > >
> > > > > > There's value in testing with different compiler versions thoug=
h. The
> > > > > > kernel's documented minimum gcc version is v5.1 at the moment. =
I
> > > > > > certainly don't want to build myself with all versions between =
v5.1 and
> > > > > > v13.2, but collectively we could cover more ground.
> > > > > >
> > > > > > Regardless of this, I already have recent cross compilers (buil=
t with
> > > > > > buildroot) for ARM and ARM64, and I'd rather use those than dup=
licating
> > > > > > compilers. Anything that consumes extra disk space is a serious
> > > > > > hinderance.
> > > > >
> > > > > Feel free, but you run the risk that your PR is rejected because =
when I
> > > > > run with these compiler versions I see new warnings. The whole po=
int is
> > > > > to be able to do the same tests before you make the PR to reduce =
the risk
> > > > > of having to make a v2.
> > > > >
> > > > > FYI: the cross directory takes about 10 GB on my system. That can=
 be
> > > > > streamlined a bit by deleting some temporary directories needed w=
hile
> > > > > building, probably to something closer to 5-6 GB.
> > > >
> > > > It may not be huge by itself, but it quickly adds up when you need =
to
> > > > maintain multiple userspace cross-built enviroments, including Chro=
me
> > > > OS, Android, Yocto, ... :-( I have half a TB of disk on my main
> > > > development machine, and I would need at least 4 times that to cove=
r my
> > > > current needs comfortably.
> > >
> > > I suppose this is irrelevant if you have a mean to send you PR to a m=
achine that
> > > will validate it for you. This is something I'd like to see happen in=
 the
> > > future. Considering the very tiny number of devs doing PR, a first st=
ep could be
> > > to have a shared server in the cloud with the appropriate distro, com=
pilers, and
> > > just one more script to run test against a PR URI. This is quite mini=
mal infra
> > > and maintenance, since this is identical to what everyone may have lo=
cally, plus
> > > having to install an SSH server and manages keys. Of course, scripts =
remains,
> > > and can be used locally with of course the possible oops of running s=
omething
> > > slightly different, but with the benefit of not having to "push somew=
here" to
> > > validate.
> >
> > This is something we have just started to work on:
> >
> > https://docs.google.com/document/d/1HTpk73qqfZLjrrvUwbd4g11wd8e9TkXTXvz=
5FZBd52g/edit#heading=3Dh.4v9g2243whew
> >
> > The plan is to be able to test locally and in gitlab.
>
> Ok,let comment in there, though, I hope something will be sent to the ML =
form
> time to time, since that document will turn down many. I saw the quickly =
reading

It will become part of our documentation once everything is setup. I
really like google docs for the early stages of design docs. There is
no need to have a gmail account to use it.

> "life of a patch", and wasn't very impressed. I'd like to see something a=
 bit
> more forward looking, get out of the bubble of "maintainer" testing.

Not sure what you mean. Any developer can push their code to gitlab and tes=
t it.

The only "super-power" of the uploader is being able to press on
merge, after the PR has been validated by the CI/CD.

Coordinating when all the different PR land should be the job of
someone used to our community. Please note that the bar to become a
uploader will be much lower than becoming a core maintainer.

>
> Currently, reading this document, all the benefit of gitlab endup being "=
for
> maintainer only". I'd like to see a better vision for future of patch sub=
mission

Anyone can use gitlab if they want, but we are not forcing any
developer to use it. Anyone can still send patches to the ML and they
will eventually find their way on the media tree.

> that helps the submitter directly. It is the latency between reviewers to
> submitters that kills the flow, the more the submitters can fix by themse=
lf, the
> better.

We also have a long latency from until code is reviewed.

Looking forward to your comments on the doc :)




>
> >
> > >
> > > We could also have an FDO project and use their infra, which would be=
 a lot
> > > nicer imho, but we can't enter FDO without bringing matching sponsors=
hip for the
> > > resources we'd be using. At least we should ask first, not serve ours=
elf there.
> >
> > I aleady got some some google cloud sponsorship for the project if we
> > can land it ;)
>
> That is great news. Make sure to contact FDO admins. What about having a
> namespace there ?
>
> Nicolas
>
> >
> >
> > >
> > > Nicolas
> > > >
> > > > > > > > > Please note that running the regression tests using virtm=
e-ng is currently only
> > > > > > > > > supported on Debian 12, not on e.g. Ubuntu. Someone is lo=
oking into that, and
> > > > > > > > > hopefully we can support that in the future. Running regr=
essions tests are
> > > > > > > > > primarily useful when making changes to core frameworks a=
nd public APIs, and
> > > > > > > > > it is possible to run them manually (see the README).
> > > > > > > > >
> > > > > > > > > Since running this locally can take a fair amount of time=
, we hope to have
> > > > > > > > > build servers available in the future so this can be offl=
oaded.
> > > > > > > > >
> > > > > > > > > To give an idea of the expected build times:
> > > > > > > > >
> > > > > > > > > On an AMD Ryzen 9 6900HX (8 cores) a standard build of th=
e staging tree
> > > > > > > > > (build.sh -test all) takes 39 minutes.
> > > > > > > > >
> > > > > > > > > On an AMD Ryzen Threadripper 3970X (32 cores) it takes a =
bit over 13 minutes.
> > > >
> > >
> > >
> > > _______________________________________________
> > > linuxtv-ci mailing list
> > > linuxtv-ci@linuxtv.org
> > > https://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-ci
> >
> >
> >
>


--=20
Ricardo Ribalda
