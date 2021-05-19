Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48BB388C57
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 13:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346074AbhESLIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 07:08:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240482AbhESLIh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 07:08:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CC176135B;
        Wed, 19 May 2021 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621422437;
        bh=0m9t4+GvdRUjo2pErg9cjhjDR6U2NczFaHFClLNIskg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EmXETGfvnJ6/BnwhJlgsBvPOBDQNkYV0MktK1cBCu9AXlxAnJRNJpcpMp2ftKfrdJ
         SrBUwLeCMO3lk4YHOksMDPcHOKY7HMcQywURzpMhTq1SV+xwsAgfLsiltc1tE12CtZ
         YZnuHvefJc4jg0d72OUWs9ELu10VVejKiJnanI73dRPXv8rz1GQqGFF/dhRvBre6C7
         nlRm0oqCO4KibOeQYHGt1RpNe9HRivMo0rbpgYdCsjbRJ4VlDw/k7x+UItn4oYw509
         NMPflNVw2Vu9Ag1P+Sb66WnlmWZuxlQaDHnETpw6w9yIpaldRx2bOoHRC6LNS4Dtgh
         Fwkzk1qcCn/IA==
Date:   Wed, 19 May 2021 13:07:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, rosenp@gmail.com
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
Message-ID: <20210519130711.75fc0f17@coco.lan>
In-Reply-To: <78322e18-2086-1eda-3b39-bbd71160be27@ideasonboard.com>
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
        <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
        <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
        <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
        <20210518092358.05c7a189@coco.lan>
        <78322e18-2086-1eda-3b39-bbd71160be27@ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 18 May 2021 11:18:02 +0100
Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On 18/05/2021 08:23, Mauro Carvalho Chehab wrote:
> > Em Mon, 17 May 2021 23:13:45 +0100
> > Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
> >   
> >> Ah, yes I should have been clearer there - but they don't do 'anything'
> >> except the bare minimum for both:
> >>
> >> ----------
> >> kbingham@Q:/opt/projects/media/v4l-utils$ cat make-autoconf.sh
> >> #!/bin/sh
> >>
> >> export CCACHE_DISABLE=true
> >>
> >> rm -rf build-autoconf
> >> mkdir -p build-autoconf
> >> cd build-autoconf
> >> ../configure  
> > 
> > This is not the bare minimum. It is just the opposite: the way we  
> 
> Ok, I'm sorry - I need to be clearer about my being clearer.
> 
> My *scripts* don't do anything except the bare minimum to build.

Ah, ok.

> > See, when one calls:
> > 
> > 	$ ./configure
> > 
> > It will display at the end the optional features that were enabled
> > that we found important enough to report:
> > 
> > compile time options summary
> > ============================
> > 
> >     Host OS                    : linux-gnu
> >     X11                        : yes
> >     GL                         : yes
> >     glu                        : yes
> >     libelf		       : yes
> >     libjpeg                    : yes
> >     libudev                    : yes
> >     pthread                    : yes
> >     QT version                 : v5.4 with QtGL
> >     ALSA support               : yes
> >     SDL support		       : yes
> > 
> >     build dynamic libs         : yes
> >     build static libs          : yes
> > 
> >     gconv                      : no
> > 
> >     dynamic libv4l             : yes
> >     v4l_plugins                : yes
> >     v4l_wrappers               : yes
> >     libdvbv5                   : yes
> >     dvbv5-daemon               : yes
> >     v4lutils                   : yes
> >     qv4l2                      : yes
> >     qvidcap                    : yes
> >     v4l2-ctl uses libv4l       : yes
> >     v4l2-ctl-32                : no
> >     v4l2-compliance            : yes
> >     v4l2-compliance uses libv4l: yes
> >     v4l2-compliance-32         : no
> >     BPF IR Decoders:           : no
> > 

> It would likely be useful to get a summary() of what is and isn't built
> from the meson to produce a comparable output summary.

Agreed. The best is to summarize at the end what optional features
were disabled.
 
> >> meson build-meson
> >> ninja -C build-meson  
> > 
> > I would be expecting that the above would do the same, but
> > it sounds it is lacking a lot of things...  
> 
> meson build-meson; ninja -C build-meson should be building a maximal
> configuration. (if it isn't, that's something to look at)

Yes. If meson is not building the same stuff at the same system,
there's a bug somewhere, as all the build dependencies should be
the same ;-)

> >>>> du -sh build-autoconf build-meson/
> >>>> 129M	build-autoconf
> >>>> 69M	build-meson/    
> 
> 
> However I do not think that difference alone can account for a 60MB
> difference.

It is probably some cpp files that weren't built. Those usually
produce larger execs and takes a lot more time to build than c
files.

> Re-reading my mail from last night - it looks like I was being overly
> enthusiastic on the speed differences. I'm sorry - it was late, and I
> was giddy watching it fly by. (The things people do for fun hey)


Yes, that was the impression I had. FYI, I don't care at all for
the building speed. Machine time is a lot cheaper than developers
and maintainers time ;-)

We never did (nor I think it makes sense to do) any changes at the
autoconf to make it run faster (there are some things that could probably
be done there to speed up some things).

So, what really concerns the amount of work to maintain, like how much
time was spent to fix building bugs not related to newly added code,
and how much efforts it takes to maintain the CI instances at
builder.linuxtv.org.

Right now, at builder, we have 1 project there hosted with meson,
1 project with cmake and the other non-kernel ones with autotools.

I never had to do anything at the server due to cmake/autotools build
issues on the project(s) that use them, but the only one that uses meson
requires constant interventions from my side to fix the build, as it
has been requiring from time to time  upgrades at the building
tool(*). So, it is a lot more expensive to maintain, as it consumes
*my* time ;-)

(*) Our server use the latest Debian version. Breakages there due to
    the lack of support of the cmake/autotools/meson version that
    it is there basically means that people using LTS distros won't
    be able to (easily) build the tool, as the distro-provided toolset
    is not enough.
    It is a bad idea to require that toolchain versions that aren't
    already provided by the major distros that aren't at EOL.

> > Assuming that both builds used the same compilers, a difference at 
> > the order of (tens of) MB can only be explained if Meson build
> > was very incomplete, and/or the output files don't carry the same
> > debug info.  
> 
> Indeed - compiler debug info level changes could be another thing to
> check. That could account for a larger build output difference, but
> there's certainly a large discrepancy to solve.

Yes. In order to do any sort of comparison, both should use exactly
the same flags (and compilers) when generating debug data. So, the
build size should be (about) same (**).

(**) It will never be the same, as each build toolchain produces
     different cache and temporary files and may eventually write a
     log file to help debugging issues (like autoconf does).

Thanks,
Mauro
