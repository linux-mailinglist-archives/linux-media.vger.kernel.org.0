Return-Path: <linux-media+bounces-14426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E4991D3C4
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 22:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C3012815AB
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 20:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09696152534;
	Sun, 30 Jun 2024 20:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr/5BuuS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5624200C1
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719778575; cv=none; b=f5wWUTvAX41nhwUtDQvrdTYAJmPEnpqXFuOME6Re43a/op3CeAfvPjFWOcIHbteooG2/oWHAf7us4YE2MaDxueUb5rC3lO/E1Vb6SGXOgBtADEcHqkip6b8PTGqx4SgZPBe6MvAeAFPzm3i1WTt1yr7Ur9gnZXwUw/LiwC6CmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719778575; c=relaxed/simple;
	bh=4CNI8z9UkAPURhsjkKHEZzXneJc5suZXLCBJzD+uAhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5q7l8Cd7d/1+bs69ONk6PZA9TSJkQVwrsX90OJ+eu6dhL7+vY+ihdAYngSP4iGpeiMeU2tRqXxbHuO19ibfzIXicp5TVu5/RDPA1H7ZsHX8i+4f5wCeEAVo5PAi4jQqx/IXwFQtkNarNkXuKt4sR2Zv2wwlUPiHi0ZH6v8mwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr/5BuuS; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64ac6015996so20570827b3.1
        for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 13:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719778572; x=1720383372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLQP5EXZqLmJ0gvnQY0YA65LCd2MNp/JVqo8rmmvwWw=;
        b=Qr/5BuuSpfCoJzSxdJYzhnTM85QMO2VuiBwAMthIb8xCJeAD0Sc40WksGUPURi7MMx
         GOTYlgP9xsI4eMMHmp6c8WHtQykMGl9ibBePU7oUmEsc4uqkeSeOb/4eDqRNkNIaA1SW
         N+e/6hWA97g8Wde7AIGf74Z5ZHvW/tgdWtt8OWjE/sGOg/gAt1OflHATcHzzM34rpfcZ
         Za3ptkTnigVRX85Q5zzIHJGfQ135RV5IGevDSj3GhakgEXLWDks2LIOgNIQ/C6q7Ezzm
         F7eOzK/OAoWWM4NA8a4JCZoRp0ZhssGbO1efzi36Kug805IXF00pY7gL2p1h4V5Dqawv
         Z+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778572; x=1720383372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLQP5EXZqLmJ0gvnQY0YA65LCd2MNp/JVqo8rmmvwWw=;
        b=WuQB7HA7CqfS22Gj5Rl4VfnDCtVbxo1NN0WjzRQIvwtY3o3dx3xFZYMLWyFQbOSpJw
         Eprjam8/MRArB7mddFOsHoBhwO/tXapvGHeYTMe1xjoTLroTgfgt9zBqLnxGn7AEDEIE
         HLkiQHDJzogM24gFYQgp2IFRuvei+iLSNjJz5xZkZ/EFGXHZ0LL94lPTZmon4x3Mr6zL
         E4DwCy8+y9qhYboIJvSSgNUHPslb1OBUbumKRDTdZm81+dmqbKG8EN0MDU9arOr2Krmk
         Y0sci2J/9QN5KYyJSFvdo41cYCCePULsruAzz0zkIGgY5l+nApY31uw7+2Rc37h5vUK+
         eAUw==
X-Gm-Message-State: AOJu0YzdHK3v+9GP6NIdZBx5QOq34M4EM37a9VCpMr5yQtluzMz6mBEt
	HsfyOPQsG8QW3zc238aov24eV5NSVE1oXqDETfhIz126k+zOfm28fESaHeM5Z+rxm9VLMMo/Vvu
	nHxQ4mj6KfzdURCGbt+MoWRk4TKYEMwIi
X-Google-Smtp-Source: AGHT+IHL81t9oW/RmPDBNSSgHJYVbp/Y0ftY14m354uxFcqZ9s/BXnXkfsGxfAcdGz6iJ8kvR2qHIL+3saov4pge3Ro=
X-Received: by 2002:a05:690c:6912:b0:64b:89cd:7db0 with SMTP id
 00721157ae682-64c720b80fbmr41574067b3.28.1719778572518; Sun, 30 Jun 2024
 13:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610212316.136612-1-rosenp@gmail.com> <20240610212316.136612-2-rosenp@gmail.com>
 <2b52a504-c3b5-47cb-a962-c2bfa9063999@xs4all.nl>
In-Reply-To: <2b52a504-c3b5-47cb-a962-c2bfa9063999@xs4all.nl>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 30 Jun 2024 13:16:01 -0700
Message-ID: <CAKxU2N830Mk=iLKWxjbtok07Qggpv2wpdGk+XxkJyeAPV2cryw@mail.gmail.com>
Subject: Re: [PATCH 2/2] v4l-utils: fix compilation with 64-bit time_t
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 1:50=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> Hi Rosen,
>
> Apologies, I hadn't seen this patch, it was filed in my spam folder for s=
ome reason.
>
> On 10/06/2024 23:23, Rosen Penev wrote:
> > musl since version 1.2.0 uses 64-bit time_t even on 32-bit. Cast to
> > 64-bit for compatibility.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  utils/cec-compliance/cec-compliance.cpp   |  3 ++-
> >  utils/cec-compliance/cec-test-adapter.cpp |  5 +++--
> >  utils/cec-ctl/cec-ctl.cpp                 | 19 ++++++++++---------
> >  utils/cec-follower/cec-follower.cpp       |  3 ++-
> >  utils/cec-follower/cec-processing.cpp     |  3 ++-
> >  utils/keytable/keytable.c                 |  1 +
> >  utils/libv4l2util/v4l2_driver.c           |  7 ++++---
> >  utils/v4l2-tracer/retrace.cpp             |  2 +-
> >  8 files changed, 25 insertions(+), 18 deletions(-)
> >
> > diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compli=
ance/cec-compliance.cpp
> > index 8075e1d6..df633a33 100644
> > --- a/utils/cec-compliance/cec-compliance.cpp
> > +++ b/utils/cec-compliance/cec-compliance.cpp
> > @@ -3,6 +3,7 @@
> >   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All right=
s reserved.
> >   */
> >
> > +#include <cinttypes>
> >  #include <sstream>
> >
> >  #include <fcntl.h>
> > @@ -279,7 +280,7 @@ static std::string ts2s(__u64 ts)
> >       t =3D res.tv_sec;
> >       s =3D ctime(&t);
> >       s =3D s.substr(0, s.length() - 6);
> > -     sprintf(buf, "%03lu", res.tv_usec / 1000);
> > +     sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
>
> This doesn't make sense: why is res.tv_usec cast to a uint64_t?
> Is that field really a 64 bit value under musl? But in any case, tv_usec =
is
> limited to 999999, so if it is a 64 bit value under musl, then just cast =
it
> to unsigned long and leave the %03lu as-is.
That's suseconds_t which is 64-bit. I felt it would be safer to cast
to 64-bit, but OK.
>
> The commit log is certainly insufficient since a lot of the changes in th=
is
> patch have nothing to do with time_t but with tv_n/usec.
include/alltypes.h.in:TYPEDEF _Int64 suseconds_t; : <-- from musl source.
>
> Why use PRIu64? That's not explained in the commit log either. I had to l=
ook
> that up, as I've never seen it used before.
>
> As I understand it, musl doesn't support %llu in some cases? Looking at:
>
> https://github.com/cloudius-systems/musl/blob/master/include/inttypes.h
>
> it appears that PRIu64 can either be lu or llu. lu is used if UINTPTR_MAX=
 =3D=3D UINT64_MAX.
>
> But if that is needed, then I expect to see a single patch converting eve=
ry
> %lld and %llu in v4l-utils to use PRId/u64. Here it is only done for some
> time-related code.
not exactly. kernel types use long long always. musl switches between both.
>
> Please don't mix changing to PRId/u64 with these time changes. If you bel=
ieve
> that is needed, then do that as a final patch for all of v4l-utils. But t=
he
> commit log should be very clear explaining why it is needed.
>
> Regards,
>
>         Hans
>
> >       return s + "." + buf;
> >  }
> >
> > diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-comp=
liance/cec-test-adapter.cpp
> > index 08c856af..7a80d17b 100644
> > --- a/utils/cec-compliance/cec-test-adapter.cpp
> > +++ b/utils/cec-compliance/cec-test-adapter.cpp
> > @@ -4,6 +4,7 @@
> >   */
> >
> >  #include <cerrno>
> > +#include <cinttypes>
> >  #include <ctime>
> >  #include <string>
> >
> > @@ -1276,9 +1277,9 @@ static int testLostMsgs(struct node *node)
> >                       printf("\t\tReceived messages: %d of which %d wer=
e CEC_MSG_CEC_VERSION\n",
> >                              pending_rx_msgs, pending_rx_cec_version_ms=
gs);
> >               if (pending_quick_msgs < pending_msgs)
> > -                     printf("\t\tReceived %d messages immediately, and=
 %d over %ld seconds\n",
> > +                     printf("\t\tReceived %d messages immediately, and=
 %d over %" PRIu64 " seconds\n",
> >                              pending_quick_msgs, pending_msgs - pending=
_quick_msgs,
> > -                            time(nullptr) - start);
> > +                            (uint64_t)time(nullptr) - start);
> >       }
> >       print_sfts(sft[1][1], "SFTs for repeating messages (>=3D 7)");
> >       print_sfts(sft[1][0], "SFTs for repeating remote messages (>=3D 7=
)");
> > diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> > index 69aeb8cd..a2ffcb2b 100644
> > --- a/utils/cec-ctl/cec-ctl.cpp
> > +++ b/utils/cec-ctl/cec-ctl.cpp
> > @@ -6,6 +6,7 @@
> >  #include <algorithm>
> >  #include <cctype>
> >  #include <cerrno>
> > +#include <cinttypes>
> >  #include <cstring>
> >  #include <ctime>
> >  #include <map>
> > @@ -416,7 +417,7 @@ std::string ts2s(__u64 ts)
> >               strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
> >       }
> >       secs =3D last_secs + t - last_t;
> > -     sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.tv=
_usec);
> > +     sprintf(buf + 14, "%02u:%02u.%06d", secs / 60, secs % 60, (int)re=
s.tv_usec);
> >       return buf;
> >  }
> >
> > @@ -944,10 +945,10 @@ static void monitor(const struct node &node, __u3=
2 monitor_time, const char *sto
> >               }
> >               fprintf(fstore, "# cec-ctl --store-pin\n");
> >               fprintf(fstore, "# version %d\n", CEC_CTL_VERSION);
> > -             fprintf(fstore, "# start_monotonic %lu.%09lu\n",
> > -                     start_monotonic.tv_sec, start_monotonic.tv_nsec);
> > -             fprintf(fstore, "# start_timeofday %lu.%06lu\n",
> > -                     start_timeofday.tv_sec, start_timeofday.tv_usec);
> > +             fprintf(fstore, "# start_monotonic %" PRIu64 ".%09" PRIu6=
4 "\n",
> > +                     (uint64_t)start_monotonic.tv_sec, (uint64_t)start=
_monotonic.tv_nsec);
> > +             fprintf(fstore, "# start_timeofday %" PRIu64 ".%06" PRIu6=
4 "\n",
> > +                     (uint64_t)start_timeofday.tv_sec, (uint64_t)start=
_timeofday.tv_usec);
> >               fprintf(fstore, "# log_addr_mask 0x%04x\n", node.log_addr=
_mask);
> >               fprintf(fstore, "# phys_addr %x.%x.%x.%x\n",
> >                       cec_phys_addr_exp(node.phys_addr));
> > @@ -986,10 +987,10 @@ static void monitor(const struct node &node, __u3=
2 monitor_time, const char *sto
> >                        */
> >                       clock_gettime(CLOCK_MONOTONIC, &start_monotonic);
> >                       gettimeofday(&start_timeofday, nullptr);
> > -                     fprintf(fstore, "# start_monotonic %lu.%09lu\n",
> > -                             start_monotonic.tv_sec, start_monotonic.t=
v_nsec);
> > -                     fprintf(fstore, "# start_timeofday %lu.%06lu\n",
> > -                             start_timeofday.tv_sec, start_timeofday.t=
v_usec);
> > +                     fprintf(fstore, "# start_monotonic %" PRIu64 ".%0=
9" PRIu64 "\n",
> > +                             (uint64_t)start_monotonic.tv_sec, (uint64=
_t)start_monotonic.tv_nsec);
> > +                     fprintf(fstore, "# start_timeofday %" PRIu64 ".%0=
6" PRIu64 "\n",
> > +                             (uint64_t)start_timeofday.tv_sec, (uint64=
_t)start_timeofday.tv_usec);
> >                       fflush(fstore);
> >                       start_minute =3D now;
> >               }
> > diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/c=
ec-follower.cpp
> > index a7481aea..9b29e3c6 100644
> > --- a/utils/cec-follower/cec-follower.cpp
> > +++ b/utils/cec-follower/cec-follower.cpp
> > @@ -3,6 +3,7 @@
> >   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All right=
s reserved.
> >   */
> >
> > +#include <cinttypes>
> >  #include <cstring>
> >  #include <ctime>
> >  #include <sstream>
> > @@ -354,7 +355,7 @@ void print_timers(struct node *node)
> >                       printf("source: %s, ", source.c_str());
> >                       if (t.recording_seq)
> >                               printf("rec-seq: 0x%x, ", t.recording_seq=
);
> > -                     printf("needs: %ld %s\n", t.duration, "MB."); /* =
1MB per second. */
> > +                     printf("needs: %" PRIu64 " %s\n", (uint64_t)t.dur=
ation, "MB."); /* 1MB per second. */
> >               }
> >               printf("Total media space available for recording: ");
> >               if (node->state.media_space_available >=3D 0)
> > diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower=
/cec-processing.cpp
> > index 3b5c3ce5..cc38f143 100644
> > --- a/utils/cec-follower/cec-processing.cpp
> > +++ b/utils/cec-follower/cec-processing.cpp
> > @@ -6,6 +6,7 @@
> >  #include "linux/compiler.h"
> >
> >  #include <cerrno>
> > +#include <cinttypes>
> >  #include <ctime>
> >  #include <string>
> >
> > @@ -74,7 +75,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
> >       t =3D res.tv_sec;
> >       s =3D ctime(&t);
> >       s =3D s.substr(0, s.length() - 6);
> > -     sprintf(buf, "%03lu", res.tv_usec / 1000);
> > +     sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
> >       return s + "." + buf;
> >  }
> >
> > diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> > index a726921a..ba7c7c4d 100644
> > --- a/utils/keytable/keytable.c
> > +++ b/utils/keytable/keytable.c
> > @@ -214,6 +214,7 @@ static enum sysfs_protocols parse_sysfs_protocol(co=
nst char *name, bool all_allo
> >       return SYSFS_INVALID;
> >  }
> >
> > +__attribute__((format(printf, 3, 0)))
> >  static void write_sysfs_protocols(enum sysfs_protocols protocols, FILE=
 *fp, const char *fmt)
> >  {
> >       const struct protocol_map_entry *pme;
> > diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_d=
river.c
> > index 6b6366fa..5cd63fac 100644
> > --- a/utils/libv4l2util/v4l2_driver.c
> > +++ b/utils/libv4l2util/v4l2_driver.c
> > @@ -15,6 +15,7 @@
> >  #include <assert.h>
> >  #include <errno.h>
> >  #include <fcntl.h>
> > +#include <inttypes.h>
> >  #include <stdio.h>
> >  #include <stdlib.h>
> >  #include <string.h>
> > @@ -174,13 +175,13 @@ static void prt_buf_info(char *name,struct v4l2_b=
uffer *p)
> >  {
> >       struct v4l2_timecode *tc=3D&p->timecode;
> >
> > -     printf ("%s: %02ld:%02d:%02d.%08ld index=3D%d, type=3D%s, "
> > +     printf ("%s: %02" PRIu64 ":%02d:%02d.%08" PRIu64 " index=3D%d, ty=
pe=3D%s, "
> >               "bytesused=3D%d, flags=3D0x%08x, "
> >               "field=3D%s, sequence=3D%d, memory=3D%s, offset=3D0x%08x,=
 length=3D%d\n",
> > -             name, (p->timestamp.tv_sec/3600),
> > +             name, (uint64_t)(p->timestamp.tv_sec/3600),
> >               (int)(p->timestamp.tv_sec/60)%60,
> >               (int)(p->timestamp.tv_sec%60),
> > -             p->timestamp.tv_usec,
> > +             (uint64_t)p->timestamp.tv_usec,
> >               p->index,
> >               prt_names(p->type,v4l2_type_names),
> >               p->bytesused,p->flags,
> > diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.=
cpp
> > index 60d64d8b..010936c0 100644
> > --- a/utils/v4l2-tracer/retrace.cpp
> > +++ b/utils/v4l2-tracer/retrace.cpp
> > @@ -72,7 +72,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap=
64)
> >                                  (long) buf_address_retrace_pointer);
> >
> >       if (is_verbose() || (errno !=3D 0)) {
> > -             fprintf(stderr, "fd: %d, offset: %ld, ", fd_retrace, off)=
;
> > +             fprintf(stderr, "fd: %d, offset: %lld, ", fd_retrace, (lo=
ng long)off);
> >               if (is_mmap64)
> >                       perror("mmap64");
> >               else
>

