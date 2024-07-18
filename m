Return-Path: <linux-media+bounces-15115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306D934883
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 09:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54587282B8B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 07:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1859C768E7;
	Thu, 18 Jul 2024 07:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="r0iUkIUF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378BA4C62E
	for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721286271; cv=none; b=dx2UPoEJr3GfqLIVKioT65uDYj93OaT2EObM0HEWWzHj03UwWM2oEk9E13w5enU+1TouO9Zfur8ONvuBTWdnDdGtHJrQpNfTY3e8hGDusF0RadKHCgXqeFfQ58+Bkedf6RKduOBpIjxyPQkZkrEAQBic35mIA9QTrdADAVd+pL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721286271; c=relaxed/simple;
	bh=1Xu8Yi47SBbo6wUtzRMDew71eWHN9aqL5DaNW2rC8BQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qm4CN8wC+N8hGRrQYC7Zi+jcqiZW2MwuQ9CoEe7Q0SuhHY0+qjUoJkzF/aiv4i0mtiOnCVeS0v72irYsfRA83+ATGsL8kz1PqtF1RCVOXkq7GG6M1Q3MnhuxmnwKfkKXM3PqwklMP1vIQfO82f/juTo1eo1xEaV0OPIvK3Xtylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=r0iUkIUF; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-664ccd158b0so4623667b3.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 00:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1721286268; x=1721891068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T079+BhXBkSwoZ9I0E7sRDEQbm5N/2Sok2ZsenaxAAc=;
        b=r0iUkIUF1jFH8thUMF1UmvU4b5RXdFqZ25I8KVeEYsHtzmO9Bd3Dy7O6gSnpdc1z6o
         zynkD3X8GphnccI91zNh1JJTW9Vpo7iCJBfEwlISU89RFnHhmPK3a/KLaP6c1X/a9/9B
         cyJ9BZhSI5SgKwWurAeNLJ1E0hd89KEa7nCYYuzc8B7OHxf8AGrQHZPJbGD2yZoEemki
         7XY6MFW4wbb5tZDtDraiLdL1j8+xtKybTLIrJOQPI8NECAKl9gkHoNabyIKjHYw0LSdn
         M9LF7PoQ/qCXeauvcroluF8MEJ3AJ6aypCpw9hHLPfN/J6rGGzZgnFEidkUpx7282GmK
         DwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721286268; x=1721891068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T079+BhXBkSwoZ9I0E7sRDEQbm5N/2Sok2ZsenaxAAc=;
        b=l164gsWWUh3vnkAG5KKcicvvl7poNDkoxqbWsTNWVOjEPE3IeeuKo0d82plglqjapG
         biuHpDawhhayioXWKrZG8HvT21UlKExf2TTdjIa9jB6Hyr/SFr+HyYc+WqZ+lqN4liGJ
         mBh0BbMI7Ote2HwVjCmbAX6uunuDh0VhgOPmJe+WCC8VO/EMNG/5aREzF5GGEZU3G2Z6
         LpouRRQI/+AE8L4RQzBd/HOUXxSVw6VaO0L2wXzZR4z05VzYRN+CMEXmuk/t1L1JuxQt
         E8L16nDQCTVicv/VGmcY5su/oWOgytOo+xH7Ws2F8cISJk35fNUKNaPuuWp8fC5t+ENY
         o8eg==
X-Forwarded-Encrypted: i=1; AJvYcCW/jy0GVpv9onKs7Jp6FZ9AidXAjNPE6T1R6S5s79XlRegICObMpcp3lZzH8xq7iNmRLzk1P+go87XavXg4naRMl5c53x3aK/75eK8=
X-Gm-Message-State: AOJu0YyVc1qacA5nlu9ad6DDCBCo0jkLRcKhOTffeWEbk9+g2q/JAKeP
	sn23kEyeOkmBDrzUe1Uf6KaFAJbOy8IHTNXebvoRBxdWgX5t7UuOoPyv3WIL4em01wIJ4iwPKlj
	ZRv+o7DGQ/0C0ugp8KRQX/CfChPpolGolgiiy6w==
X-Google-Smtp-Source: AGHT+IFlQI8K52rV4omYU+cIAWyk8RiToWA0rPlVty8biTQda5X0QeC0G+0wl/1ZhV+NfvqjKUmqbEHYihn5KA4LE5A=
X-Received: by 2002:a0d:e842:0:b0:65c:703:bd5f with SMTP id
 00721157ae682-664fe933a4emr47489867b3.12.1721286268127; Thu, 18 Jul 2024
 00:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715102425.1244918-1-naush@raspberrypi.com>
 <t4zv56rnrprztgyjyjx3k3lzaitddky3c22bqslykq3qvxi7gi@jaafmm5uw6rs>
 <CAEmqJPrUbK-gpHfJG84iBeA_9WOJYLDoa4JaGjLvZYoq-nUgdg@mail.gmail.com>
 <74hch6w64p7yzn4wustd3btn7dglxxbuge3r6bapb6chbbddeu@vljc2qopn5kj> <f6696dbd-0b1f-45df-823f-bc738d95ff48@suswa.mountain>
In-Reply-To: <f6696dbd-0b1f-45df-823f-bc738d95ff48@suswa.mountain>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Thu, 18 Jul 2024 08:03:51 +0100
Message-ID: <CAEmqJPqh0uj2hj5x=S-2x7v6xMyYcyOwbB5oaZUdP++Kb98S-Q@mail.gmail.com>
Subject: Re: [PATCH] media: pispbe: Protect against left-shift wrap in V4L2_COLORSPACE_MASK()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 14:30, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Tue, Jul 16, 2024 at 10:48:20AM +0200, Jacopo Mondi wrote:
> > > I did consider this, but did not like the undesired behavior it would
> > > introduce.  With your suggested change above, we now switch the color
> > > space to an unsupported value (V4L2_COLORSPACE_DCI_P3, assuming we
> > > shift by V4L2_COLORSPACE_LAST - 1) if the user passed an invalid
> > > value.  Of course, this does subsequently get fixed when used in
> > > pispbe_try_format(), but not for the usage in pisp_be_formats.h.  In
> > > my original change, we revert to the default for the requested format
> > > instead.  Although, perhaps my test should be if
> > > (!v4l2_is_colorspace_valid(f->fmt.pix_mp.colorspace) ... instead.
> >
> > Keep in mind the core 'sanitizes' the colorspace for you (see the
> > usage of v4l_sanitize_colorspace() in
> > drivers/media/v4l2-core/v4l2-ioctl.c) so a fix is need only to silence
> > smatch not to actually address any run-time issue.
> >
>
> Ah.  That's true.  Let's just ignore this warning in that case...
>
> Smatch would have an easier time parsing these if we passed p instead of
> arg to return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg) in
> v4l_try_fmt().
>
>         struct v4l2_format *p = arg;
>
>         v4l_sanitize_format(p);
>
>         return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);
>
> I can just filter out that call to say that when v4l_try_fmt() calls
> ops->vidioc_try_fmt_vid_cap_mplane() "arg" variable is trusted data.

Sounds good, I'll drop this patch then.

Naush

