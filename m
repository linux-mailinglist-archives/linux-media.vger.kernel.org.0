Return-Path: <linux-media+bounces-37890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783DB07BFA
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 19:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3478B5007EF
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 17:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0490A2F6F9F;
	Wed, 16 Jul 2025 17:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9EUxwla"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3E22F5C43;
	Wed, 16 Jul 2025 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686868; cv=none; b=CKeSM2EXTnKeqg76tVpp4cSwnvedFfR9hDS0UOC1nLz9eMdhsueUh9vGkPjHAwjTm1FZc9r2l+6vvLz5l9FKW36ss65SozF7SQYSduQ6vmvX9uoEbFB8p7MEbfRbtJ1Lk93o3YSO6ILzNqHEzrfx9tX/yeQMb4Gi9NKi33Olgsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686868; c=relaxed/simple;
	bh=vGllGUCGiDgHJ1wVGKD70Ly2L0DljA2b3eYLzfs3SOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aspPojTimH2p9/jZ6kdkVgEvUql254Ya/kfF/7e7Osk/QKH9Pw0i/w5180OvvIxq0q5QoXLluLYRgfEBIdB816Vd+Hb7M2mdV+/IO6NuQZwMd9LVAU3dF/on55RYgxOgVIVtvkr+dkfKR8cyKJ6my1G7sBTAhzvYtDUMLX2qHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9EUxwla; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8b8995f9c9so22780276.1;
        Wed, 16 Jul 2025 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752686862; x=1753291662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvloVeMtiDsDLEZd6NogCW6v2SRhUa+PTaZTZmI7UkU=;
        b=W9EUxwlaInMTO/Dy0gi3/CUJMbwTHocRfXpJ7CrBBj0uynECwRiHo5cXjv2qM4rOdP
         qc4i+1dvXq3yZ5cnLFv/qkY7a2Ivl7Iefz2EAQ8lcBkarRi841yzeQgsuAVCorq+zzKG
         z9iWrGBue+zoHRbCTq4eCxQeJjBacpRg1SbhoJl8LwbvnvxMOxeyMSStZK2DM5r14igY
         sQAi8sDj+VfdarYOKfSmDqfB4byWAaRTRrrQc8EoXxTm/wAIPgoNgpqJgMQsBl1H9tVN
         qn+eZLcS/fwyH43utsEJZQWkFcjufLyuaiILXvPw7ULLCy1hDu0B8suXwi/na7SR+dTz
         tmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686862; x=1753291662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvloVeMtiDsDLEZd6NogCW6v2SRhUa+PTaZTZmI7UkU=;
        b=wChR2j4yKNzZq/EsEpr0SZCtHcy2CGbeSzmnaHGKFMtBLZkR2FSnpDZUOx+ZljsLWF
         +9cdFyCNW2+T1ezKNjJmTZ+qqdwsEkZSV6JXLu9cPzbDZDk2Tms4wd5oxSSxh4uJ+ovn
         QAkvRGC2QKehy1f6dqc1+9UFXnvP4vEUl/TQSZBwtMbLINNtk7UIpSqS89CgSNOu2AvR
         aIca2u85BpguK8px4nzhA5J3UnUCWtlfEcU9nULDNxjX8J8BLl4x9oUEEKhwkTeKlZtG
         KzHQNRtq8aIaeIWRRDD+GPy1Njk4NGS453e/evqrIfBxKJxSAl8t+33EEtp1tHz5PMLN
         wZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCVKdT5WfaiyF3iv9JEN2KeVhE4nmXkMjpq8S1oOYWzMD0z9p7UJETLSL3zxmb4yb4vtbSmlbswa4OzUIR4=@vger.kernel.org, AJvYcCXO2eye1Dq7xm5dDHtWNZfemoQ98L1MKi2Z6NHN3VioJlfjoq7l+bg5mcpcVeGi6+HpooAuA6aiJ3YhL+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSzvYAUQ5iIdCjIkgPr96+KXnqK1iW+w9JPvvjP/Hp7lyXJNw
	yDI6vfFWXIgrRfBDjz6GxSNq/GMcXdKFfT9FJpBOiyGDjONnWVbsXTQL/ALPSZ3AvYfiqFL3GpO
	jFj/2FtLX9YM7DzawVETc0wuPBAffalU=
X-Gm-Gg: ASbGnctjLv0rASPQcwT/YuR0Kc44BX++JNefscBVd/hFnAV5NWP2SYnxqhKXeCLNLnc
	iUByji8ON5x0k6d2DLBmklcRkExx36/JjYVmuoQDaSjvkqp9b/xt0a6BlsY1SeKmP8Id85uXdqH
	OVSK/SixpgkDh2QPREd2GVP6wU3ql0OYjZyGbZ+CF6Tn9drbcOeERKXtKaQlUM45gh31Ts5vsRV
	2oRt/Aaxw==
X-Google-Smtp-Source: AGHT+IFcZRB9tZAKWFUgshmLoFJAFSdkhYD1bM0wT/BrW7MpFemhgFBwLKraWqKGpig35iTB8Sh1V6QrJffqXy/oSu0=
X-Received: by 2002:a05:690c:3:b0:714:49b:d58f with SMTP id
 00721157ae682-71835187107mr27550687b3.8.1752686861665; Wed, 16 Jul 2025
 10:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com> <CAHp75Ve6rE22crmt5mUioWtkWm_-ODV+Dk2gcTQ8ickhMMkvAQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve6rE22crmt5mUioWtkWm_-ODV+Dk2gcTQ8ickhMMkvAQ@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Wed, 16 Jul 2025 20:27:30 +0300
X-Gm-Features: Ac12FXw688dtJae5mhU7UFhqJ-ZLDHJXMPWRh_b7-LKwxRnzxxdPYQexaIOmM0k
Message-ID: <CAGn2d8NpjYse9k04Efy8cZtgs9sWwGD6s7LQqDyTcQ0+U3bMrg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Wed, Jul 16, 2025 at 11:11=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jul 16, 2025 at 4:42=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The function atomisp_set_fmt() modifies shared device state and expects
> > callers to hold the isp->mutex for synchronization. While most internal
> > callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> > V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> >
> > This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> > (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> > pipe->frame_info may be modified concurrently without proper protection=
.
> >
> > - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().
>
> If it's a fix, please add the Fixes tag.
>
will do , thanks.
> ...
>
> > -       return atomisp_set_fmt(vdev, f);
> > +       mutex_lock(&isp->mutex);
> > +       ret =3D atomisp_set_fmt(vdev, f);
> > +       mutex_unlock(&isp->mutex);
>
> Side note: Can you consider switching the driver to use cleanup.h
> (guard()(), scoped_guard(), __free(), etc)?
will look at it .

Would you please look at this patch series [1] , it hasn't got any feedback
and i have more work that builds on it.

> --
> With Best Regards,
> Andy Shevchenko

Link: https://lore.kernel.org/all/20250712191325.132666-1-abdelrahmanfekry3=
75@gmail.com/
[1]
Best Regards,
Abdelrahman Fekry

