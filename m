Return-Path: <linux-media+bounces-29583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D1A7F506
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46F33189518D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 06:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752F925F969;
	Tue,  8 Apr 2025 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/HJNISP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9C1FC0FC
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093939; cv=none; b=rE8JMq3ofzLZiqAvJV7uP2iNdoPis+e/MkUl7oDCOn80zawpipp3RxKR5m5TGkkmhVTYroBEWs34YEq9LqAF7pF1X/2wT1shX6+T6iu1rCvNdhoko4C0BN79jtxv/4CweALekbRzFzZbB5dXOXJBtqAaxT31ZO87ffqrBdM+pcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093939; c=relaxed/simple;
	bh=R4kok2Y+5XpRdRR8sVbBYE9pryIMumDpfTr7x5+W1c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkWPLrirxl49Qrvq1lU5D/bFYAsCvcflfCq54vLyuKcbizdBQAtxfmA7vhtQsuOgw1qnDeDlNq3Dha8VJMJnZS/QJFGgFNG3i4OMIdPoFWafsq8sOKB0kjUdbHCcMi9sm9JL6Vwt7MN9RJHAvuOIab30LQ481JTt7qtccb5Mor0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/HJNISP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380D4C4AF0D
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744093939;
	bh=R4kok2Y+5XpRdRR8sVbBYE9pryIMumDpfTr7x5+W1c0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=W/HJNISPOwcwaG51ClaZ7S5PcrFVGVn3OBBWC37hIP74zpFOHdCWpgB4lrdsEBpWW
	 g9FSWIYsJgE7K9Dl5O0K1AMwTPIQx0DC3IqfufnNT1nELj5p0WnkwYOAVCnnlov2Ky
	 PEwGAUEEzJ7V91K9RAb1egNpLYtRKLuaptdSNOB793xeicXNZV7tDqUjrpXYhRt+CR
	 ncBnszmSRidKAHsLOwbcjSQRwdK5VYliQURcRUZrhOGhbItVfy6bm4ifvK1u52wuT5
	 1Ex3AUwHk6tR6bA9iW0t7gmlOTW3Ilw74vArZVPUlAcwbpez9oGx4FRAefYt9lAgbM
	 7Q4GhsaBVpp3A==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30db3f3c907so47259881fa.1
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 23:32:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyLMbTb2MOvhb62BMGbk1qW6qCS6C0RuX10vutdM+khYsN01mJKoKdJ0YPFjP7RqLThv2aH1RPARVr4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjvF0E4zUdqt8OLQo1dd495kcqmAPY+Zw0wQ4qI+qjNf0JWr5Y
	rmqAZFMjVcL4HHCYsfSuvoWEPmuyfFUWb64wf33c3vdxKTjwHDRLtxn+rN+YuhhK3avzt4lJ6C1
	ZuOz5Ab2i1wM46pEHWJ+d3CdmwN8=
X-Google-Smtp-Source: AGHT+IHEtwAb+Z0KDTbN8vwCVm4A6GA0GkgG4WFucsFNoZn8aBrtZVED4RdKf2rujVuKspFsOjA9pQMEaqQL8+/mrG8=
X-Received: by 2002:a2e:a817:0:b0:30b:be23:3ad with SMTP id
 38308e7fff4ca-30f0a118e36mr37536621fa.10.1744093937435; Mon, 07 Apr 2025
 23:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl>
 <20250407193909.GA17385@pendragon.ideasonboard.com> <20250408133142.030bd1cf@sal.lan>
In-Reply-To: <20250408133142.030bd1cf@sal.lan>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 8 Apr 2025 14:32:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v64JXggyR26q2M7h+E3pDKqccuQF8gJpBvR4p1uuYndUOQ@mail.gmail.com>
X-Gm-Features: ATxdqUG4zn_rb6W9CGbE8kFH1VehSE6-0upsnnkHdSojJTy1vNsBeI02sGiXWAg
Message-ID: <CAGb2v64JXggyR26q2M7h+E3pDKqccuQF8gJpBvR4p1uuYndUOQ@mail.gmail.com>
Subject: Re: [ANN] Registration and Request for Topics for the Media Summit on
 May 13th in Nice, France
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>, 
	Steve Cho <stevecho@chromium.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Kevin Hilman <khilman@baylibre.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 1:32=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Mon, 7 Apr 2025 22:39:09 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>
> > I would like to propose the following topic.
> >
> > Review of the status of staging drivers
> >
> > We have a set of 11 drivers in drivers/staging/media/, with various
> > states of maturity and development activity.
>
> On a quick look, we have there:
>
> 1. source "drivers/staging/media/atomisp/Kconfig"
> 2. source "drivers/staging/media/av7110/Kconfig"
> 3. source "drivers/staging/media/imx/Kconfig"
> 4. source "drivers/staging/media/ipu3/Kconfig"
> 5. source "drivers/staging/media/max96712/Kconfig"
> 6. source "drivers/staging/media/meson/vdec/Kconfig"
> 7. source "drivers/staging/media/rkvdec/Kconfig"
> 8. source "drivers/staging/media/starfive/Kconfig"
> 9. source "drivers/staging/media/sunxi/Kconfig"

This actually has two drivers:

a. cedrus

IIRC Paul has some more patches that are part of the stateless encoding
work. Those would finish the remaining TODO items. Even without those
I believe the existing decoding functionality is working fine.

b. sun6i-isp

This was also done by Paul during his time at Bootlin. However I don't
think anyone is using it, since the DT parts never landed.


ChenYu

> 10. source "drivers/staging/media/tegra-video/Kconfig"
> 11. source "drivers/staging/media/deprecated/atmel/Kconfig"
>
> > drivers/staging/ is not meant as a place for drivers to die,
>
> It is, actually: we usually move things there before dropping,
> because, on most cases, they could be salvaged if someone is
> interested on it.
>
> > we should nudge the relevant
> > maintainers and consider dropping drivers that show no hope of
> > progressing.
>
> Fully agreed.
>
> -
>
> Yet, while it makes sense to have action plans for drivers on staging,
> I don't think that the Media Summit is the best place to discuss,
> as people that might be involved with them may not be able to
> participate there.
>
> See, there are different situations there, like:
>
> - platform drivers: at worse case, those should be removed when
>   the core/DT support for such platform is removed. We removed
>   several such drivers in the past. We can also remove them earlier,
>   if there are reasons for doing that and nobody is complaining;
>
> - drivers like atomisp that takes a lot of efforts to be promoted.
>   As long as I see some progress (and we've been seeing progress
>   on every kernel version), I can't see any reason why removing it.
>
> - drivers like ipu3, which is for an entire family of PC CPUs.
>   I prefer not dropping drivers like these unless we have very good
>   reasons to do so. On the other hand, we are seeing very little
>   progress on those.
>
> Anyway, better to split this into different threads, copying
> the people involved on the recent changes for such drivers.
>
> Regards,
> Mauro
>

