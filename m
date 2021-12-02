Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3834A466215
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 12:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345845AbhLBLON (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 06:14:13 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.167]:50758 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236611AbhLBLOI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 06:14:08 -0500
X-KPN-MessageId: 712b5eb7-5360-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 712b5eb7-5360-11ec-9a2e-005056abbe64;
        Thu, 02 Dec 2021 12:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:mime-version:date:message-id:from:to:subject;
        bh=qu5nvte21sX33jWI8CILh0GOko8ItF1+36qMkbXFX0o=;
        b=dvUc5/pN+fk8fcWSIFSbYdAQvWkautUTfEu0jJjCtCK2FAIUCybihNIC14reGJLr2fsGjqZHVVojg
         SRQf3pBcypLkT5iHEijdv1usj1a1vbNgfJRlrNgZ+gyWBAGWhnDe21z6SWLcnADwXQ3gorHwj0zasw
         rtyAhgZRolRNWIuSgcsIYspBSlcgyb3WI/WhMXHiBQfKyRm3lSHjdajUTQi8ciQgE+8jJi6OjUAmfa
         4Fu92IzRlY5vpyr8xN44IgznfX1kz2U0ox1SxauagGeJgIGVxMR+PIYb+1eXgeejjpCKDCqLqzcJtZ
         7DluvT1j9NCr1Iyfqf1iUJvAcTMpBhg==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|s1MbanztEy0WfIyDeuRtCgAyuS/4GvOam1M5/4ygZM55DrI8xg1/gMo1yBYFFRo
 FaTKxZ6Fs9HbRtkqlhE0rDw==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 7e5b7f6f-5360-11ec-b76f-005056ab7584;
        Thu, 02 Dec 2021 12:10:44 +0100 (CET)
Subject: Re: [PATCH] v4l2-compliance: detect no-mmu systems
To:     Dillon Min <dillon.minfei@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <a348a21b-b069-19b5-2565-d70e3161f2b5@xs4all.nl>
 <CAL9mu0+nyYSKbq0TnaPk5j-mYYXF3efyp290N_WHdJOkNoFfsg@mail.gmail.com>
 <ce38e9c6-42b9-f08a-c6c3-2abc416df9e8@xs4all.nl>
 <CAL9mu0K+LuMZa6r+E5bU4L2adg+=PPs6z9rfH3b=T_A97tQ6Mw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f9d3b754-083c-0cf3-3214-2a1f1aa09f7b@xs4all.nl>
Date:   Thu, 2 Dec 2021 12:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0K+LuMZa6r+E5bU4L2adg+=PPs6z9rfH3b=T_A97tQ6Mw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dillon,

On 27/11/2021 12:13, Dillon Min wrote:
> Hi Hans,
> 
> On Thu, 25 Nov 2021 at 22:12, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 25/11/2021 14:33, Dillon Min wrote:
>>> Hi Hans,
>>>
>>> On Thu, 25 Nov 2021 at 21:14, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>
>>>> Check if the OS has an MMU. If not, then skip tests that only work for
>>>> systems that have an MMU.
>>>>
>>>> The safest and most generic method I found is the FIONBIO ioctl that is
>>>> available for any file descriptor and is a write-only ioctl, so no memory
>>>> will be accidentally written. On a MMU system this will return EFAULT, and
>>>> on a ucLinux system this will return 0.
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> ---
>>>> Dillon, the original RFC patch (1) I posted to fix this in the kernel is not
>>>> the correct method. See:
>>>>
>>>> https://stackoverflow.com/questions/24755103/how-to-handle-null-pointer-argument-to-ioctl-system-call
>>>
>>> Thanks for the detailed information.
>>>
>>>>
>>>> So instead I try to detect if there is an MMU in v4l2-compliance and, if not,
>>>> just skip those tests that require an MMU.
>>>>
>>>> Can you test this patch?
>>>
>>> Sure, I'll test it then update the result.
>>
>> Note that v4l2-compliance should say at the top that it detects a no-MMU system:
>>
>>>> @@ -152,8 +153,21 @@ static struct option long_options[] = {
>>>>
>>>>  static void print_sha()
>>>>  {
>>>> +       int fd = open("/dev/null", O_RDONLY);
>>>> +
>>>> +       if (fd >= 0) {
>>>> +               // FIONBIO is a write-only ioctl that takes an int argument that
>>>> +               // enables (!= 0) or disables (== 0) nonblocking mode of a fd.
>>>> +               //
>>>> +               // Passing a nullptr should return EFAULT on MMU capable machines,
>>>> +               // and it works if there is no MMU.
>>>> +               has_mmu = ioctl(fd, FIONBIO, nullptr);
>>>> +               close(fd);
>>>> +       }
>>>>         printf("v4l2-compliance %s%s, ", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
>>>> -       printf("%zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
>>>> +       printf("%zd bits, %zd-bit time_t%s\n",
>>>> +              sizeof(void *) * 8, sizeof(time_t) * 8,
>>>> +              has_mmu ? "" : ", has no MMU");
>>
>>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Please verify that it actually does that. I hope it does :-)
> 
> Yes, it works.

Thank you for testing this. I merged this patch.

> 
> ~ # v4l2-compliance -f -d /dev/video0
> v4l2-compliance 1.23.0-4896, 32 bits, 32-bit time_t, has no MMU
> v4l2-compliance SHA: 7858281c1cd1 2021-11-27 09:43:32
> 
> Compliance test for stm-dma2d device /dev/video0:
> 
> I added some extra changes for v4l-utils to make the configure step
> working on no-mmu platform, just share here , my change just make the
> compiler happy, i guess you have a more correct way here: )

Can you post this as a separate patch to the mailinglist? That makes it
easier to handle.

Note that fork can't be converted to vfork in v4l2-test-controls.cpp, so
instead it needs to know if fork is available and put the test under a
#ifdef HAVE_FORK or something like that.

Regards,

	Hans

> 
> - add --without-argp options for configure.
> 
> diff --git a/configure.ac b/configure.ac
> index 0529898..3e87b5a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -330,14 +330,23 @@ dl_saved_libs=$LIBS
>    AC_SUBST([DLOPEN_LIBS])
>  LIBS=$dl_saved_libs
> 
> -AC_CHECK_HEADER([argp.h],,AC_MSG_ERROR(Cannot continue: argp.h not found))
> +AC_ARG_WITH([argp],
> +           AS_HELP_STRING([--without-argp], [Do not use argp.h]),
> +           [],
> +           [with_argp=yes])
>  argp_saved_libs=$LIBS
> -  AC_SEARCH_LIBS([argp_parse],
> -                 [argp],
> -                 [test "$ac_cv_search_argp_parse" = "none required"
> || ARGP_LIBS=$ac_cv_search_argp_parse],
> -                 [AC_MSG_ERROR([unable to find the argp_parse() function])])
> -  AC_SUBST([ARGP_LIBS])
> +AS_IF([test "x$with_argp" != xno],
> +      [
> +               AC_CHECK_HEADER([argp.h],,AC_MSG_ERROR(Cannot
> continue: argp.h not found))]
> +      AC_SEARCH_LIBS([argp_parse],
> +                    [argp],
> +                    [test "$ac_cv_search_argp_parse" = "none
> required" || ARGP_LIBS=$ac_cv_search_argp_parse],
> +                    [AC_MSG_ERROR([unable to find the argp_parse() function])])
> +      AC_SUBST([ARGP_LIBS])
> +      ],
> +      )
>  LIBS=$argp_saved_libs
> +AM_CONDITIONAL([HAVE_ARGP], [test "x$with_argp" != xno])
> 
>  AC_CHECK_FUNCS([fork],
> AC_DEFINE([HAVE_LIBV4LCONVERT_HELPERS],[1],[whether to use
> libv4lconvert helpers]))
>  AM_CONDITIONAL([HAVE_LIBV4LCONVERT_HELPERS], [test x$ac_cv_func_fork = xyes])
> @@ -561,7 +570,7 @@ AM_CONDITIONAL([WITH_GCONV],        [test
> x$enable_gconv = xyes -a x$enable_shar
>  AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test
> x${enable_v4l2_ctl_libv4l} != xno])
>  AM_CONDITIONAL([WITH_V4L2_CTL_STREAM_TO], [test
> x${enable_v4l2_ctl_stream_to} != xno])
>  AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
> -AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
> +AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xno])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork
> = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork =
> xyes -a x${enable_v4l2_compliance_32} = xyes])
>  PKG_CHECK_MODULES([LIBBPF], [libbpf], [bpf_pc=yes], [bpf_pc=no])
> diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
> index 5771ee4..8197e6d 100644
> --- a/contrib/test/Makefile.am
> +++ b/contrib/test/Makefile.am
> @@ -2,9 +2,7 @@ noinst_PROGRAMS = \
>         ioctl-test              \
>         sliced-vbi-test         \
>         sliced-vbi-detect       \
> -       v4l2grab                \
>         driver-test             \
> -       mc_nextgen_test         \
>         stress-buffer           \
>         capture-example
> 
> @@ -13,8 +11,15 @@ noinst_PROGRAMS += pixfmt-test
>  endif
> 
>  if HAVE_GLU
> +if HAVE_ARGP
>  noinst_PROGRAMS += v4l2gl
>  endif
> +endif
> +
> +if HAVE_ARGP
> +noinst_PROGRAMS += mc_nextgen_test.c \
> +                  v4l2grab
> +endif
> 
> - change fork to vfork
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp
> b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index 8731c9e..68b2c92 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -978,7 +978,7 @@ int testVividDisconnect(struct node *node)
>         // This can only be tested with the vivid driver that enabled
>         // the DISCONNECT control.
> 
> -       pid_t pid = fork();
> +       pid_t pid = vfork();
>         if (pid == 0) {
>                 struct timeval tv = { 5, 0 };
>                 fd_set fds;
> @@ -1010,7 +1010,7 @@ int testVividDisconnect(struct node *node)
> 
>         node->reopen();
> 
> -       pid = fork();
> +       pid = vfork();
>         if (pid == 0) {
>                 struct epoll_event ep_ev;
>                 int epollfd = epoll_create1(0);
> 
> Best Regards
> Dillon
> 
>>
>> Regards,
>>
>>         Hans
>>
>>>>         if (strlen(STRING(GIT_SHA)))
>>>>                 printf("v4l2-compliance SHA: %s %s\n",
>>>>                        STRING(GIT_SHA), STRING(GIT_COMMIT_DATE));

