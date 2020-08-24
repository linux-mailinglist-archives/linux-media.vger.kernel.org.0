Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD385250BA4
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 00:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgHXW2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 18:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgHXW2o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 18:28:44 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD72C061574
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 15:28:44 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ep8so172757pjb.3
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2020 15:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5yqKeiG8cqORO130OkE6z46bx/i7G3TA5WBO25mpl8A=;
        b=gQCc9xlMbTCQK2wMRo89fRA0olaWhQXULgmaxp30EkIsUiWpgIsomzJ3YOjF/ErAQh
         5GU4sZ0iLxAKJGq9YcsD/g27z5tiqVmZd0eNBffraZ2OwA0TaSE09N0Z0MI56K9Z8nsA
         tzU1aHLBYoqgFFGaNWax5MzOLZ6fpf80YklzeBFDbdWNHIIaGK+/n1P7uJBozkUMvn2x
         IHHE8qJjwSgnQqejBVPDUOSTuH/hOCZne/oWmdlOKbvTM/0cCDM7tzevxfswy4T8cLIN
         pAfA1mqjN+LZYlNLmQwcFFeZ2NsFb+/pilhB6++GAFj4Phc1R5c/+x/lP2bZoHXJgzy7
         /I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5yqKeiG8cqORO130OkE6z46bx/i7G3TA5WBO25mpl8A=;
        b=n9rJf34utdmOEan7l9NMnSiFmp38WueqO0ehj9a1IFXCwZMO+UGMdbJ6nLOTgK4Y05
         5R3WidsXk91Qb62ctkA8qIRMizgQeMEqQW6lKMYwmEw/c6RqF4mT46/Zw3W61OI/D2jS
         3SsD90vCHSLLfEVINzFlaMScxLU/xJCqRKeEZa4oYnII+YP8bCGqq+5l6JESBRFDk4s9
         vtz+GKdAb3Vq2HJdzCdL8ndYK8OH6VLVBvbLpVY4tqvOO2jDiBM5K7+at/pedyP+/aho
         vPK3iAE332KjHEVsUJZHeQvxXCcah2IrUon/RzzHOU2GYNHJP4JTuMuaqFj80ebfpLuD
         sFjQ==
X-Gm-Message-State: AOAM533oqnsKy3r3a6wiY3rkI2ifA0QJTZjWklrhRqeUKdf2s5EDtM+v
        lcD7Bj96qguIL+9d/kTi07aLyALn+1sj3xXzYOXpTTwFQ9E=
X-Google-Smtp-Source: ABdhPJxDx29HkP3gu5XoDiJfB5bZa2FDT5Mj5Um74HgO35nN+SgSaY3ItE4MESn3E7TUtncc239qXPSDNOh9MysmAdA=
X-Received: by 2002:a17:90a:2c06:: with SMTP id m6mr1140285pjd.129.1598308123532;
 Mon, 24 Aug 2020 15:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200823164744.6191-1-chewi@gentoo.org> <79c5bdb0-4082-7a3b-d614-4f87bf61f01c@xs4all.nl>
In-Reply-To: <79c5bdb0-4082-7a3b-d614-4f87bf61f01c@xs4all.nl>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Mon, 24 Aug 2020 15:28:32 -0700
Message-ID: <CAKxU2N-CisdrTVi6_r-rjvpzjYBBuvmCgrz-cW=_P6uH1bi_nw@mail.gmail.com>
Subject: Re: [PATCH] configure.ac: Add --without-libudev option to avoid
 automagic dep
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     James Le Cuirot <chewi@gentoo.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 2:29 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi James,
>
> Can you elaborate a bit more in the commit log text? It's not clear to
> me what you mean with 'avoid automagic dep' or why you want to avoid it.
Something similar is done with OpenWrt to avoid picking up the host
libudev: https://github.com/openwrt/packages/blob/master/libs/libv4l/patches/010-remove-libudev-check.patch
>
> Regards,
>
>         Hans
>
> On 23/08/2020 18:47, James Le Cuirot wrote:
> > Signed-off-by: James Le Cuirot <chewi@gentoo.org>
> > ---
> >  configure.ac | 27 +++++++++++++++++----------
> >  1 file changed, 17 insertions(+), 10 deletions(-)
> >
> > diff --git a/configure.ac b/configure.ac
> > index d9f43ab5..e6134d08 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -291,16 +291,23 @@ else
> >     AC_MSG_WARN(ALSA library not available)
> >  fi
> >
> > -PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, have_libudev=no)
> > -if test "x$have_libudev" = "xyes"; then
> > -     AC_DEFINE([HAVE_LIBUDEV], [], [Use libudev])
> > -     LIBUDEV_CFLAGS="$libudev_CFLAGS"
> > -     LIBUDEV_LIBS="$libudev_LIBS"
> > -     AC_SUBST(LIBUDEV_CFLAGS)
> > -     AC_SUBST(LIBUDEV_LIBS)
> > -else
> > -   AC_MSG_WARN(udev library not available)
> > -fi
> > +AC_ARG_WITH([libudev],
> > +            AS_HELP_STRING([--without-libudev], [Do not use udev library]),
> > +            [],
> > +            [with_libudev=yes])
> > +
> > +have_libudev=no
> > +
> > +AS_IF([test "x$with_libudev" != xno -o "x$enable_libdvbv5" != xno],
> > +      [PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, [])
> > +       AS_IF([test "x$have_libudev" = xyes],
> > +             [AC_DEFINE([HAVE_LIBUDEV], [], [Use libudev])
> > +              LIBUDEV_CFLAGS="$libudev_CFLAGS"
> > +              LIBUDEV_LIBS="$libudev_LIBS"
> > +              AC_SUBST(LIBUDEV_CFLAGS)
> > +              AC_SUBST(LIBUDEV_LIBS)],
> > +             AC_MSG_WARN(udev library not available)
> > +            )])
> >
> >  AC_SUBST([JPEG_LIBS])
> >
> >
>
