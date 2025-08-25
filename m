Return-Path: <linux-media+bounces-40901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2CB337BB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B5574E1894
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6019A28B3EB;
	Mon, 25 Aug 2025 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWV+8mLM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465CC4400;
	Mon, 25 Aug 2025 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756106722; cv=none; b=avwnUfRgIZqvVdgGkbims0m7GHQ0/mHGHETWbcQN4k/twLG3+/mVGxSRtK4zrQnKTQMHqEfKk0/HaMh4m8/B7xQd4hQh8dfcozq17BPPcIht190vTfqvRaJuWMABSVXMKiz9UiYoEReqrKAs4JYuWf+zNQC6aRy0F+Hj6Q0xi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756106722; c=relaxed/simple;
	bh=C1Jwe7SEYGbaPWwABKag0qTiskJafE866UuIeQ2vBhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJS3EBGl5RzUn8t51/wDIvDzYDRLcXHXc5CjQqie3Jr2M5vjEOglk2HMnGIlijzzU1L30KXi6f37Yu3jm3Yle+HTfwV3e/k2ZJRk2U4nq5Azkda+p8z7YEqATOI56iT591SWlf+TK3ci9ZMRgxaoxclNZKar+DgJYL9+jymeyoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWV+8mLM; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61c38da68ddso3708891a12.2;
        Mon, 25 Aug 2025 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756106720; x=1756711520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXwmDm0jwcdMF+1aml2jZ/twWNGaZ36CwgVMBAiyBUk=;
        b=HWV+8mLMFwSkvvECP5f0n6JJpvIKAGez7N0U4CG2iOXKDraT4RxQVoevVFBmGQyq1A
         ERCsFU04HEeatt7geC05O0wM3ZJ6AXwIDUtRjbR/Ps3tQ+ETGRNAbogYGrGTLlUKWEXc
         Z0urkrmKyWovjuVkhVovC4fWKI3H6Ds1C8VrzCRluxyTCRIeRshWnJ76+YaL3cbFRR8b
         lp3AHSzqSpGHrMjAcZLa0J7fRdyR5fX8oWZ38GJRih3NXcm4NJrCr78+OAJGnxk8Mz8G
         2BMxeiiBEaUVfJ4/cSGYFETb0Qu2JPCThrYHy80S5LV6uIK6wV3Lk4ybMpvQoG+gBglC
         0b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756106720; x=1756711520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXwmDm0jwcdMF+1aml2jZ/twWNGaZ36CwgVMBAiyBUk=;
        b=izpxqyJh127edPNm9to6YyfipWjwMqZSNZgUF70FguV1xUXp5Br1sUG2ZeF8+nw7YT
         f8PUICxOWfJCtiJHVf2d0vDNJ4cvF2uj9vNHZKHumAt3uW6Li9lssEA3i2zAujUrC/yx
         SgAeg1ZvdGmonYREc3pK+fFwkyr0g7J+V8EgvEMIDKIOBBTmqFd55aehWvkS7bvC9d+O
         OT41DgIKSGkWj4DlYHswRDPRl+kSeCk6TG2kCoe/UA5WOSxAPfYT4dL7UrRxt+jqs6Ar
         eDxyg77erUFtbxT4eKdLvriH6Yv2nGHpZlBMxYDcnknqCZH8pBwso4qdUG1iVdOUryPh
         J2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIkD9+0+tH0tyIQ9DYXZJvbYAz8pLQtbw7U+B63etSZWR2ieAb68d7cb4MqexJ7a6uo23ZWOaZd6bLreg=@vger.kernel.org, AJvYcCWh49NLS6al1t44aCiH0E1aE9IZvSGU4782GvpLTxbJ6ydAzSf2udAZ7Ru40ehJSPBZWwDvv+/eFcIef+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkWk/FEshMg8i0o4cWQnAi4W1FWmyjcyky92zQ78aptiFWvi9
	8dKrLaUXYVQ9u80cRAIkV+Toak14qDS76r4hkmXHFGoET00CbWIleCCQy6catQUcl6BM7re9BxV
	GDmzMlTlzz1BXg9ftbnsa/RqoSES5kSw=
X-Gm-Gg: ASbGncsNTX57Xmz0bCnagFzAekw+TFXhzsQPodxE7ptslAVwq1XUgI4Kdg0CeWxfcBD
	AtnzdtfW3+fmFSSWoLerC5EMvBhRbnlJhjI/g9V7popUytTbZkAbvsPUHipmtjiLrk0g0kZlVHQ
	oqWlYjW1CSjnJeOGVBPsWQGgr6paQkp8D7ZWSbUe1F/rituqnLPhzoqMdiThbS4NhAQeOCUe+Cy
	lS3O5s=
X-Google-Smtp-Source: AGHT+IFAfstrjNTSy+zxUMo9sweg9FrlyPV/a/zIOtTyu6FO3SUdw/jRQMtzpvd3QDf5fW4qRv6zh2RmmNddFiGIiSk=
X-Received: by 2002:a17:906:4ec3:b0:afe:74a3:f76d with SMTP id
 a640c23a62f3a-afe74a3fda1mr281251366b.16.1756106719408; Mon, 25 Aug 2025
 00:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250824150656.2387516-1-chelsyratnawat2001@gmail.com>
In-Reply-To: <20250824150656.2387516-1-chelsyratnawat2001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Aug 2025 10:24:43 +0300
X-Gm-Features: Ac12FXyUVFfIPQSqjxdn30gGhlenP2UYN6P40UQcEy83nkbUBa4f1SQpLMPrS4Y
Message-ID: <CAHp75VeskiXhCYZZjOVYn=_d9Uo51RyXu=5s2yt-5FTWi1FSGQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Use string choices helpers
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, tian.shu.qiu@intel.com, bingbu.cao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 6:07=E2=80=AFPM Chelsy Ratnawat
<chelsyratnawat2001@gmail.com> wrote:
>
> Use string_choices.h helpers instead of hard-coded strings.

>  drivers/staging/media/atomisp/pci/atomisp_compat_css20.c     | 3 ++-
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c    | 5 +++--
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c             | 5 +++--
>  .../staging/media/atomisp/pci/runtime/binary/src/binary.c    | 3 ++-
>  drivers/staging/media/atomisp/pci/sh_css.c                   | 3 ++-
>  drivers/staging/media/ipu3/ipu3-css.c                        | 3 ++-
>  drivers/staging/media/ipu3/ipu3-v4l2.c                       | 5 +++--

Split to two patches =E2=80=94 one per driver.

...


>  #include <linux/platform_device.h>
>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"
> +#include <linux/string_choices.h>

Please, move this to be in the group of the generic headers, i.e. in
_this_ case it's expected to be

  #include <linux/platform_device.h>
  #include <linux/string_choices.h>
  #include "../../include/linux/atomisp_platform.h"
  #include "../../include/linux/atomisp_gmin_platform.h"

...

> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -17,6 +17,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/bits.h>
>  #include <media/v4l2-fwnode.h>
> +#include <linux/string_choices.h>

Ditto.

...

> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -8,6 +8,7 @@
>  #include <linux/mm.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/string_choices.h>

Prevent the order.

--
With Best Regards,
Andy Shevchenko

