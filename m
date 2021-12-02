Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B787E4664DD
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 15:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357990AbhLBOFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 09:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358157AbhLBOFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 09:05:30 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B02C06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 06:02:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m27so71661310lfj.12
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZvNI0atX51pEuSqyG+H/+888DLLEzedGGl756j61SQ=;
        b=HnircyG4hWhV/gPF3DpXCbRajSwugEHHwPUZQQu8Xaga+ZHYtrWY9EqTwVNgD+dXri
         ny/3WkuqhwWPnD/IikBgNGealrX8f2bJCRUe6eoSovcEI0TiRQDx5m0Op2tLld2DzDrH
         pj40H8mbjIa2oVsy1KDIpmVU8bUcvGeQQI5XQjcWiwng0tQw7AJrrF803YNn2CGZlCof
         SNp6ZHCTNIZ5ev8BVRJI3wvhKtYqUJIqHTg9qb7uv5w/ApsxcWpFXFKKLB5PT0yId33e
         3ltR4/5UIiIPXIejcEN9DPsO+TlupMl+cyjYLRrG7mVkiGLcUS7jygWSB6pUIcezK5eM
         W2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZvNI0atX51pEuSqyG+H/+888DLLEzedGGl756j61SQ=;
        b=AJ8MyURf/mN2k0TjJNtBF48VRunakpqgSpVblPlpwndjfu91it+shQcA89Q9iqbP6v
         blKGYlqBqVUjFcQ1MF8sD4zPhYDEZ444XrpLp7rxvR3ZScSFLPw9I2rcH671MPsXIys1
         TRmue8KQf6odPTEd6Lk7cLfYiBar8VuRTtvBVIRCupcJudDWFhVBlUTzM9c3KbSau67k
         vLvQCokEaD4rWk7n9i7tvgMUT0prW164xyemEM9+4tRbas0aSt4b65Dq6nNs3qktZzQv
         WYTci0ggLYTBnnhv15aAv7pqYDKLG5K41IfOpc6d7TUDff9zKg0IzSe+X6Mo3EqoqX12
         J9kg==
X-Gm-Message-State: AOAM533gP9leqyVnnif6eteG+hJx90nlg1p3HzPObm91gs6G5DwGq1+/
        0B1GUTGKfgj1xm+GJCEM1ibcEgmAJPYHY3n6m4tkyi4OEad4Fg==
X-Google-Smtp-Source: ABdhPJxCupLs32rU2kO3YdzkJjsQfcTiFL9fXFLbtELKychlKz/xfM3LhmcaSmKxUdRBpAX0hw1+M2ftFzzoyIEFrC0=
X-Received: by 2002:a05:6512:3a85:: with SMTP id q5mr12601531lfu.94.1638453722276;
 Thu, 02 Dec 2021 06:02:02 -0800 (PST)
MIME-Version: 1.0
References: <a348a21b-b069-19b5-2565-d70e3161f2b5@xs4all.nl>
 <CAL9mu0+nyYSKbq0TnaPk5j-mYYXF3efyp290N_WHdJOkNoFfsg@mail.gmail.com>
 <ce38e9c6-42b9-f08a-c6c3-2abc416df9e8@xs4all.nl> <CAL9mu0K+LuMZa6r+E5bU4L2adg+=PPs6z9rfH3b=T_A97tQ6Mw@mail.gmail.com>
 <f9d3b754-083c-0cf3-3214-2a1f1aa09f7b@xs4all.nl>
In-Reply-To: <f9d3b754-083c-0cf3-3214-2a1f1aa09f7b@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 2 Dec 2021 22:01:25 +0800
Message-ID: <CAL9mu0K_8n0FuMt0iXJuk1PQh-FAtPEttJxyhW-hr1=f5P96YA@mail.gmail.com>
Subject: Re: [PATCH] v4l2-compliance: detect no-mmu systems
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Thu, 2 Dec 2021 at 19:10, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Dillon,
>
> On 27/11/2021 12:13, Dillon Min wrote:
> > Hi Hans,
> >
> > On Thu, 25 Nov 2021 at 22:12, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 25/11/2021 14:33, Dillon Min wrote:
> >>> Hi Hans,
> >>>
> >>> On Thu, 25 Nov 2021 at 21:14, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>>>
> >>>> Check if the OS has an MMU. If not, then skip tests that only work for
> >>>> systems that have an MMU.
> >>>>
> >>>> The safest and most generic method I found is the FIONBIO ioctl that is
> >>>> available for any file descriptor and is a write-only ioctl, so no memory
> >>>> will be accidentally written. On a MMU system this will return EFAULT, and
> >>>> on a ucLinux system this will return 0.
> >>>>
> >>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>> ---
> >>>> Dillon, the original RFC patch (1) I posted to fix this in the kernel is not
> >>>> the correct method. See:
> >>>>
> >>>> https://stackoverflow.com/questions/24755103/how-to-handle-null-pointer-argument-to-ioctl-system-call
> >>>
> >>> Thanks for the detailed information.
> >>>
> >>>>
> >>>> So instead I try to detect if there is an MMU in v4l2-compliance and, if not,
> >>>> just skip those tests that require an MMU.
> >>>>
> >>>> Can you test this patch?
> >>>
> >>> Sure, I'll test it then update the result.
> >>
> >> Note that v4l2-compliance should say at the top that it detects a no-MMU system:
> >>
> >>>> @@ -152,8 +153,21 @@ static struct option long_options[] = {
> >>>>
> >>>>  static void print_sha()
> >>>>  {
> >>>> +       int fd = open("/dev/null", O_RDONLY);
> >>>> +
> >>>> +       if (fd >= 0) {
> >>>> +               // FIONBIO is a write-only ioctl that takes an int argument that
> >>>> +               // enables (!= 0) or disables (== 0) nonblocking mode of a fd.
> >>>> +               //
> >>>> +               // Passing a nullptr should return EFAULT on MMU capable machines,
> >>>> +               // and it works if there is no MMU.
> >>>> +               has_mmu = ioctl(fd, FIONBIO, nullptr);
> >>>> +               close(fd);
> >>>> +       }
> >>>>         printf("v4l2-compliance %s%s, ", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
> >>>> -       printf("%zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
> >>>> +       printf("%zd bits, %zd-bit time_t%s\n",
> >>>> +              sizeof(void *) * 8, sizeof(time_t) * 8,
> >>>> +              has_mmu ? "" : ", has no MMU");
> >>
> >>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>
> >> Please verify that it actually does that. I hope it does :-)
> >
> > Yes, it works.
>
> Thank you for testing this. I merged this patch.
>
> >
> > ~ # v4l2-compliance -f -d /dev/video0
> > v4l2-compliance 1.23.0-4896, 32 bits, 32-bit time_t, has no MMU
> > v4l2-compliance SHA: 7858281c1cd1 2021-11-27 09:43:32
> >
> > Compliance test for stm-dma2d device /dev/video0:
> >
> > I added some extra changes for v4l-utils to make the configure step
> > working on no-mmu platform, just share here , my change just make the
> > compiler happy, i guess you have a more correct way here: )
>
> Can you post this as a separate patch to the mailinglist? That makes it
> easier to handle.

Ok, might be some days later.

>
> Note that fork can't be converted to vfork in v4l2-test-controls.cpp, so
> instead it needs to know if fork is available and put the test under a
> #ifdef HAVE_FORK or something like that.

Yes, reasonable. thanks.

>
> Regards,
>
>         Hans
>
> >
> > - add --without-argp options for configure.
> >
> > diff --git a/configure.ac b/configure.ac
> > index 0529898..3e87b5a 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -330,14 +330,23 @@ dl_saved_libs=$LIBS
> >    AC_SUBST([DLOPEN_LIBS])
> >  LIBS=$dl_saved_libs
> >
> > -AC_CHECK_HEADER([argp.h],,AC_MSG_ERROR(Cannot continue: argp.h not found))
> > +AC_ARG_WITH([argp],
> > +           AS_HELP_STRING([--without-argp], [Do not use argp.h]),
> > +           [],
> > +           [with_argp=yes])
> >  argp_saved_libs=$LIBS
> > -  AC_SEARCH_LIBS([argp_parse],
> > -                 [argp],
> > -                 [test "$ac_cv_search_argp_parse" = "none required"
> > || ARGP_LIBS=$ac_cv_search_argp_parse],
> > -                 [AC_MSG_ERROR([unable to find the argp_parse() function])])
> > -  AC_SUBST([ARGP_LIBS])
> > +AS_IF([test "x$with_argp" != xno],
> > +      [
> > +               AC_CHECK_HEADER([argp.h],,AC_MSG_ERROR(Cannot
> > continue: argp.h not found))]
> > +      AC_SEARCH_LIBS([argp_parse],
> > +                    [argp],
> > +                    [test "$ac_cv_search_argp_parse" = "none
> > required" || ARGP_LIBS=$ac_cv_search_argp_parse],
> > +                    [AC_MSG_ERROR([unable to find the argp_parse() function])])
> > +      AC_SUBST([ARGP_LIBS])
> > +      ],
> > +      )
> >  LIBS=$argp_saved_libs
> > +AM_CONDITIONAL([HAVE_ARGP], [test "x$with_argp" != xno])
> >
> >  AC_CHECK_FUNCS([fork],
> > AC_DEFINE([HAVE_LIBV4LCONVERT_HELPERS],[1],[whether to use
> > libv4lconvert helpers]))
> >  AM_CONDITIONAL([HAVE_LIBV4LCONVERT_HELPERS], [test x$ac_cv_func_fork = xyes])
> > @@ -561,7 +570,7 @@ AM_CONDITIONAL([WITH_GCONV],        [test
> > x$enable_gconv = xyes -a x$enable_shar
> >  AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test
> > x${enable_v4l2_ctl_libv4l} != xno])
> >  AM_CONDITIONAL([WITH_V4L2_CTL_STREAM_TO], [test
> > x${enable_v4l2_ctl_stream_to} != xno])
> >  AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
> > -AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
> > +AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xno])
> >  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork
> > = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
> >  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork =
> > xyes -a x${enable_v4l2_compliance_32} = xyes])
> >  PKG_CHECK_MODULES([LIBBPF], [libbpf], [bpf_pc=yes], [bpf_pc=no])
> > diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
> > index 5771ee4..8197e6d 100644
> > --- a/contrib/test/Makefile.am
> > +++ b/contrib/test/Makefile.am
> > @@ -2,9 +2,7 @@ noinst_PROGRAMS = \
> >         ioctl-test              \
> >         sliced-vbi-test         \
> >         sliced-vbi-detect       \
> > -       v4l2grab                \
> >         driver-test             \
> > -       mc_nextgen_test         \
> >         stress-buffer           \
> >         capture-example
> >
> > @@ -13,8 +11,15 @@ noinst_PROGRAMS += pixfmt-test
> >  endif
> >
> >  if HAVE_GLU
> > +if HAVE_ARGP
> >  noinst_PROGRAMS += v4l2gl
> >  endif
> > +endif
> > +
> > +if HAVE_ARGP
> > +noinst_PROGRAMS += mc_nextgen_test.c \
> > +                  v4l2grab
> > +endif
> >
> > - change fork to vfork
> >
> > diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp
> > b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > index 8731c9e..68b2c92 100644
> > --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > @@ -978,7 +978,7 @@ int testVividDisconnect(struct node *node)
> >         // This can only be tested with the vivid driver that enabled
> >         // the DISCONNECT control.
> >
> > -       pid_t pid = fork();
> > +       pid_t pid = vfork();
> >         if (pid == 0) {
> >                 struct timeval tv = { 5, 0 };
> >                 fd_set fds;
> > @@ -1010,7 +1010,7 @@ int testVividDisconnect(struct node *node)
> >
> >         node->reopen();
> >
> > -       pid = fork();
> > +       pid = vfork();
> >         if (pid == 0) {
> >                 struct epoll_event ep_ev;
> >                 int epollfd = epoll_create1(0);
> >
> > Best Regards
> > Dillon
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>>         if (strlen(STRING(GIT_SHA)))
> >>>>                 printf("v4l2-compliance SHA: %s %s\n",
> >>>>                        STRING(GIT_SHA), STRING(GIT_COMMIT_DATE));
>

Best Regards.
Dillon
