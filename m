Return-Path: <linux-media+bounces-38217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515FB0E450
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 21:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D80A61AA47DA
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 19:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB045284B46;
	Tue, 22 Jul 2025 19:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e4QA7s9W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BA7156677
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753213178; cv=none; b=uPiiIbaUJmL/wnDOBTdAssGtOdJiNavzwR8EkvFYbscVuujjMVtfTM5FFo3DmPV4MsTooRvViOB0qYYTgvHAzW8Gm22KzZS41SV0q6W4Tx+pwtOR27sEOu2D/J7cDP5MhPod89d7JMjqQLPadVvsiNkMihJOTDDUJIuISPjPvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753213178; c=relaxed/simple;
	bh=5xr6KLwLPy50U76Y7R7i7qmSOKcJQj5y4DYs/Y/1Kr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+qUz6iigKEWrQ578Hw35VveHDploUEt8U16a6V5LC2HIfrIEst94WzTOjrLj9Zx7f6QU36/EOMy6e/GXiEr6shzN+JSzm+L+VKUXWvjChmb3hvNOYp6KU8tEhBKTV5lVl/5W1+Wu2rs4l3BbmkCOid5Z1BHbD+DrcWJiu2h4bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e4QA7s9W; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so1193034766b.0
        for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 12:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753213175; x=1753817975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEM6NtKqTnDVAsyCqROCUL2IX6X5XMs4/UEk6e3ZmK8=;
        b=e4QA7s9WResGJ8zKgxSgDk3fJWCdyXBVGZr7EpRzFfrSrBjoxHyhwDQGr1GvaAxsLN
         8QswBN7XN6TGHGy0dVKnSwjtm9qeoGdXoYU+9T5qLxyF4m3V7PcCAr8HDn6hmBkcP7j6
         tOOifI1ZEDvzolUMzPafegdKqI2lqvJrUtqeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753213175; x=1753817975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEM6NtKqTnDVAsyCqROCUL2IX6X5XMs4/UEk6e3ZmK8=;
        b=SkS8wDAaPexfKAEfAHzkENiHIHk7U4DZr8uwVgcJhVk5pU9aha6WBwhqNUVtSMV7tJ
         TGZES6lGCllDzKSrsQlYIJvfuCW6lZEQaiHRk9mMbTUQNJ828Vf4t+0VsAlStjz1utQz
         9K4U/dObeZO67RcCD+Iz5t1W475DVOKUrVGaTMPeuR/Vio/FoxVQkCU7BS7boXcCK7U8
         CZvjGlaDXPDQp5gCx2SowoedEtOGbAK40rSrgOZeiyHrE7lo9qFAKKholtwPv2U1DKaC
         aGjo/lVEZCFHL494YaEAPjVmVsz+t/vdUpt5mK0J8Cm1aOQkg769ECGlSTRBLWRAqB17
         FbkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcLB8JFkhZz+EH+A+G0xfUPoIQo7j7y9NcWyo0IbIzXYGo2qWoof80PAmYQbmdPpRrdWZzOJ287AU8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzChCyUG0loGP7SD33/h6mQr0OapwpRFHdE/veVRmTMRkBLlhFI
	oBkqkWOe0wGtGPGXLxL6/RHIYPrD10VN6C905KPBo4yyti/BnZZLypQdfj2Kyz1yB2FW8V/mk4g
	PkN/Dr7xy9/2B+O2e43tpO3I+daShuTFtkLso0fEH
X-Gm-Gg: ASbGnctWsTCZMyv2zWIxUpgsQ5H1j7gIKKH5KcmuFPYswkvbSnZV6hEKMDI+RXkxGna
	fExtJZHmJY5nnKo2B5CA+udHDnYvqqS4Ycc6BafeD0nVwDYHmKdYucQUyDKQmHcKG7Z6E/guWjP
	IEj82rLLmTy/g5C9SKHiJziZWePtNLhXDkpoVFF9O9S9sKG9RSmcUHL9L4pT5szsvPEU2/X3Kjn
	zN3OO0=
X-Google-Smtp-Source: AGHT+IEXhK1131XWCxvi7Nio2+68OjFD+uuKTnM3IyahEOE8+SxQmj0cr6JJq5Z4EymBmSkfKMUBkrSQPB3Jk18uL2k=
X-Received: by 2002:a17:907:7b96:b0:af2:3c43:b104 with SMTP id
 a640c23a62f3a-af2f927315bmr7197266b.54.1753213174869; Tue, 22 Jul 2025
 12:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-su-v1-1-0f740fd8bfb6@chromium.org> <7ebb8be3-ce67-4989-bae6-8459aef74528@kernel.org>
 <CAEs41JAt5Hjp7G6LPr36e+BT0dp6RU5p25kzCwnwBpBfF-3dJw@mail.gmail.com> <2ea2202c-d9bf-4fc1-a33f-2565ebe1d425@kernel.org>
In-Reply-To: <2ea2202c-d9bf-4fc1-a33f-2565ebe1d425@kernel.org>
From: Allen Ballway <ballway@chromium.org>
Date: Tue, 22 Jul 2025 12:39:23 -0700
X-Gm-Features: Ac12FXw9ATIB01PJWLFPAzqRnJ_m6YQA-jqJ9ZowEDQNiVWvR9_fUo-Roi8FqVI
Message-ID: <CAEs41JAYytgJMD4L_ZVxAm4v29gQdjSvMrQ-jx5zE1TydtZ2WA@mail.gmail.com>
Subject: Re: [PATCH] media: ov8865: Preserve hflip in ov8865_mode_binning_configure
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jul 22, 2025 at 2:19=E2=80=AFAM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
>
> On 21-Jul-25 7:46 PM, Allen Ballway wrote:
> > Hello,
> >
> > On Mon, Jul 21, 2025 at 4:51=E2=80=AFAM Hans de Goede <hansg@kernel.org=
> wrote:
> >>
> >> Hi,
> >>
> >> On 17-Jul-25 11:07 PM, Allen Ballway wrote:
> >>> Prevents ov8865_mode_binning_configure from overwriting the hflip
> >>> register values. Allows programs to configure the hflip.
> >>>
> >>> Signed-off-by: Allen Ballway <ballway@chromium.org>
> >>
> >> Thank you for your patch.
> >>
> >>> ---
> >>>  drivers/media/i2c/ov8865.c | 8 +++++++-
> >>>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> >>> index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..40a852d31f13aff960acf=
d09b378d71525e19332 100644
> >>> --- a/drivers/media/i2c/ov8865.c
> >>> +++ b/drivers/media/i2c/ov8865.c
> >>> @@ -1746,7 +1746,13 @@ static int ov8865_mode_binning_configure(struc=
t ov8865_sensor *sensor,
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> -     value =3D OV8865_FORMAT2_HSYNC_EN;
> >>> +     ret =3D ov8865_read(sensor, OV8865_FORMAT2_REG, &value);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     value &=3D OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
> >>> +               OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
> >>> +     value |=3D OV8865_FORMAT2_HSYNC_EN;
> >>>
> >>>       if (mode->binning_x)
> >>>               value |=3D OV8865_FORMAT2_FST_HBIN_EN;
> >>
> >> this change should not be necessary. Lets assume we start
> >> with the sensor runtime-suspended, then ov8865_resume()
> >> will call:
> >>
> >> ov8865_sensor_power(true)
> >> ov8865_sensor_init()
> >>   ov8865_state_configure()
> >>     ov8865_mode_configure()
> >>       ov8865_mode_binning_configure()
> >> __v4l2_ctrl_handler_setup()
> >>
> >> Where the __v4l2_ctrl_handler_setup() call will apply
> >> all control settings including hflip.
> >>
> >> So unless you manage to hit a code-path where somehow
> >> ov8865_state_configure() gets called without calling
> >> __v4l2_ctrl_handler_setup() afterwards then this should
> >> not be necessary.
> >
> > ov8865_state_configure() is also being called from ov8865_set_fmt(),
> > and makes no calls to __v4l2_ctrl_handler_setup(). I'm not sure if
> > calling __v4l2_ctrl_handler_setup() here as well is the right fix, but
> > the driver ov8865 seems to be based upon, ov5648, seems to avoid
> > this issue by preserving the flip values when setting the binning
> > register values in ov5648_mode_configure by using
> > ov5648_update_bits() rather than ov5648_write(). I believe that we
> > just need to preserve the register values unrelated to binning inside
> > ov8865_mode_binning_configure, possibly by just using
> > ov8865_update_bits() instead of ov8865_write().
>
> But you cannot call ov8865_set_fmt() while streaming, since
> it has :
>
>         if (sensor->state.streaming) {
>                 ret =3D -EBUSY;
>                 goto complete;
>         }
>
> in there.
>
> And when not streaming the sensor is off. So inside ov8865_state_configur=
e()
> the ov8865_mode_configure() and thus ov8865_mode_binning_configure()
> will be skipped since that is protected by if (!pm_runtime_suspended())
> as mentioned before this is all a bit messy in this driver and it would
> be good to untangle this a bit, I think the ov8865_mode_configure()
> should be moved out of ov8865_state_configure() and instead done
> separately on power-up.

I see now. ov8865_set_fmt() will be called multiple times after the sensor =
is
resumed but before it is streaming, calling through to ov8865_mode_configur=
e()
and then stomping the register values. Moving the ov8865_mode_configure()
call out of ov8865_state_configure() and into ov8865_sensor_init() prevents
this and allows the flip to be configured correctly.

Thanks for the feedback, I'll send out a new patch for the above change soo=
n.

Allen
>
> Regards,
>
> Hans
>

