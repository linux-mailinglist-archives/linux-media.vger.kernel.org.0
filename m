Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E16F798A2B
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 17:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238251AbjIHPop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 11:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244735AbjIHPoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 11:44:44 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C524113E
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 08:44:36 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-414b3da2494so14244591cf.3
        for <linux-media@vger.kernel.org>; Fri, 08 Sep 2023 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1694187876; x=1694792676; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1q6EhjG8TuR1qimuTPq0XHoBebwamc4ioo1q9fwQ1Y4=;
        b=la38QbxfI8BHMOWZkDFFswNfJb2AKXoPrq8YTo+usKQL5gG8Z6wyQZcL8aB6DO4fqd
         AiaFaYKDvKM6Asv1oDcHmMTR9CDhiGhEQOeKXfioRHADeZ95kvIlIAW8LWVTOBQjvDm8
         fuslwYR3/GCRCeZfh3YOLVcMbYPFThs0x+68Ya5J25lCQEEG+C3M3EE3q4wHZF91K12d
         9Hmh52hf2vFbws2IPst3GncxEtblTQJ51kYdrNeAk5UbZ9c5s872p7oR01V18xDuJrSq
         Kyt3A3dD2CQvR32JUR3xNVOHZHk1JyLngPs0Y+zpMnv92gCKCDZRGdJF0tQeQkjC2VbV
         R0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694187876; x=1694792676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1q6EhjG8TuR1qimuTPq0XHoBebwamc4ioo1q9fwQ1Y4=;
        b=p8NsLI8Qe4blN0Ly6qNPIy6dCv1vhIuSBzsBVr3aLgXts8ELC9hYKi1xecUTWGOaFi
         y9aiSQRgObfYwNNeONOMHWi5B1BwKyKB1aM2RZm5ILxY4eUMnewee7HhOegn10xvYAKx
         pp3fEkODw2abpyOZQlKaM2GiHHs5Nj5bG/MDU4WZhxK54ZMEOA6/sQ/kTth9Gu8EtwOS
         9juIaTIhb0CxMMFjbDFtJoJwbwCmOl4FIsQCYO/uzCDCq4LTlKk0nGvf9x+I1ByK6mah
         43woGIdjGEyyN6vWFi3BGH4cIhbqiPaGMSYn7XpBHl6t3mmoUmWV7BxNhbgn8snSnCvZ
         7DZw==
X-Gm-Message-State: AOJu0YwWvwBDRnf6DevBPEowZN7PbKKsRttg5+smx9rPYyM8ChK+VBbd
        PZkxkRsw6MY0hnWkJQ1eT7sBUw==
X-Google-Smtp-Source: AGHT+IGvCNkb2bxHAM1H6/5FVMmJSXt/dsyAIfuYmmwZba7trplVhJqcRxMUFVjyQeg+eUa1G7NUeg==
X-Received: by 2002:a05:622a:38e:b0:412:2dac:acb9 with SMTP id j14-20020a05622a038e00b004122dacacb9mr2285854qtx.8.1694187875891;
        Fri, 08 Sep 2023 08:44:35 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:bae9::7a9])
        by smtp.gmail.com with ESMTPSA id iv4-20020a05622a6f0400b0040eaaaebf6fsm681685qtb.19.2023.09.08.08.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 08:44:35 -0700 (PDT)
Message-ID: <cb9546494cf5fb2cf50bb8d72a6adf1da68dd0b8.camel@ndufresne.ca>
Subject: Re: [ANN] Introducing build scripts to test
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Date:   Fri, 08 Sep 2023 11:44:34 -0400
In-Reply-To: <20230828144538.GQ14596@pendragon.ideasonboard.com>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
         <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
         <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
         <20230828142622.GO14596@pendragon.ideasonboard.com>
         <9fc67ba3-0951-ffdc-7fe9-b23598570f77@xs4all.nl>
         <20230828144538.GQ14596@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 28 ao=C3=BBt 2023 =C3=A0 17:45 +0300, Laurent Pinchart a =C3=A9cri=
t=C2=A0:
> On Mon, Aug 28, 2023 at 04:38:32PM +0200, Hans Verkuil wrote:
> > On 28/08/2023 16:26, Laurent Pinchart wrote:
> > > On Mon, Aug 28, 2023 at 04:14:56PM +0200, Hans Verkuil wrote:
> > > > On 28/08/2023 16:05, Jacopo Mondi wrote:
> > > > > On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:
> > > > > > Hi all,
> > > > > >=20
> > > > > > We have been working on simplifying the media maintenance, and =
one part of that is
> > > > > > standardizing on build tools, in particular to make it easier f=
or patch submitters
> > > > > > to run their patches through the same set of tests that the dai=
ly build does.
> > > > > >=20
> > > > > > This helps detect issues before you submit your patches.
> > > > > >=20
> > > > > > I have been working since July on transforming my hackish scrip=
ts to something
> > > > > > that is easier to use and of better quality. While there are st=
ill a few rough
> > > > > > edges, I consider it good enough to have others start to use it=
.
> > > > > >=20
> > > > > > To get the build scripts run:
> > > > > >=20
> > > > > > git clone git://linuxtv.org/hverkuil/build-scripts.git
> > > > > >=20
> > > > > > All the test builds will happen within this directory. It is co=
mpletely separate
> > > > > > from where you do you normal development, instead you point it =
to where your
> > > > > > git repository is.
> > > > > >=20
> > > > > > See the README contained in the build-scripts git repo for all =
the details on
> > > > > > how to set it up.
> > > > > >=20
> > > > >=20
> > > > > I've been using your scripts since after ELC-E and I can tell the=
y're
> > > > > useful!
> > > > >=20
> > > > > > Currently the scripts expect a debian 12-based distro (likely d=
ebian 11 will work
> > > > > > as well). I have no idea if it works well on Red Hat or Suse. I=
f you use one of
> > > > > > those distros, and you get it to work, then a patch updating th=
e README file with
> > > > > > the correct list of packages to install would be welcome.
> > > > >=20
> > > > > Speaking about distros, I was wondering if you still consider a
> > > > > requirement to build all compiler or we should instead try to use=
 the
> > > > > distro provided ones when possible to test the distro-shipped ver=
sion
> > > > > ?
> > > >=20
> > > > I strongly believe we should build the cross compilers. The reason =
is that
> > > > otherwise you get a wide variety of compiler versions, each with ty=
pically
> > > > different compiler warnings. It's a pain for a developer to see dif=
ferent
> > > > warnings than the person that merges those patches.
> > > >=20
> > > > It's a a regular problem that the daily build sees different warnin=
gs than
> > > > you do locally with the distro's compiler.
> > > >=20
> > > > Doing it this way also makes it easier to upgrade to the latest com=
piler
> > > > version, certainly quicker than a distro would do.
> > > >=20
> > > > It's about reproducibility, really.
> > >=20
> > > There's value in testing with different compiler versions though. The
> > > kernel's documented minimum gcc version is v5.1 at the moment. I
> > > certainly don't want to build myself with all versions between v5.1 a=
nd
> > > v13.2, but collectively we could cover more ground.
> > >=20
> > > Regardless of this, I already have recent cross compilers (built with
> > > buildroot) for ARM and ARM64, and I'd rather use those than duplicati=
ng
> > > compilers. Anything that consumes extra disk space is a serious
> > > hinderance.
> >=20
> > Feel free, but you run the risk that your PR is rejected because when I
> > run with these compiler versions I see new warnings. The whole point is
> > to be able to do the same tests before you make the PR to reduce the ri=
sk
> > of having to make a v2.
> >=20
> > FYI: the cross directory takes about 10 GB on my system. That can be
> > streamlined a bit by deleting some temporary directories needed while
> > building, probably to something closer to 5-6 GB.
>=20
> It may not be huge by itself, but it quickly adds up when you need to
> maintain multiple userspace cross-built enviroments, including Chrome
> OS, Android, Yocto, ... :-( I have half a TB of disk on my main
> development machine, and I would need at least 4 times that to cover my
> current needs comfortably.

I suppose this is irrelevant if you have a mean to send you PR to a machine=
 that
will validate it for you. This is something I'd like to see happen in the
future. Considering the very tiny number of devs doing PR, a first step cou=
ld be
to have a shared server in the cloud with the appropriate distro, compilers=
, and
just one more script to run test against a PR URI. This is quite minimal in=
fra
and maintenance, since this is identical to what everyone may have locally,=
 plus
having to install an SSH server and manages keys. Of course, scripts remain=
s,
and can be used locally with of course the possible oops of running somethi=
ng
slightly different, but with the benefit of not having to "push somewhere" =
to
validate.

We could also have an FDO project and use their infra, which would be a lot
nicer imho, but we can't enter FDO without bringing matching sponsorship fo=
r the
resources we'd be using. At least we should ask first, not serve ourself th=
ere.

Nicolas
>=20
> > > > > > Please note that running the regression tests using virtme-ng i=
s currently only
> > > > > > supported on Debian 12, not on e.g. Ubuntu. Someone is looking =
into that, and
> > > > > > hopefully we can support that in the future. Running regression=
s tests are
> > > > > > primarily useful when making changes to core frameworks and pub=
lic APIs, and
> > > > > > it is possible to run them manually (see the README).
> > > > > >=20
> > > > > > Since running this locally can take a fair amount of time, we h=
ope to have
> > > > > > build servers available in the future so this can be offloaded.
> > > > > >=20
> > > > > > To give an idea of the expected build times:
> > > > > >=20
> > > > > > On an AMD Ryzen 9 6900HX (8 cores) a standard build of the stag=
ing tree
> > > > > > (build.sh -test all) takes 39 minutes.
> > > > > >=20
> > > > > > On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit ov=
er 13 minutes.
>=20

