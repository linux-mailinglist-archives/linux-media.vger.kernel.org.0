Return-Path: <linux-media+bounces-14408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C365591CF6D
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 00:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780C91C20BD9
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 22:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FA07E572;
	Sat, 29 Jun 2024 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKTpfG6m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16101DFCB
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 22:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719699766; cv=none; b=YK0ms/P1RkQgWD8/4n/D6lxyTdBDhZ6sQPI6Jb2UnJLmhf0JhgKfttRuMf1FaLKr0WWBypCx8PTPK2wW7Kp+E2bS3GL0QnCHwqiFU/g0Kcl4imDFJpU4hpQSBVpUY0ahdNBuRydfj7TAOlHMI3I+dmbWRlUqNt+Z+4mV+S6xfvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719699766; c=relaxed/simple;
	bh=DZ7iHIOupUS44duQCVgPQVOZv6Gj2KDkbop/xVp0jlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=TnEHbSzswX+RAwW+5MVGTPYY34HAGwOSfwSqABIpXrsTjhMJy6ANIdZaCCYwnXVFOjDkSAW2svcW+Eilt9hhNa46EH2zgvCgh5YimZrH7q0LTlEaPBK9t84ioW/pMfKukAVhbInMY86B9sF5wA2Rntean/nsXJzaraMBKooNB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKTpfG6m; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6439f6cf79dso13199407b3.0
        for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719699763; x=1720304563; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntFIj/IUf3zAEmBAgHEnRPN2jNRWuwvcZ0/HMPMvi3U=;
        b=mKTpfG6m6G5dXVWshNlh+vQF/VieNTW8U69krKJLaAnUTWflMdWTd5ti4lU8czFYr9
         Xf5tOsXDkvMh8Lc6qplBNN34nqQNcMExrmau+hzayoG1olUqM3lj7ELj+ECE/nI72hOq
         20VtAIQoqPHMVfI6/AiT5NkPh9HSFgivkKhnOzU5PQz+8oEqPrAoCzBpCLkqT9ZzPONF
         x+5dL2N6CHGt3phIaouVfmGFOcMvvhvD5XBlKCZ/pRyeLjCO6DEK6UeGuKy7UY9Gn9Cz
         kFMFjO9j4djZYzMNAeFqO1WW0e6V3pQdba7nBzbTgSPOEgr08OII/H/ak5TnQazie6kO
         j9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719699763; x=1720304563;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntFIj/IUf3zAEmBAgHEnRPN2jNRWuwvcZ0/HMPMvi3U=;
        b=EnE4btW4ehmwWN9vT4QmMGaELUmemOfBFGgZ0X0uTkDrrKk1vYc2YAMeCn8aBQqnpS
         tzcepuaAvDohrg4eN8XrViR7X1MksYX/7KcThLBrLpqqaiv0Oc+R0ye/4PbshxFtMSZM
         V1eMWMj6TQ3wYiqsLaSOkE4M005GJroJVjaw/rqFffmgGC4pAj3U6IsEDe0TJqqFwBIS
         uRNDBVm41HLu95fZs94zmnQkRnGN6IFvt0XPHDjQOavbu8TrZayQvxDyUbNMaWIyQ68/
         mGAfN4aTNQCVQg10fhGOYHYXDEQVPbKKY3IzBmt8c5psfR+wFqRsJ9TvdbnY4seRa19S
         c53w==
X-Gm-Message-State: AOJu0YylNEOuKYq91Tfci7IQBN67vDvWcy7LfbPMtAKy+8VMtrYf9EMA
	SEbNh+RTqxWEZbXxdryAh7ZWAQmkTaCgnEFSRqQupp6l/H8cCDednkvXgdFcXMe4kMhQFdkhsZ+
	aU1kF0E1n79RnvG6tTYHfUqnKCdt3iw==
X-Google-Smtp-Source: AGHT+IHm4hqEdb5vNQ5+DMECVMrPwrvIqdhsZVz2ViicAt8sS94dJ1h3JQhcjLOlN8JWLiblLgsBTO97QqEnC32lQmw=
X-Received: by 2002:a81:920e:0:b0:63b:d711:e722 with SMTP id
 00721157ae682-64c7123b127mr20060017b3.1.1719699763396; Sat, 29 Jun 2024
 15:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610212316.136612-1-rosenp@gmail.com> <20240610212316.136612-2-rosenp@gmail.com>
In-Reply-To: <20240610212316.136612-2-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 29 Jun 2024 15:22:32 -0700
Message-ID: <CAKxU2N_HZDGJSYZ1xMpzQDTHEha8+0LWmqvpVfv=qnTDX95hQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] v4l-utils: fix compilation with 64-bit time_t
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping?

On Mon, Jun 10, 2024 at 2:23=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> musl since version 1.2.0 uses 64-bit time_t even on 32-bit. Cast to
> 64-bit for compatibility.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.cpp   |  3 ++-
>  utils/cec-compliance/cec-test-adapter.cpp |  5 +++--
>  utils/cec-ctl/cec-ctl.cpp                 | 19 ++++++++++---------
>  utils/cec-follower/cec-follower.cpp       |  3 ++-
>  utils/cec-follower/cec-processing.cpp     |  3 ++-
>  utils/keytable/keytable.c                 |  1 +
>  utils/libv4l2util/v4l2_driver.c           |  7 ++++---
>  utils/v4l2-tracer/retrace.cpp             |  2 +-
>  8 files changed, 25 insertions(+), 18 deletions(-)
>
> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-complian=
ce/cec-compliance.cpp
> index 8075e1d6..df633a33 100644
> --- a/utils/cec-compliance/cec-compliance.cpp
> +++ b/utils/cec-compliance/cec-compliance.cpp
> @@ -3,6 +3,7 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights =
reserved.
>   */
>
> +#include <cinttypes>
>  #include <sstream>
>
>  #include <fcntl.h>
> @@ -279,7 +280,7 @@ static std::string ts2s(__u64 ts)
>         t =3D res.tv_sec;
>         s =3D ctime(&t);
>         s =3D s.substr(0, s.length() - 6);
> -       sprintf(buf, "%03lu", res.tv_usec / 1000);
> +       sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
>         return s + "." + buf;
>  }
>
> diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compli=
ance/cec-test-adapter.cpp
> index 08c856af..7a80d17b 100644
> --- a/utils/cec-compliance/cec-test-adapter.cpp
> +++ b/utils/cec-compliance/cec-test-adapter.cpp
> @@ -4,6 +4,7 @@
>   */
>
>  #include <cerrno>
> +#include <cinttypes>
>  #include <ctime>
>  #include <string>
>
> @@ -1276,9 +1277,9 @@ static int testLostMsgs(struct node *node)
>                         printf("\t\tReceived messages: %d of which %d wer=
e CEC_MSG_CEC_VERSION\n",
>                                pending_rx_msgs, pending_rx_cec_version_ms=
gs);
>                 if (pending_quick_msgs < pending_msgs)
> -                       printf("\t\tReceived %d messages immediately, and=
 %d over %ld seconds\n",
> +                       printf("\t\tReceived %d messages immediately, and=
 %d over %" PRIu64 " seconds\n",
>                                pending_quick_msgs, pending_msgs - pending=
_quick_msgs,
> -                              time(nullptr) - start);
> +                              (uint64_t)time(nullptr) - start);
>         }
>         print_sfts(sft[1][1], "SFTs for repeating messages (>=3D 7)");
>         print_sfts(sft[1][0], "SFTs for repeating remote messages (>=3D 7=
)");
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index 69aeb8cd..a2ffcb2b 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -6,6 +6,7 @@
>  #include <algorithm>
>  #include <cctype>
>  #include <cerrno>
> +#include <cinttypes>
>  #include <cstring>
>  #include <ctime>
>  #include <map>
> @@ -416,7 +417,7 @@ std::string ts2s(__u64 ts)
>                 strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
>         }
>         secs =3D last_secs + t - last_t;
> -       sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.tv=
_usec);
> +       sprintf(buf + 14, "%02u:%02u.%06d", secs / 60, secs % 60, (int)re=
s.tv_usec);
>         return buf;
>  }
>
> @@ -944,10 +945,10 @@ static void monitor(const struct node &node, __u32 =
monitor_time, const char *sto
>                 }
>                 fprintf(fstore, "# cec-ctl --store-pin\n");
>                 fprintf(fstore, "# version %d\n", CEC_CTL_VERSION);
> -               fprintf(fstore, "# start_monotonic %lu.%09lu\n",
> -                       start_monotonic.tv_sec, start_monotonic.tv_nsec);
> -               fprintf(fstore, "# start_timeofday %lu.%06lu\n",
> -                       start_timeofday.tv_sec, start_timeofday.tv_usec);
> +               fprintf(fstore, "# start_monotonic %" PRIu64 ".%09" PRIu6=
4 "\n",
> +                       (uint64_t)start_monotonic.tv_sec, (uint64_t)start=
_monotonic.tv_nsec);
> +               fprintf(fstore, "# start_timeofday %" PRIu64 ".%06" PRIu6=
4 "\n",
> +                       (uint64_t)start_timeofday.tv_sec, (uint64_t)start=
_timeofday.tv_usec);
>                 fprintf(fstore, "# log_addr_mask 0x%04x\n", node.log_addr=
_mask);
>                 fprintf(fstore, "# phys_addr %x.%x.%x.%x\n",
>                         cec_phys_addr_exp(node.phys_addr));
> @@ -986,10 +987,10 @@ static void monitor(const struct node &node, __u32 =
monitor_time, const char *sto
>                          */
>                         clock_gettime(CLOCK_MONOTONIC, &start_monotonic);
>                         gettimeofday(&start_timeofday, nullptr);
> -                       fprintf(fstore, "# start_monotonic %lu.%09lu\n",
> -                               start_monotonic.tv_sec, start_monotonic.t=
v_nsec);
> -                       fprintf(fstore, "# start_timeofday %lu.%06lu\n",
> -                               start_timeofday.tv_sec, start_timeofday.t=
v_usec);
> +                       fprintf(fstore, "# start_monotonic %" PRIu64 ".%0=
9" PRIu64 "\n",
> +                               (uint64_t)start_monotonic.tv_sec, (uint64=
_t)start_monotonic.tv_nsec);
> +                       fprintf(fstore, "# start_timeofday %" PRIu64 ".%0=
6" PRIu64 "\n",
> +                               (uint64_t)start_timeofday.tv_sec, (uint64=
_t)start_timeofday.tv_usec);
>                         fflush(fstore);
>                         start_minute =3D now;
>                 }
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec=
-follower.cpp
> index a7481aea..9b29e3c6 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -3,6 +3,7 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights =
reserved.
>   */
>
> +#include <cinttypes>
>  #include <cstring>
>  #include <ctime>
>  #include <sstream>
> @@ -354,7 +355,7 @@ void print_timers(struct node *node)
>                         printf("source: %s, ", source.c_str());
>                         if (t.recording_seq)
>                                 printf("rec-seq: 0x%x, ", t.recording_seq=
);
> -                       printf("needs: %ld %s\n", t.duration, "MB."); /* =
1MB per second. */
> +                       printf("needs: %" PRIu64 " %s\n", (uint64_t)t.dur=
ation, "MB."); /* 1MB per second. */
>                 }
>                 printf("Total media space available for recording: ");
>                 if (node->state.media_space_available >=3D 0)
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/c=
ec-processing.cpp
> index 3b5c3ce5..cc38f143 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -6,6 +6,7 @@
>  #include "linux/compiler.h"
>
>  #include <cerrno>
> +#include <cinttypes>
>  #include <ctime>
>  #include <string>
>
> @@ -74,7 +75,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
>         t =3D res.tv_sec;
>         s =3D ctime(&t);
>         s =3D s.substr(0, s.length() - 6);
> -       sprintf(buf, "%03lu", res.tv_usec / 1000);
> +       sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
>         return s + "." + buf;
>  }
>
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index a726921a..ba7c7c4d 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -214,6 +214,7 @@ static enum sysfs_protocols parse_sysfs_protocol(cons=
t char *name, bool all_allo
>         return SYSFS_INVALID;
>  }
>
> +__attribute__((format(printf, 3, 0)))
>  static void write_sysfs_protocols(enum sysfs_protocols protocols, FILE *=
fp, const char *fmt)
>  {
>         const struct protocol_map_entry *pme;
> diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_dri=
ver.c
> index 6b6366fa..5cd63fac 100644
> --- a/utils/libv4l2util/v4l2_driver.c
> +++ b/utils/libv4l2util/v4l2_driver.c
> @@ -15,6 +15,7 @@
>  #include <assert.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <inttypes.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> @@ -174,13 +175,13 @@ static void prt_buf_info(char *name,struct v4l2_buf=
fer *p)
>  {
>         struct v4l2_timecode *tc=3D&p->timecode;
>
> -       printf ("%s: %02ld:%02d:%02d.%08ld index=3D%d, type=3D%s, "
> +       printf ("%s: %02" PRIu64 ":%02d:%02d.%08" PRIu64 " index=3D%d, ty=
pe=3D%s, "
This 100% fixes crashing under 32-bit musl as it prevents the second
half of time_t being interpreted as %s.
>                 "bytesused=3D%d, flags=3D0x%08x, "
>                 "field=3D%s, sequence=3D%d, memory=3D%s, offset=3D0x%08x,=
 length=3D%d\n",
> -               name, (p->timestamp.tv_sec/3600),
> +               name, (uint64_t)(p->timestamp.tv_sec/3600),
>                 (int)(p->timestamp.tv_sec/60)%60,
>                 (int)(p->timestamp.tv_sec%60),
> -               p->timestamp.tv_usec,
> +               (uint64_t)p->timestamp.tv_usec,
>                 p->index,
>                 prt_names(p->type,v4l2_type_names),
>                 p->bytesused,p->flags,
> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cp=
p
> index 60d64d8b..010936c0 100644
> --- a/utils/v4l2-tracer/retrace.cpp
> +++ b/utils/v4l2-tracer/retrace.cpp
> @@ -72,7 +72,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64=
)
>                                    (long) buf_address_retrace_pointer);
>
>         if (is_verbose() || (errno !=3D 0)) {
> -               fprintf(stderr, "fd: %d, offset: %ld, ", fd_retrace, off)=
;
> +               fprintf(stderr, "fd: %d, offset: %lld, ", fd_retrace, (lo=
ng long)off);
>                 if (is_mmap64)
>                         perror("mmap64");
>                 else
> --
> 2.45.2
>

