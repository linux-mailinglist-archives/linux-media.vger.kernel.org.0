Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB91C359EEA
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 14:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhDIMgd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 08:36:33 -0400
Received: from gofer.mess.org ([88.97.38.141]:40405 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233038AbhDIMga (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 08:36:30 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5A640C63D7; Fri,  9 Apr 2021 13:36:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1617971774; bh=996jNZ+F4JkOxVtT8uW2P8te3I1PFZdM8Ss6tZTMaKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=of36ezC5+Ufwk3r+dgNX8TFWU1sGySN6e8h6kp024C8wEPdGCDOuRKm2LSSvjXOSD
         cV9OEqiM2uvFFgEyjI1e9GNCdY/JvfenDMcrba6DbH3BgZS4IIfOGJmAasplePPUpP
         U34BFIxvf6+HWvYwHHQkG1NdBaP5lgBgMatwuRK0jxXAxiyArOUCiG0GtxB16+ESn1
         GSB+2Dm+YHrPxKrEfOOEXjuqBNtMm1Xs/ftFe/MVsYoraoHgZF/0ApPOTWSfMbxVnR
         1DSH1Qu1DDl3oQ6bVCZQLBJ6C3Cg43dH/hhhwbFKTBKJPIQVGFtOR4ALrF5PFlfTP/
         +NH8tG0KaIyOQ==
Date:   Fri, 9 Apr 2021 13:36:14 +0100
From:   Sean Young <sean@mess.org>
To:     Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils v2 1/2] configure.ac: autodetect availability
 of systemd
Message-ID: <20210409123614.GA8622@gofer.mess.org>
References: <20210304132340.17069-1-u.oelmann@pengutronix.de>
 <6rblb62uu2.fsf@pengutronix.de>
 <6rsg43u9vj.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6rsg43u9vj.fsf@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ulrich,

You are right to remind me again -- I am sorry it took so long. Your patches
look great and they have been merged now.

Thank you,

Sean

On Tue, Apr 06, 2021 at 09:53:36AM +0200, Ulrich Ölmann wrote:
> Hi Sean,
> 
> another gentle ping for my small series. I am addressing you directly
> this time as you are recorded as delegate in [1].
> 
> Best regards
> Ulrich
> 
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=4756
> 
> On Fri, Mar 26 2021 at 09:16 +0100, Ulrich Ölmann <u.oelmann@pengutronix.de> wrote:
> > Gentle ping!
> >
> > There is series [1] ("Add support for meson building") which is
> > currently discussed. If you want me to take that into account and extend
> > my patches to meson, as well, I could readily do that in a v3.
> >
> > Best regards
> > Ulrich
> >
> >
> > [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=4887
> >
> > On Thu, Mar 04 2021 at 14:23 +0100, Ulrich Ölmann <u.oelmann@pengutronix.de> wrote:
> >> Import systemd's official suggestion [1] how this should be handled in packages
> >> using autoconf. A side effect of this is the removal of the hardcoded fallback
> >> path "/lib/systemd/system" which leaks build host information when cross
> >> compiling v4l-utils and therefore defeats reproducible builds.
> >>
> >> [1] https://www.freedesktop.org/software/systemd/man/daemon.html#Installing%20systemd%20Service%20Files
> >>
> >> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
> >> ---
> >> v1 --> v2:
> >>   - fixed autodetection
> >>   - extended commit message
> >>
> >>  configure.ac | 10 +++++++++-
> >>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/configure.ac b/configure.ac
> >> index 727730c5ccf4..8470116df4b1 100644
> >> --- a/configure.ac
> >> +++ b/configure.ac
> >> @@ -388,7 +388,15 @@ AC_ARG_WITH(udevdir,
> >>  AC_ARG_WITH(systemdsystemunitdir,
> >>  	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
> >>  	[],
> >> -	[with_systemdsystemunitdir=`$PKG_CONFIG --variable=systemdsystemunitdir systemd || echo /lib/systemd/system`])
> >> +	[with_systemdsystemunitdir=auto])
> >> +AS_IF([test "x$with_systemdsystemunitdir" = "xyes" -o "x$with_systemdsystemunitdir" = "xauto"],
> >> +      [def_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)
> >> +       AS_IF([test "x$def_systemdsystemunitdir" = "x"],
> >> +             [AS_IF([test "x$with_systemdsystemunitdir" = "xyes"],
> >> +                    [AC_MSG_ERROR([systemd support requested but pkg-config unable to query systemd package])])
> >> +              with_systemdsystemunitdir=no],
> >> +             [with_systemdsystemunitdir="$def_systemdsystemunitdir"])])
> >> +AM_CONDITIONAL([HAVE_SYSTEMD], [test "x$with_systemdsystemunitdir" != "xno"])
> >>  
> >>  # Generic check: works with most distributions
> >>  def_gconv_dir=`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; break; fi; done`
> -- 
> Pengutronix e.K.                           | Ulrich Ölmann               |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
