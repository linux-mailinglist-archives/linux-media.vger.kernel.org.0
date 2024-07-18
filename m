Return-Path: <linux-media+bounces-15125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 431909351A3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 20:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61C701C21B94
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 18:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E76B144D31;
	Thu, 18 Jul 2024 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUuyJW9m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559522EE5
	for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721327757; cv=none; b=DY8UldlkzKmpb8hHKmtoU6I/The/d2bbn4xrVBdphC9ytoAPSwdnhNKJUDgOl70Sjik17Z4VlzfGIRuLC2e/Dh4ooavBkdyJu0aREcbG/u1742qQGcPmdlu0c6JadaDSyRgogiAHF/z/As/q5AVo673ONnpi3gc0U6bYSULk4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721327757; c=relaxed/simple;
	bh=lq/D3qIEJqLegI/CxX/7LWz4KXCzSPrj4g3VzMpikXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=SmBLqsVCW9PIrpm1V7tHUisyHJYsqcAFyv7s+80XGglt/nVxFCrabx29Fen+tF2mY4wiOnTL7Aq6UeGOzrigYHxaUATZ76J8pFOT6wZo6zQeesKdLfJBSv4Q9Di+MULjDxlNnmIFVABsEbaf+rmUPk1rjv4mSTD1qSV3ynk8gfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUuyJW9m; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6687f2f0986so8849127b3.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721327755; x=1721932555; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gmn1wKAFyZmyoI6z7f7TiczR3qYYOE/7In6M963cQuU=;
        b=SUuyJW9mh6YMdujZL4tDDD2wMlcBeKP+7Kq2yCXEBDQIyU1oKmAZ4mPxTnJyM48kyQ
         Y4tjyVO3z3ZobSgwZzjhB/hQyr+s49j5mvBjvN3quxmq+8fjTMGWYaKwTIfNJ+SOMA/H
         f26GQZ2N8Ai1wzlgSCLqimiKg3UvhY7aZqDU0yTu9a1oUoVamat5ZG8jD/FdmOuCNOwi
         rXQZ2Q7wGzXwoAACJccFwbN5avl9unSbqbn+29Rw43wRm+w67xDkB4h5TjfBOa15siRV
         7udw+xnqsLhuC3l2iz47Si6sfkliR01UpjW1PGmE0g15LeFxt2FPoc6wl52rECGy/gzs
         ITLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721327755; x=1721932555;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gmn1wKAFyZmyoI6z7f7TiczR3qYYOE/7In6M963cQuU=;
        b=sBFaFh/+Xk+f7u4RcJCcs7uaHKiR0GYMWXBodO3YIWuhdphYggP+bK3yTsdDR3L9mk
         w+8Sg5uSNiNnnvrOBymjsvFjJVRSA80tksOuoQmmCKxZMyPNPhpHnkfwou2JP3PFOG2t
         ayB9QB8ee3wCLnTokfJEkhEgP2QeRy3HxpjHnLrmX+vrqysD0pfrpWL3lIoJ38uyVkcK
         q/6qH82650Yk0OTwFq/yxjBgKlAnXZgYlqSORvGRJC7spDrlVWnjEXNogKO2Eming/WZ
         uFLNI7EQyt83avUhg/XayWWmDbWJ3opyfmJppmYK8rFeUKvzG+18JWZ9S20Ssf3qvrqW
         /dGg==
X-Gm-Message-State: AOJu0YxCvOkjFHQPuoDhm06GR0cAGsLyMJSDV62gBweLgI/NBWVDdgOq
	1skfZ4SN7Zi7s+tmrF+idJQKOH2muJTEwRPSozbZSKYiHD3p3DXCzitLVCNJogP+MQB1hsjbUTD
	uUYixlFHPgRIhgkctMSg4ZNJ9CEixHQ==
X-Google-Smtp-Source: AGHT+IGjI/L/wXBYcURiZ1kd9fbi6xEo6jnMvkvZSevfQB+Mk17u8ML/C2FvOFEu1H9+saI0rY3+g2ECDQJ7pOSunVs=
X-Received: by 2002:a05:690c:2885:b0:64b:89cd:7db8 with SMTP id
 00721157ae682-6660360c2f0mr40272447b3.28.1721327754969; Thu, 18 Jul 2024
 11:35:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702193343.5742-1-rosenp@gmail.com> <20240702193343.5742-4-rosenp@gmail.com>
In-Reply-To: <20240702193343.5742-4-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 18 Jul 2024 11:35:44 -0700
Message-ID: <CAKxU2N8pyF+yUHuggPer8j9ZdmZJwfXS3Jj-4A3fdeeDs=kenQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] v4l-utils: use 64-bit formats for time
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 12:33=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> musl since version 1.2.0 uses 64-bit time_t and suseconds_t on all
> platforms, even 32-bit. Cast to avoid warnings and potentially future
> proof for when glibc and others gain support.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
ping
> ---
>  utils/cec-compliance/cec-compliance.cpp   |  2 +-
>  utils/cec-compliance/cec-test-adapter.cpp |  4 ++--
>  utils/cec-ctl/cec-ctl.cpp                 | 18 +++++++++---------
>  utils/cec-follower/cec-processing.cpp     |  2 +-
>  4 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-complian=
ce/cec-compliance.cpp
> index 8075e1d6..bddd57cb 100644
> --- a/utils/cec-compliance/cec-compliance.cpp
> +++ b/utils/cec-compliance/cec-compliance.cpp
> @@ -279,7 +279,7 @@ static std::string ts2s(__u64 ts)
>         t =3D res.tv_sec;
>         s =3D ctime(&t);
>         s =3D s.substr(0, s.length() - 6);
> -       sprintf(buf, "%03lu", res.tv_usec / 1000);
> +       sprintf(buf, "%03llu", (__u64)res.tv_usec / 1000);
>         return s + "." + buf;
>  }
>
> diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compli=
ance/cec-test-adapter.cpp
> index 08c856af..f96baaf3 100644
> --- a/utils/cec-compliance/cec-test-adapter.cpp
> +++ b/utils/cec-compliance/cec-test-adapter.cpp
> @@ -1276,9 +1276,9 @@ static int testLostMsgs(struct node *node)
>                         printf("\t\tReceived messages: %d of which %d wer=
e CEC_MSG_CEC_VERSION\n",
>                                pending_rx_msgs, pending_rx_cec_version_ms=
gs);
>                 if (pending_quick_msgs < pending_msgs)
> -                       printf("\t\tReceived %d messages immediately, and=
 %d over %ld seconds\n",
> +                       printf("\t\tReceived %d messages immediately, and=
 %d over %llu seconds\n",
>                                pending_quick_msgs, pending_msgs - pending=
_quick_msgs,
> -                              time(nullptr) - start);
> +                              (__u64)time(nullptr) - start);
>         }
>         print_sfts(sft[1][1], "SFTs for repeating messages (>=3D 7)");
>         print_sfts(sft[1][0], "SFTs for repeating remote messages (>=3D 7=
)");
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index 8848a49d..f7ba7409 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -414,7 +414,7 @@ std::string ts2s(__u64 ts)
>                 strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
>         }
>         secs =3D last_secs + t - last_t;
> -       sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.tv=
_usec);
> +       sprintf(buf + 14, "%02u:%02u.%06llu", secs / 60, secs % 60, (__u6=
4)res.tv_usec);
>         return buf;
>  }
>
> @@ -942,10 +942,10 @@ static void monitor(const struct node &node, __u32 =
monitor_time, const char *sto
>                 }
>                 fprintf(fstore, "# cec-ctl --store-pin\n");
>                 fprintf(fstore, "# version %d\n", CEC_CTL_VERSION);
> -               fprintf(fstore, "# start_monotonic %lu.%09lu\n",
> -                       start_monotonic.tv_sec, start_monotonic.tv_nsec);
> -               fprintf(fstore, "# start_timeofday %lu.%06lu\n",
> -                       start_timeofday.tv_sec, start_timeofday.tv_usec);
> +               fprintf(fstore, "# start_monotonic %llu.%09llu\n",
> +                       (__u64)start_monotonic.tv_sec, (__u64)start_monot=
onic.tv_nsec);
> +               fprintf(fstore, "# start_timeofday %llu.%06llu\n",
> +                       (__u64)start_timeofday.tv_sec, (__u64)start_timeo=
fday.tv_usec);
>                 fprintf(fstore, "# log_addr_mask 0x%04x\n", node.log_addr=
_mask);
>                 fprintf(fstore, "# phys_addr %x.%x.%x.%x\n",
>                         cec_phys_addr_exp(node.phys_addr));
> @@ -984,10 +984,10 @@ static void monitor(const struct node &node, __u32 =
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
> +                       fprintf(fstore, "# start_monotonic %llu.%09llu\n"=
,
> +                               (__u64)start_monotonic.tv_sec, (__u64)sta=
rt_monotonic.tv_nsec);
> +                       fprintf(fstore, "# start_timeofday %llu.%06llu\n"=
,
> +                               (__u64)start_timeofday.tv_sec, (__u64)sta=
rt_timeofday.tv_usec);
>                         fflush(fstore);
>                         start_minute =3D now;
>                 }
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/c=
ec-processing.cpp
> index 14ee211b..cd20df59 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -72,7 +72,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
>         t =3D res.tv_sec;
>         s =3D ctime(&t);
>         s =3D s.substr(0, s.length() - 6);
> -       sprintf(buf, "%03lu", res.tv_usec / 1000);
> +       sprintf(buf, "%03llu", (__u64)res.tv_usec / 1000);
>         return s + "." + buf;
>  }
>
> --
> 2.45.2
>

