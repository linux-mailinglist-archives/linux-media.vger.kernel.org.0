Return-Path: <linux-media+bounces-14491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5591EA6C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 23:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E7D1F220E9
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 21:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A487171650;
	Mon,  1 Jul 2024 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cax8fXxY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FD84A5B
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719870059; cv=none; b=OVQhqOnTHPj1tTIiioVf2hlyUKVtKEEP87OqtPrw6fQqeCBtFErDmnZ0SWVRfTrr8pCQS9RIKZEV/n8Mez4iCKlf6o788afOefkiwYDGYxlS4pv0iw6YH503KQm3hAfq0bmmQw728dXhNrQXdMy7NgKgGfMYJnIVuZFO4eTPmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719870059; c=relaxed/simple;
	bh=XdJa/K+xIZADHuCWzJTLG96L4qbc+HU5sSKw3ySg6Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arbNOzDUS/7mMaYECGtavZrL4uuyLSgM6cMQs8HRtXYPD5hYgxKzMmJMafsh1Dw0giCBsCo5XXUcqkCMuKRbBDccG7VNq42mAc29EBfEfg6r5BVl7LTv7I9j7ke3OxWtLVJqWlCXrPZzMq+fgwbwf+3mcA0wKx9Z4PhXGcPJI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cax8fXxY; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6325b04c275so35498397b3.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719870056; x=1720474856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZvdjinP737B593qAXnE3mofXgQHes6tB4mvsw2FhcE=;
        b=cax8fXxYWj6O0JLhmzSAKNoWalSog+tULQ4i4JOCTGzuu/pXIWhInfZoM3+4mNy4GH
         R7xJ5RNnpA6NqyxWbJZIuVpe62yt7uwmE0TdOG0Ge0g0puOqN8YgO4G26HwTAGk5B6ew
         icmXE0AKvIL90FTuMrJVREQf6Y7jpAq9Y8sNJ4CEFjbmY2ZE4w/pAwiOwd2exEOIEhdC
         DgGC45neb/IafRQdxo37hZgsDKYSDBS3Ts/5HsUF7aUmATen9j5UakM7UddFydmTdx1E
         6n7SL4VDBCwqH4rrRWvszn4q0LgUS3ID+YDvAfmRM2isPHjruOZ4yWuu0/BvAvnGYKEj
         lM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719870056; x=1720474856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZvdjinP737B593qAXnE3mofXgQHes6tB4mvsw2FhcE=;
        b=l7hWrg2hekexxA4D0GGqqgj4S9b5R1UNShE/GrJHJWU47tdXYlO4Q7zKqSecigFfSd
         g3E2Q3/5Ds7c996kc2IgJhqcGO/BCAAM5bDjawuaL4YtRy9sxFTppW+U473zQr9GNdbw
         3KYbCpKutiflUj1EhjXmbLXuXasFFsH/yb8ep6v6pPlC7zxLHKQGSj3RDOmkQQ5zuret
         ip+070dgRx+9XnxjMcgArYjkA8c51Y/RzVWCxz2rQ9DoDBqObP6ALwQ29KyxsEijoFPA
         bB6LTqnh8OrnR0+rmVNrm5l49NjdEMIcRMTk0p8HJcm6q6P61qYFFJBKeB36hkWUeKuB
         J+eA==
X-Gm-Message-State: AOJu0Yw9LU3XYrFdCOHW91k1q93vidND1w/rtsU01IK3pCl7sx+ZSb5e
	zYlYrbSNiahwMsPy6CwPQYqEBH+sFncyrkpMe29osDrrVhrQjixmv+EYgowlelLO7/KX/83kml5
	q7gTO4I4uPI8ro3Jd94K6+Jih1v9YTQ==
X-Google-Smtp-Source: AGHT+IEVeqoQ+0q64bhUeOr0835IbnW+NWajaUYiDTpkTa5LCpYLn1RCxtfLNLe5BGnm/eB79kXZiUmQq7fOEtazikk=
X-Received: by 2002:a81:ae22:0:b0:644:548a:758e with SMTP id
 00721157ae682-64c72d45a7amr66015067b3.44.1719870056059; Mon, 01 Jul 2024
 14:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610212316.136612-1-rosenp@gmail.com> <20240610212316.136612-2-rosenp@gmail.com>
 <2b52a504-c3b5-47cb-a962-c2bfa9063999@xs4all.nl> <CAKxU2N830Mk=iLKWxjbtok07Qggpv2wpdGk+XxkJyeAPV2cryw@mail.gmail.com>
 <8ce4cb7b-d8c5-4825-80c4-4532af9bcc2a@xs4all.nl>
In-Reply-To: <8ce4cb7b-d8c5-4825-80c4-4532af9bcc2a@xs4all.nl>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 1 Jul 2024 14:40:45 -0700
Message-ID: <CAKxU2N-tQ0QqwZN1TaO7v5g2DCv_btBi8fsGpSDu6ECmMzp9Ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] v4l-utils: fix compilation with 64-bit time_t
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 12:07=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 30/06/2024 22:16, Rosen Penev wrote:
> > On Sun, Jun 30, 2024 at 1:50=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.n=
l> wrote:
> >>
> >> Hi Rosen,
> >>
> >> Apologies, I hadn't seen this patch, it was filed in my spam folder fo=
r some reason.
> >>
> >> On 10/06/2024 23:23, Rosen Penev wrote:
> >>> musl since version 1.2.0 uses 64-bit time_t even on 32-bit. Cast to
> >>> 64-bit for compatibility.
> >>>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>>  utils/cec-compliance/cec-compliance.cpp   |  3 ++-
> >>>  utils/cec-compliance/cec-test-adapter.cpp |  5 +++--
> >>>  utils/cec-ctl/cec-ctl.cpp                 | 19 ++++++++++---------
> >>>  utils/cec-follower/cec-follower.cpp       |  3 ++-
> >>>  utils/cec-follower/cec-processing.cpp     |  3 ++-
> >>>  utils/keytable/keytable.c                 |  1 +
> >>>  utils/libv4l2util/v4l2_driver.c           |  7 ++++---
> >>>  utils/v4l2-tracer/retrace.cpp             |  2 +-
> >>>  8 files changed, 25 insertions(+), 18 deletions(-)
> >>>
> >>> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-comp=
liance/cec-compliance.cpp
> >>> index 8075e1d6..df633a33 100644
> >>> --- a/utils/cec-compliance/cec-compliance.cpp
> >>> +++ b/utils/cec-compliance/cec-compliance.cpp
> >>> @@ -3,6 +3,7 @@
> >>>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rig=
hts reserved.
> >>>   */
> >>>
> >>> +#include <cinttypes>
> >>>  #include <sstream>
> >>>
> >>>  #include <fcntl.h>
> >>> @@ -279,7 +280,7 @@ static std::string ts2s(__u64 ts)
> >>>       t =3D res.tv_sec;
> >>>       s =3D ctime(&t);
> >>>       s =3D s.substr(0, s.length() - 6);
> >>> -     sprintf(buf, "%03lu", res.tv_usec / 1000);
> >>> +     sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
> >>
> >> This doesn't make sense: why is res.tv_usec cast to a uint64_t?
> >> Is that field really a 64 bit value under musl? But in any case, tv_us=
ec is
> >> limited to 999999, so if it is a 64 bit value under musl, then just ca=
st it
> >> to unsigned long and leave the %03lu as-is.
> > That's suseconds_t which is 64-bit. I felt it would be safer to cast
> > to 64-bit, but OK.
> >>
> >> The commit log is certainly insufficient since a lot of the changes in=
 this
> >> patch have nothing to do with time_t but with tv_n/usec.
> > include/alltypes.h.in:TYPEDEF _Int64 suseconds_t; : <-- from musl sourc=
e.
> >>
> >> Why use PRIu64? That's not explained in the commit log either. I had t=
o look
> >> that up, as I've never seen it used before.
> >>
> >> As I understand it, musl doesn't support %llu in some cases? Looking a=
t:
> >>
> >> https://github.com/cloudius-systems/musl/blob/master/include/inttypes.=
h
> >>
> >> it appears that PRIu64 can either be lu or llu. lu is used if UINTPTR_=
MAX =3D=3D UINT64_MAX.
> >>
> >> But if that is needed, then I expect to see a single patch converting =
every
> >> %lld and %llu in v4l-utils to use PRId/u64. Here it is only done for s=
ome
> >> time-related code.
> > not exactly. kernel types use long long always. musl switches between b=
oth.
>
> Sorry, I don't follow. Do you mean that a __u64 will always be 64 bit and=
 can
> be formatted as %llu in musl? But types like suseconds_t can be either lo=
ng or
> long long?
__u64 is always long long, yes.
>
> Or do you mean something else?
>
> I would really prefer to avoid the use of PRIu64, and if casts to (__u64)=
 would
> do that trick, than that sounds like an acceptable solution.
Cleaner. Will rework.
>
> Regards,
>
>         Hans
>
> >>
> >> Please don't mix changing to PRId/u64 with these time changes. If you =
believe
> >> that is needed, then do that as a final patch for all of v4l-utils. Bu=
t the
> >> commit log should be very clear explaining why it is needed.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>       return s + "." + buf;
> >>>  }
> >>>
> >>> diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-co=
mpliance/cec-test-adapter.cpp
> >>> index 08c856af..7a80d17b 100644
> >>> --- a/utils/cec-compliance/cec-test-adapter.cpp
> >>> +++ b/utils/cec-compliance/cec-test-adapter.cpp
> >>> @@ -4,6 +4,7 @@
> >>>   */
> >>>
> >>>  #include <cerrno>
> >>> +#include <cinttypes>
> >>>  #include <ctime>
> >>>  #include <string>
> >>>
> >>> @@ -1276,9 +1277,9 @@ static int testLostMsgs(struct node *node)
> >>>                       printf("\t\tReceived messages: %d of which %d w=
ere CEC_MSG_CEC_VERSION\n",
> >>>                              pending_rx_msgs, pending_rx_cec_version_=
msgs);
> >>>               if (pending_quick_msgs < pending_msgs)
> >>> -                     printf("\t\tReceived %d messages immediately, a=
nd %d over %ld seconds\n",
> >>> +                     printf("\t\tReceived %d messages immediately, a=
nd %d over %" PRIu64 " seconds\n",
> >>>                              pending_quick_msgs, pending_msgs - pendi=
ng_quick_msgs,
> >>> -                            time(nullptr) - start);
> >>> +                            (uint64_t)time(nullptr) - start);
> >>>       }
> >>>       print_sfts(sft[1][1], "SFTs for repeating messages (>=3D 7)");
> >>>       print_sfts(sft[1][0], "SFTs for repeating remote messages (>=3D=
 7)");
> >>> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> >>> index 69aeb8cd..a2ffcb2b 100644
> >>> --- a/utils/cec-ctl/cec-ctl.cpp
> >>> +++ b/utils/cec-ctl/cec-ctl.cpp
> >>> @@ -6,6 +6,7 @@
> >>>  #include <algorithm>
> >>>  #include <cctype>
> >>>  #include <cerrno>
> >>> +#include <cinttypes>
> >>>  #include <cstring>
> >>>  #include <ctime>
> >>>  #include <map>
> >>> @@ -416,7 +417,7 @@ std::string ts2s(__u64 ts)
> >>>               strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
> >>>       }
> >>>       secs =3D last_secs + t - last_t;
> >>> -     sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.=
tv_usec);
> >>> +     sprintf(buf + 14, "%02u:%02u.%06d", secs / 60, secs % 60, (int)=
res.tv_usec);
> >>>       return buf;
> >>>  }
> >>>
> >>> @@ -944,10 +945,10 @@ static void monitor(const struct node &node, __=
u32 monitor_time, const char *sto
> >>>               }
> >>>               fprintf(fstore, "# cec-ctl --store-pin\n");
> >>>               fprintf(fstore, "# version %d\n", CEC_CTL_VERSION);
> >>> -             fprintf(fstore, "# start_monotonic %lu.%09lu\n",
> >>> -                     start_monotonic.tv_sec, start_monotonic.tv_nsec=
);
> >>> -             fprintf(fstore, "# start_timeofday %lu.%06lu\n",
> >>> -                     start_timeofday.tv_sec, start_timeofday.tv_usec=
);
> >>> +             fprintf(fstore, "# start_monotonic %" PRIu64 ".%09" PRI=
u64 "\n",
> >>> +                     (uint64_t)start_monotonic.tv_sec, (uint64_t)sta=
rt_monotonic.tv_nsec);
> >>> +             fprintf(fstore, "# start_timeofday %" PRIu64 ".%06" PRI=
u64 "\n",
> >>> +                     (uint64_t)start_timeofday.tv_sec, (uint64_t)sta=
rt_timeofday.tv_usec);
> >>>               fprintf(fstore, "# log_addr_mask 0x%04x\n", node.log_ad=
dr_mask);
> >>>               fprintf(fstore, "# phys_addr %x.%x.%x.%x\n",
> >>>                       cec_phys_addr_exp(node.phys_addr));
> >>> @@ -986,10 +987,10 @@ static void monitor(const struct node &node, __=
u32 monitor_time, const char *sto
> >>>                        */
> >>>                       clock_gettime(CLOCK_MONOTONIC, &start_monotonic=
);
> >>>                       gettimeofday(&start_timeofday, nullptr);
> >>> -                     fprintf(fstore, "# start_monotonic %lu.%09lu\n"=
,
> >>> -                             start_monotonic.tv_sec, start_monotonic=
.tv_nsec);
> >>> -                     fprintf(fstore, "# start_timeofday %lu.%06lu\n"=
,
> >>> -                             start_timeofday.tv_sec, start_timeofday=
.tv_usec);
> >>> +                     fprintf(fstore, "# start_monotonic %" PRIu64 ".=
%09" PRIu64 "\n",
> >>> +                             (uint64_t)start_monotonic.tv_sec, (uint=
64_t)start_monotonic.tv_nsec);
> >>> +                     fprintf(fstore, "# start_timeofday %" PRIu64 ".=
%06" PRIu64 "\n",
> >>> +                             (uint64_t)start_timeofday.tv_sec, (uint=
64_t)start_timeofday.tv_usec);
> >>>                       fflush(fstore);
> >>>                       start_minute =3D now;
> >>>               }
> >>> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower=
/cec-follower.cpp
> >>> index a7481aea..9b29e3c6 100644
> >>> --- a/utils/cec-follower/cec-follower.cpp
> >>> +++ b/utils/cec-follower/cec-follower.cpp
> >>> @@ -3,6 +3,7 @@
> >>>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rig=
hts reserved.
> >>>   */
> >>>
> >>> +#include <cinttypes>
> >>>  #include <cstring>
> >>>  #include <ctime>
> >>>  #include <sstream>
> >>> @@ -354,7 +355,7 @@ void print_timers(struct node *node)
> >>>                       printf("source: %s, ", source.c_str());
> >>>                       if (t.recording_seq)
> >>>                               printf("rec-seq: 0x%x, ", t.recording_s=
eq);
> >>> -                     printf("needs: %ld %s\n", t.duration, "MB."); /=
* 1MB per second. */
> >>> +                     printf("needs: %" PRIu64 " %s\n", (uint64_t)t.d=
uration, "MB."); /* 1MB per second. */
> >>>               }
> >>>               printf("Total media space available for recording: ");
> >>>               if (node->state.media_space_available >=3D 0)
> >>> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follow=
er/cec-processing.cpp
> >>> index 3b5c3ce5..cc38f143 100644
> >>> --- a/utils/cec-follower/cec-processing.cpp
> >>> +++ b/utils/cec-follower/cec-processing.cpp
> >>> @@ -6,6 +6,7 @@
> >>>  #include "linux/compiler.h"
> >>>
> >>>  #include <cerrno>
> >>> +#include <cinttypes>
> >>>  #include <ctime>
> >>>  #include <string>
> >>>
> >>> @@ -74,7 +75,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
> >>>       t =3D res.tv_sec;
> >>>       s =3D ctime(&t);
> >>>       s =3D s.substr(0, s.length() - 6);
> >>> -     sprintf(buf, "%03lu", res.tv_usec / 1000);
> >>> +     sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
> >>>       return s + "." + buf;
> >>>  }
> >>>
> >>> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> >>> index a726921a..ba7c7c4d 100644
> >>> --- a/utils/keytable/keytable.c
> >>> +++ b/utils/keytable/keytable.c
> >>> @@ -214,6 +214,7 @@ static enum sysfs_protocols parse_sysfs_protocol(=
const char *name, bool all_allo
> >>>       return SYSFS_INVALID;
> >>>  }
> >>>
> >>> +__attribute__((format(printf, 3, 0)))
> >>>  static void write_sysfs_protocols(enum sysfs_protocols protocols, FI=
LE *fp, const char *fmt)
> >>>  {
> >>>       const struct protocol_map_entry *pme;
> >>> diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2=
_driver.c
> >>> index 6b6366fa..5cd63fac 100644
> >>> --- a/utils/libv4l2util/v4l2_driver.c
> >>> +++ b/utils/libv4l2util/v4l2_driver.c
> >>> @@ -15,6 +15,7 @@
> >>>  #include <assert.h>
> >>>  #include <errno.h>
> >>>  #include <fcntl.h>
> >>> +#include <inttypes.h>
> >>>  #include <stdio.h>
> >>>  #include <stdlib.h>
> >>>  #include <string.h>
> >>> @@ -174,13 +175,13 @@ static void prt_buf_info(char *name,struct v4l2=
_buffer *p)
> >>>  {
> >>>       struct v4l2_timecode *tc=3D&p->timecode;
> >>>
> >>> -     printf ("%s: %02ld:%02d:%02d.%08ld index=3D%d, type=3D%s, "
> >>> +     printf ("%s: %02" PRIu64 ":%02d:%02d.%08" PRIu64 " index=3D%d, =
type=3D%s, "
> >>>               "bytesused=3D%d, flags=3D0x%08x, "
> >>>               "field=3D%s, sequence=3D%d, memory=3D%s, offset=3D0x%08=
x, length=3D%d\n",
> >>> -             name, (p->timestamp.tv_sec/3600),
> >>> +             name, (uint64_t)(p->timestamp.tv_sec/3600),
> >>>               (int)(p->timestamp.tv_sec/60)%60,
> >>>               (int)(p->timestamp.tv_sec%60),
> >>> -             p->timestamp.tv_usec,
> >>> +             (uint64_t)p->timestamp.tv_usec,
> >>>               p->index,
> >>>               prt_names(p->type,v4l2_type_names),
> >>>               p->bytesused,p->flags,
> >>> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrac=
e.cpp
> >>> index 60d64d8b..010936c0 100644
> >>> --- a/utils/v4l2-tracer/retrace.cpp
> >>> +++ b/utils/v4l2-tracer/retrace.cpp
> >>> @@ -72,7 +72,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mm=
ap64)
> >>>                                  (long) buf_address_retrace_pointer);
> >>>
> >>>       if (is_verbose() || (errno !=3D 0)) {
> >>> -             fprintf(stderr, "fd: %d, offset: %ld, ", fd_retrace, of=
f);
> >>> +             fprintf(stderr, "fd: %d, offset: %lld, ", fd_retrace, (=
long long)off);
> >>>               if (is_mmap64)
> >>>                       perror("mmap64");
> >>>               else
> >>
>

