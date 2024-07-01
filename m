Return-Path: <linux-media+bounces-14492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D2691EA74
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 23:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062FD1C213B9
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 21:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F60171655;
	Mon,  1 Jul 2024 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuD9xd0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3762C1BA
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719870428; cv=none; b=e9PTkJ1DHfKXAsz96OE8NVNm46/4VrOGm6pAZG+zpY2r7gWhEAXPdILM6FJixTUZdNWoTTLlDumf6Df219nUYj2wOywYFrAaG+wtc3Rf6JNYf6kobHocMPGewBHKgiVKYA8Y9p9GvgDR7KsBDJPfy0VTkyz9Q9t3qc/hRrqTgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719870428; c=relaxed/simple;
	bh=ek7AoqEbJEC15m2yVAveQ2676iM5jQdeACjH9/L/zNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsKzCpCAqs6E5PK8vTNTZGVfDGQDvYLZF4mRZgivcgn4AOYUWsj9zMVe1xgXqO0Il40CMcruCz96g7IXeruEu/0SgcX3ZYxscaLsCJ1Z6YdEJ/vy7o7KTRs+6L8mFdM254OvO89F4htVRHvSIj+aRO7W97qBNFRpun5ZZDgJrdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuD9xd0Q; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-64f4b7493a4so8508477b3.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2024 14:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719870426; x=1720475226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ftyKx1+rYnzCA5rbkExO9yWxReplpfZa/jF4MAHoEk=;
        b=DuD9xd0QQ5cZ7ctGMRpT0TBMRzs0pcRnUSim2qCsZg19VBynA69iKfCq+rCNhCHdrk
         88/tGNbwis+uTiWL5WGaGyJik27mOks/2eLHh8UuuKUozs7ywnBuelUP97MKqE68pRO4
         IGkJ1hQxb//m8lHfp5tUEQQI9ywrBX+XJgAxlumLuz8xlAocMJ26gRPwPqJVNpliyukO
         OH3FR0s/CmMscEv7vRcwQ5Vm5J+5EN/Xi4OaU8uDuo6C8EM3OsggYglGwTT+Nw2zoDPI
         f6Y9XOwjoxRZpLXlAarTuFaYgpDJ8wTZYGIE1OAhfETa3lHlzrTvJ3VgEJWx2D65bd2F
         26YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719870426; x=1720475226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ftyKx1+rYnzCA5rbkExO9yWxReplpfZa/jF4MAHoEk=;
        b=Ia7iwkYXFjH8d3ejUIj/s4U7JET94GdiK9VeFR7MHwuOqskcpBiyJ/wfSFrl8JB8SH
         Vb9jlO+eYY54Am97cNtIC2mUlbpuWf6jarPHWy74xNwf9bSUkPlVOm2ncWcq6UEbev6P
         Pkr1A7zgEliRbfCRKME7lmVmwZfM5olT4sVbWpRTH+2o81OK32NmoftJxVs5aOHKtJWI
         BHfitMDLXydcfe6WykGQOfWfE3pFHjq8EXX0y7MQhUmVDojcT3XnA97bpNoi1IceSWo3
         1Q0dUnPh1qrg3zdA/wVmk+sKog1hJLnoQb2LuNshW3sL/ZABVXyWSj2ugIyBv7JrRr9m
         zY9w==
X-Gm-Message-State: AOJu0YznYy2Qk1sN60/R/XbItY6YxpvWbIzxWeCWd6m4+UZyoX8gFi77
	ujIOfYmSVNHRsqQ7d88eqPRhXPluPQ4xToEn7Ub0UbFU28Lqq9sXkoGjbGkbmHuoexmVU6xhuVw
	fy8puw74RarGgJQ4mF/BP6koZ3ehkbw==
X-Google-Smtp-Source: AGHT+IHc6FlhNKz3N2K/nb3c4yLFLL8qex9268zwV1jaUOJeF0K5tI7yf9ZlXBRt9d1S/tdiX6p51tNuhyRJ7h6XwXk=
X-Received: by 2002:a81:ab52:0:b0:648:3fb2:753b with SMTP id
 00721157ae682-64c71cd9556mr65770037b3.24.1719870425491; Mon, 01 Jul 2024
 14:47:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630224440.5912-1-rosenp@gmail.com> <20240630224440.5912-4-rosenp@gmail.com>
 <59d86208-16bb-4f42-a302-81f015776894@xs4all.nl>
In-Reply-To: <59d86208-16bb-4f42-a302-81f015776894@xs4all.nl>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 1 Jul 2024 14:46:54 -0700
Message-ID: <CAKxU2N93wfJEusXQnRKWMK+wKxR8E0CPN=FfnSh=chvzXQeJEA@mail.gmail.com>
Subject: Re: [SPAM] [PATCH 4/4] v4l-utils: fix formats under ppc/mips64
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 2:49=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> On 01/07/2024 00:44, Rosen Penev wrote:
> > Unlike libc, kernel headers use long long for 64-bit types. The
> > exception is ppc64 and mips64, unless __SANE_USERSPACE_TYPES__ is
> > defined.
> >
> > Define in compiler.h and include before kernel headers are included so
> > that wrong __u64 and __s64 definitions to not get used.
> >
> > Fixes -Wformat warnings about llu being used instead of lu.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  contrib/xc3028-firmware/firmware-tool.c | 2 ++
> >  include/linux/compiler.h                | 1 +
> >  utils/cec-compliance/cec-compliance.h   | 2 ++
> >  utils/cec-ctl/cec-ctl.cpp               | 2 ++
> >  utils/cec-ctl/cec-ctl.h                 | 2 ++
> >  utils/cec-ctl/cec-pin.cpp               | 2 ++
> >  utils/cec-follower/cec-processing.cpp   | 2 ++
> >  utils/common/v4l2-info.h                | 2 ++
> >  utils/cx18-ctl/cx18-ctl.c               | 2 ++
> >  utils/ivtv-ctl/ivtv-ctl.c               | 2 ++
> >  utils/keytable/keytable.c               | 2 ++
> >  utils/media-ctl/media-ctl.c             | 2 ++
> >  utils/v4l2-compliance/v4l2-compliance.h | 2 ++
> >  utils/v4l2-ctl/v4l2-ctl-common.cpp      | 2 ++
> >  utils/v4l2-ctl/v4l2-ctl-streaming.cpp   | 2 ++
> >  utils/v4l2-ctl/v4l2-ctl.cpp             | 2 ++
> >  utils/v4l2-ctl/v4l2-ctl.h               | 2 ++
> >  utils/v4l2-dbg/v4l2-dbg.cpp             | 2 ++
> >  18 files changed, 35 insertions(+)
> >
> > diff --git a/contrib/xc3028-firmware/firmware-tool.c b/contrib/xc3028-f=
irmware/firmware-tool.c
> > index 5dd205e0..6bcb3237 100644
> > --- a/contrib/xc3028-firmware/firmware-tool.c
> > +++ b/contrib/xc3028-firmware/firmware-tool.c
> > @@ -29,6 +29,8 @@
> >  #include <string.h>
> >  #include <unistd.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <asm/byteorder.h>
> >  #include <asm/types.h>
> >
> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index 379629be..5a6326f8 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -1,6 +1,7 @@
> >  #ifndef __linux_compiler_h
> >  #define __linux_compiler_h
> >
> > +#define __SANE_USERSPACE_TYPES__
>
> Please add a comment before this define, explaining why it is needed.
>
> Basically the same as what you wrote in the commit log.
>
> But this is in the wrong header: it should go into include/compiler.h.
> The linux/compiler.h header was used in just a single test application,
> and in fact it is no longer needed and has been effectively obsolete for
> quite a long time. I just removed it from v4l-utils.
I actually wonder if it would be better to add as a compile flag in meson.
>
> Regards,
>
>         Hans
>
> >  #define __user
> >
> >  #endif
> > diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-complian=
ce/cec-compliance.h
> > index aae72842..d5bd1d0a 100644
> > --- a/utils/cec-compliance/cec-compliance.h
> > +++ b/utils/cec-compliance/cec-compliance.h
> > @@ -8,6 +8,8 @@
> >  #ifndef _CEC_COMPLIANCE_H_
> >  #define _CEC_COMPLIANCE_H_
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/cec-funcs.h>
> >  #include "cec-htng-funcs.h"
> >
> > diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> > index fb38320d..a2ffcb2b 100644
> > --- a/utils/cec-ctl/cec-ctl.cpp
> > +++ b/utils/cec-ctl/cec-ctl.cpp
> > @@ -21,6 +21,8 @@
> >  #include <sys/time.h>
> >  #include <unistd.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/cec-funcs.h>
> >  #include "cec-htng-funcs.h"
> >  #include "cec-log.h"
> > diff --git a/utils/cec-ctl/cec-ctl.h b/utils/cec-ctl/cec-ctl.h
> > index 2c82bedc..e0692c31 100644
> > --- a/utils/cec-ctl/cec-ctl.h
> > +++ b/utils/cec-ctl/cec-ctl.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _CEC_CTL_H_
> >  #define _CEC_CTL_H_
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <cec-info.h>
> >
> >  // cec-ctl.cpp
> > diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
> > index f3500555..0cdc19f7 100644
> > --- a/utils/cec-ctl/cec-pin.cpp
> > +++ b/utils/cec-ctl/cec-pin.cpp
> > @@ -3,6 +3,8 @@
> >   * Copyright 2017 Cisco Systems, Inc. and/or its affiliates. All right=
s reserved.
> >   */
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <string>
> >
> >  #include <linux/cec.h>
> > diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower=
/cec-processing.cpp
> > index 20c6165c..cc38f143 100644
> > --- a/utils/cec-follower/cec-processing.cpp
> > +++ b/utils/cec-follower/cec-processing.cpp
> > @@ -3,6 +3,8 @@
> >   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All right=
s reserved.
> >   */
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <cerrno>
> >  #include <cinttypes>
> >  #include <ctime>
> > diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
> > index ac227971..eeb7bc6b 100644
> > --- a/utils/common/v4l2-info.h
> > +++ b/utils/common/v4l2-info.h
> > @@ -8,6 +8,8 @@
> >
> >  #include <string>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/videodev2.h>
> >  #include <linux/v4l2-subdev.h>
> >
> > diff --git a/utils/cx18-ctl/cx18-ctl.c b/utils/cx18-ctl/cx18-ctl.c
> > index 8586f72d..7c13b1a3 100644
> > --- a/utils/cx18-ctl/cx18-ctl.c
> > +++ b/utils/cx18-ctl/cx18-ctl.c
> > @@ -34,6 +34,8 @@
> >  #include <sys/time.h>
> >  #include <math.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/videodev2.h>
> >  #include <v4l-getsubopt.h>
> >
> > diff --git a/utils/ivtv-ctl/ivtv-ctl.c b/utils/ivtv-ctl/ivtv-ctl.c
> > index b42b3489..bf36f40b 100644
> > --- a/utils/ivtv-ctl/ivtv-ctl.c
> > +++ b/utils/ivtv-ctl/ivtv-ctl.c
> > @@ -34,6 +34,8 @@
> >  #include <sys/time.h>
> >  #include <math.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/videodev2.h>
> >  #include <v4l-getsubopt.h>
> >
> > diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> > index 538f4ef3..ba7c7c4d 100644
> > --- a/utils/keytable/keytable.c
> > +++ b/utils/keytable/keytable.c
> > @@ -12,6 +12,8 @@
> >     GNU General Public License for more details.
> >   */
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <ctype.h>
> >  #include <errno.h>
> >  #include <fcntl.h>
> > diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> > index 33df0880..f91c1cfa 100644
> > --- a/utils/media-ctl/media-ctl.c
> > +++ b/utils/media-ctl/media-ctl.c
> > @@ -34,6 +34,8 @@
> >  #include <string.h>
> >  #include <unistd.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/media.h>
> >  #include <linux/types.h>
> >  #include <linux/v4l2-mediabus.h>
> > diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compl=
iance/v4l2-compliance.h
> > index 3517bd07..2c2b2158 100644
> > --- a/utils/v4l2-compliance/v4l2-compliance.h
> > +++ b/utils/v4l2-compliance/v4l2-compliance.h
> > @@ -26,6 +26,8 @@
> >  #include <string>
> >  #include <cstdint>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/videodev2.h>
> >  #include <linux/v4l2-subdev.h>
> >  #include <linux/media.h>
> > diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-c=
tl-common.cpp
> > index 1f9cd0fb..ea120eb8 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> > +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> > @@ -9,6 +9,8 @@
> >  #include <sys/stat.h>
> >  #include <sys/sysmacros.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/media.h>
> >
> >  #include "v4l2-ctl.h"
> > diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l=
2-ctl-streaming.cpp
> > index 13bc057d..7af62ec8 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> > @@ -3,6 +3,8 @@
> >  #include <netdb.h>
> >  #include <sys/types.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/media.h>
> >
> >  #include "compiler.h"
> > diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> > index a64fa514..d8a6c617 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> > +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> > @@ -27,6 +27,8 @@
> >  #include <getopt.h>
> >  #include <sys/epoll.h>
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/media.h>
> >
> >  #include "v4l2-ctl.h"
> > diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> > index a1911e80..fd1bd24a 100644
> > --- a/utils/v4l2-ctl/v4l2-ctl.h
> > +++ b/utils/v4l2-ctl/v4l2-ctl.h
> > @@ -1,6 +1,8 @@
> >  #ifndef _V4L2_CTL_H
> >  #define _V4L2_CTL_H
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <cstdint>
> >  #include <linux/videodev2.h>
> >  #include <linux/v4l2-subdev.h>
> > diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> > index bd08b4cf..1b0d278a 100644
> > --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> > +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> > @@ -31,6 +31,8 @@
> >  #include <sys/klog.h>
> >  #endif
> >
> > +#include "linux/compiler.h"
> > +
> >  #include <linux/videodev2.h>
> >  #include <v4l-getsubopt.h>
> >
>

