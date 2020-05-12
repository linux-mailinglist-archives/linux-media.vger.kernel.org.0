Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9308B1CECC8
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 08:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgELGBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 02:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726247AbgELGBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 02:01:02 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D93C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 23:01:02 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id i13so17280132oie.9
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 23:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BbWFim8Da5LaFRXkm0VZBmKyCnmK55nMxPnnQsMPszg=;
        b=VZydUcaM413RIEdBWBuLtwciEK/fE7mFTx7TgtTk9yj1fkP5T+7FKb1D7aEtJQeSlm
         jPdXbIx4l6AHS4Q4DB+DoRJ9liIY7IMaS40edJvgbVeeTISmXgGBERaAdnf+vD9J7lof
         f1Wo3KUmA0cbMVUVmx+H5NLSAb0oNatTh0g+rk+7j18iFzT1P/vqUyZWlRsa8jj3fLLm
         8sYz4dcJM3VBQfuAJMqVnn0vAFFd0+QDPTMPihO6rRS+7ruTt2YcWe6gOvi0xWB3/p+b
         46wDj1/UUwID926Y8hMSgbMZUYSpaUTC/snErd2mLNTDmmLuHzygYoHdfImX31N1mnbM
         b3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BbWFim8Da5LaFRXkm0VZBmKyCnmK55nMxPnnQsMPszg=;
        b=KTzXIcHFUpDO0MLm169vPabkssb+c8ydSsr06OewccJrpQSBtiXCBQAZIDsXulaZAX
         CBx2K3ZDSbZmbdnIM+4muW1wZAiwxBfdQLPnrUEvTCimmdUBLJSkpdTaZujJ2OD5+9pZ
         tEQOM6YyxMbQmixR6VC5fuXoemoJS5AvCdBboI8hhmIXbUS1uxeR8jqBEqpYDfMVAKwB
         SUxs6fVstdJLuQEIPIAHKZnhc1SCIX7hnAJgyNkP42z5Mf2VSsFLUn9saASoHA2C0waU
         99wOBSi3qkGuvRZUoNr/+D+8v49aggU/bG/9k8TV2AdM97L6HL1abQRVBYmobTC6hfgW
         bh/A==
X-Gm-Message-State: AGi0PuaswMTw/Y5K8/A4cZBRUucnyZ1XsvBAoPxjpjWCqS2CfjL+OJBa
        ti+sarLNU35DTfNiPIcYQ9S853jrrJhb3cRMBsYdLbsf
X-Google-Smtp-Source: APiQypJuYxP9t0tizTxzk0UN3dW08+dbE7AvJ0dua/k0+ZmqAylcxmqIRHSoqpf8et5+GyQRXtRzdDrgvGFt6Il/ywE=
X-Received: by 2002:aca:1106:: with SMTP id 6mr9588962oir.20.1589263261270;
 Mon, 11 May 2020 23:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200511012549.1145814-1-rosenp@gmail.com> <20200511012549.1145814-2-rosenp@gmail.com>
 <1b714b14-6d56-f697-7ef1-2b3411ee653d@xs4all.nl>
In-Reply-To: <1b714b14-6d56-f697-7ef1-2b3411ee653d@xs4all.nl>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Mon, 11 May 2020 23:00:50 -0700
Message-ID: <CAKxU2N-pYLztefOy5xe4-ZgmLV9sBYpup32eNW4gqEh8J4Mcxg@mail.gmail.com>
Subject: Re: [PATCH 2/3] utils: switch strstr to std variant
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 11, 2020 at 12:23 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/05/2020 03:25, Rosen Penev wrote:
> > strstr has const overloads in std, avoiding pointless conversions.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> This introduces a compile error:
>
> v4l2-ctl-misc.cpp: In function =E2=80=98void misc_cmd(int, char*)=E2=80=
=99:
> v4l2-ctl-misc.cpp:215:14: error: =E2=80=98strstr=E2=80=99 is not a member=
 of =E2=80=98std=E2=80=99; did you mean =E2=80=98strstr=E2=80=99?
>   215 |     if (std::strstr(value, "dht"))
>       |              ^~~~~~
> In file included from v4l2-ctl-misc.cpp:4:
> /usr/include/string.h:323:1: note: =E2=80=98strstr=E2=80=99 declared here
>   323 | strstr (const char *__haystack, const char *__needle) __THROW
>       | ^~~~~~
> v4l2-ctl-misc.cpp:217:14: error: =E2=80=98strstr=E2=80=99 is not a member=
 of =E2=80=98std=E2=80=99; did you mean =E2=80=98strstr=E2=80=99?
>   217 |     if (std::strstr(value, "dqt"))
>       |              ^~~~~~
> In file included from v4l2-ctl-misc.cpp:4:
> /usr/include/string.h:323:1: note: =E2=80=98strstr=E2=80=99 declared here
>   323 | strstr (const char *__haystack, const char *__needle) __THROW
>       | ^~~~~~
> v4l2-ctl-misc.cpp:219:14: error: =E2=80=98strstr=E2=80=99 is not a member=
 of =E2=80=98std=E2=80=99; did you mean =E2=80=98strstr=E2=80=99?
>   219 |     if (std::strstr(value, "dri"))
>       |              ^~~~~~
> In file included from v4l2-ctl-misc.cpp:4:
> /usr/include/string.h:323:1: note: =E2=80=98strstr=E2=80=99 declared here
>   323 | strstr (const char *__haystack, const char *__needle) __THROW
>       | ^~~~~~
>
> Probably a missing header.
Fixed by my other patch of course :).
>
> Regards,
>
>         Hans
>
> > ---
> >  utils/libcecutil/cec-log.cpp       | 2 +-
> >  utils/v4l2-ctl/v4l2-ctl-common.cpp | 4 ++--
> >  utils/v4l2-ctl/v4l2-ctl-misc.cpp   | 6 +++---
> >  utils/v4l2-dbg/v4l2-dbg.cpp        | 4 ++--
> >  4 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cp=
p
> > index 9410c071..0dcb4675 100644
> > --- a/utils/libcecutil/cec-log.cpp
> > +++ b/utils/libcecutil/cec-log.cpp
> > @@ -62,7 +62,7 @@ static void log_arg(const struct cec_arg *arg, const =
char *arg_name, __u32 val)
> >               }
> >               return;
> >       case CEC_ARG_TYPE_U16:
> > -             if (strstr(arg_name, "phys-addr"))
> > +             if (std::strstr(arg_name, "phys-addr"))
> >                       printf("\t%s: %x.%x.%x.%x\n", arg_name, cec_phys_=
addr_exp(val));
> >               else
> >                       printf("\t%s: %u (0x%04x)\n", arg_name, val, val)=
;
> > diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-c=
tl-common.cpp
> > index 47f5da1a..0640a521 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> > +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> > @@ -1190,13 +1190,13 @@ void common_get(cv4l_fd &_fd)
> >                               char *q;
> >
> >                               buf[len] =3D 0;
> > -                             while ((q =3D strstr(p, "START STATUS")))=
 {
> > +                             while ((q =3D std::strstr(p, "START STATU=
S"))) {
> >                                       p =3D q + 1;
> >                               }
> >                               if (p) {
> >                                       while (p > buf && *p !=3D '<') p-=
-;
> >                                       q =3D p;
> > -                                     while ((q =3D strstr(q, "<6>"))) =
{
> > +                                     while ((q =3D std::strstr(q, "<6>=
"))) {
> >                                               memcpy(q, "   ", 3);
> >                                       }
> >                                       printf("%s", p);
> > diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl=
-misc.cpp
> > index 6db87568..deb481b4 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> > +++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> > @@ -212,11 +212,11 @@ void misc_cmd(int ch, char *optarg)
> >                               jpegcomp.quality =3D strtol(value, 0L, 0)=
;
> >                               break;
> >                       case 17:
> > -                             if (strstr(value, "dht"))
> > +                             if (std::strstr(value, "dht"))
> >                                       jpegcomp.jpeg_markers |=3D V4L2_J=
PEG_MARKER_DHT;
> > -                             if (strstr(value, "dqt"))
> > +                             if (std::strstr(value, "dqt"))
> >                                       jpegcomp.jpeg_markers |=3D V4L2_J=
PEG_MARKER_DQT;
> > -                             if (strstr(value, "dri"))
> > +                             if (std::strstr(value, "dri"))
> >                                       jpegcomp.jpeg_markers |=3D V4L2_J=
PEG_MARKER_DRI;
> >                               break;
> >                       case 18:
> > diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> > index 86266376..06301ae0 100644
> > --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> > +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> > @@ -784,14 +784,14 @@ list_done:
> >                               char *q;
> >
> >                               buf[len] =3D 0;
> > -                             while ((q =3D strstr(p, "START STATUS")))=
 {
> > +                             while ((q =3D std::strstr(p, "START STATU=
S"))) {
> >                                       found_status =3D true;
> >                                       p =3D q + 1;
> >                               }
> >                               if (found_status) {
> >                                       while (p > buf && *p !=3D '<') p-=
-;
> >                                       q =3D p;
> > -                                     while ((q =3D strstr(q, "<6>"))) =
{
> > +                                     while ((q =3D std::strstr(q, "<6>=
"))) {
> >                                               memcpy(q, "   ", 3);
> >                                       }
> >                                       printf("%s", p);
> >
>
