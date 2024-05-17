Return-Path: <linux-media+bounces-11624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D68C8D7A
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 22:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54AB81F2281E
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 20:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C581411C1;
	Fri, 17 May 2024 20:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KebfwdfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E61A2C20
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 20:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715979244; cv=none; b=dXbq/WaQMlbNV9hBeOqYyzsgvpwC6gtD3OOs7tBOj3oaM3mx+l6T/ic+NoUOeZpg040/7CDINlbQHHP24nSohQmsKYc8ILPvWiVpXoQhL4uDTyCf/WUmj5JLV3EbKwDd3Txa8pHcBwDylwVKQKTnmE584DSaBdBUmfKPaANLoQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715979244; c=relaxed/simple;
	bh=vn13dLP5pRrsDv4NOdbcqGoQN2bmYpHdTGHpP55EB4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgEIBhm7ihwFzGGgHu66DWD1smbBIzdrKm2IoW4Pl80vnJqVg+jSfb9BYIeeQ7AUfjMdC+POT3iIcG59seE6NzS7Wm8u3o6PJ2SptNgF51O7/EXgRo2bUlr61hWR1VBvejC5+B4DJHVi65dz415g7rLT+czQMXHsjsfc1AWnG4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KebfwdfQ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5724736770cso1020a12.1
        for <linux-media@vger.kernel.org>; Fri, 17 May 2024 13:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715979242; x=1716584042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vn13dLP5pRrsDv4NOdbcqGoQN2bmYpHdTGHpP55EB4g=;
        b=KebfwdfQ9jw4lmDSBqtGP/1C32uY6jtIJb28zWOaE7dLEtEgSkH+/iQ71SCIQxDrpK
         5BtINpUfziZuB0krCCw6SJqk0uM8bKC1XWFVifm6zeS04duJhlMYsgPvuFQ02+P4+7Q7
         TtOT0mTnU+QnD5SQ+mceO3IXzU7DR39npY3V6KnFsu22VxyFk+KC/+DciYd6AjTGm2xq
         h8ha8JRWe78OIC8c8ANzkDac4FE+cauA1nBuiKLmw++Ws/QBCztmsa/akETc6HV0PgD+
         LCDOaF5mTVqPIp3WOXXruIs+N4/P+fS3RjPRu61pJbRinL2AlkxnSz282Clo6s4JwKDU
         4yZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715979242; x=1716584042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn13dLP5pRrsDv4NOdbcqGoQN2bmYpHdTGHpP55EB4g=;
        b=QwofaY2RtzpQyhoykff66V9wc3dm3e5jLq7pY5YrGSl1YrLujl7041P+WN/XvrhinM
         4/CR4RI3ThHx8spTXbpVVSyDHelsJUF7uP58rNe3hmg6RJqXRfIgoyPPAgPkCqxja8I3
         GuKnvWwe5Ad20dqhlfsEYfWY053VOFS8tD6mx49EcYN0ZLoAgmTntjC5rc+EPSapZOB0
         vyX8WfN9i5xY7JG0BXYwZ1c88CPHsH1MBzEPH1Yx7ApBoI8N2bUQIgJJuldaYAQeX4wa
         cv/ImS1Qfw793CIXjs2XYB56vd3u1qXv7hhshkGBLQ8G3D3DNRR5Cw8o7QX62wjW1L0S
         zbCw==
X-Forwarded-Encrypted: i=1; AJvYcCVPYuAOpP0F2AwSqe+q6SgqC819zm2eLqsp6GraRc2DLmzxQ00rnLc1Z64v4SqVHqi6KtI8/tZeayEA+dCOptyaqM+lPLljsKCXIsE=
X-Gm-Message-State: AOJu0YwpbdEqt/NoeHsGwUlkHVftjswT4Wxqf5kWKngUEG4Rgc9k6Mpt
	GI7rCBnXDVbADbzhkwCz3dDSGCNig4W2SsI6EdipBsTH+SqlWC9KegDBEp3OaLFyqrTCv0w7Xm3
	QFeyiVh283bPsa8k3Y/OsUvXY2k+hL6Um+Efv
X-Google-Smtp-Source: AGHT+IFRAIfV54+Aa1LbyF88d23hN+YT1t2sexWDi9c3fyTst75D5FRNvAf6sgXSn3IVxUNlK5yurWk/GWDFHEMqw/c=
X-Received: by 2002:a05:6402:2158:b0:573:438c:778d with SMTP id
 4fb4d7f45d1cf-5752c3f15c3mr3670a12.1.1715979239492; Fri, 17 May 2024 13:53:59
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517171532.748684-1-devarsht@ti.com> <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
In-Reply-To: <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Fri, 17 May 2024 13:53:47 -0700
Message-ID: <CAGS_qxpCM=Aw1J_EVQPZv_nDy0zCp6JqxfQk5mGkV+5iCe1OZA@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com, 
	akpm@linux-foundation.org, gregkh@linuxfoundation.org, adobriyan@gmail.com, 
	jani.nikula@intel.com, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com, 
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com, 
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com, 
	nicolas@ndufresne.ca, davidgow@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 1:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> > [devarsht: Rebase to 6.9 and change license to GPL]
>
> I'm not sure that you may change license. It needs the author's confirmat=
ion.

Checking, this is referring to the MODULE_LICENSE, which used to be
MODULE_LICENSE("GPL v2");

and is now
MODULE_LICENSE("GPL");

If checkpatch is suggesting that now, then changing it sounds good to me.

>
> > ---
> > Changes since v6:
> > * Rebase to linux-next, change license to GPL as suggested by checkpatc=
h.
>
> Note, checkpatch.pl is not false positives free. Be careful
> with what it suggests.
>
> > +#include <kunit/test.h>
> > +#include <linux/gcd.h>
>
> > +#include <linux/kernel.h>
>
> Do you know why this header is included?

I think I had put it in the original before a lot of the work you did
to split things out of kernel.h.
I haven't had time to look apply this patch series locally yet, but
I'd be pretty sure we can remove it without anything breaking.

Thanks,
Daniel

