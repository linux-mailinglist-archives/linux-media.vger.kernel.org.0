Return-Path: <linux-media+bounces-32850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD284ABC9FB
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 23:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3977188D24E
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 21:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA90921FF47;
	Mon, 19 May 2025 21:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jSH7luUl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D42221A94F
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747690557; cv=none; b=hmCugwV0JOcaKyv+0kyy6drGSVe75zXRubCQ3Yaik2//Kw4Pp/yRAcc+5Ow3PYbD07Gfm3GZYz2+z3sSL+WpNLXXJCp/5kssq8H5VHAOJ6M4Ur7QIewij6YH9562Tu6TYTmXT11aZP0ouGBxjhQAJ+2h7JDLMMoBdkHh8+CxLhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747690557; c=relaxed/simple;
	bh=dKg/jr0cHTzLyQ6ISbi/aPiyKI+DqPULcYDVVVO7YA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/TqtVudWRbv8aT8BjtQ0ov3/4ht7EdGzZLSkmGTKFJNVOJbILlAV5QTQ+BHw1kH+j39z095RSwTqO7u2D/K6dCgAQ43oEttWZxRXuuehuPLp97HwOHmbPrQ51FeaWRYxN8ZdUlGKpgFeEOqYpd23XVHqcJl6NTdgslUzBmKX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jSH7luUl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b0d638e86so6870423e87.1
        for <linux-media@vger.kernel.org>; Mon, 19 May 2025 14:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747690552; x=1748295352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKg/jr0cHTzLyQ6ISbi/aPiyKI+DqPULcYDVVVO7YA4=;
        b=jSH7luUlooJnZHZOLP8x8LmJCkp7nnjuSIBj33XcQryJyf8MrjgIHlLFsHU+KFLfJZ
         Xga++5OtY+sMVPz/cQX1CB6738zH/54GS9Gz/7QRWrDCI7jsVYhNtNzCWDK27VtaZWWq
         Hc1+nw3AKkMzQ1KCpXIWPjrCuw7EvxD0pimM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747690552; x=1748295352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKg/jr0cHTzLyQ6ISbi/aPiyKI+DqPULcYDVVVO7YA4=;
        b=DvS0oZf0mNJooWuLZZ1rs6N72ssMkEfhs0DoNr54FRPY1GeRHEFOvg/LNkR3YV9mQa
         tjs958vu06ao5YvRrXuV2h75LhPH4X2ZfKtqllElLNMcKzMyHzqgT0AEdf4OdTGv7qUT
         +C40erUSPND8PaOQ/e0bzHtmpfKQVBWnxg/BqjVZUX0gC/X3RzjM2Un6NhuxhjO23Peb
         s7K+0XYWpd/bWFseTAmgEqwXHyisrq4HcQecGeoCw/YMeADi0ZNym/V/rjSx30vd0Ef5
         MKlwZA0Cpjv2dUKowrU46fmoOgITblrvZCzc7FMxpiDcwCJyD4CV4/JJSHfVwVowxa1m
         zMIA==
X-Gm-Message-State: AOJu0YydHLtiEaSDjLkvlHVkf47vDPiml+Id/bb0A3vOZ5UkxSh5tpKX
	kv8aYvKSKmbGl9vKjtc07eYXfu3YVqyaCTl6Coeum6kSfG6U0+rZ0enBOABpydjUXJQya46MPJI
	Dzsyrlg==
X-Gm-Gg: ASbGncuGcAcjNGhsYnogrk4NV5Yh4LhdjkLHEnKDPzZ+Hn2VJIPsbNwtYFO9FhUqOg3
	wa6LkyAATt3wVCXnM15wNnAiX6PBF6lLGJ2kezGsLa3n4G00drM4U2r1Hebfxm2aTZPY2yurwa/
	13pU98jLNKP1kEMhEU1tEzr+dL4AgnEoIGdFmm+MDIn/6HlPVC48I9IWFx3MkeEpH0ctDrVJ81Y
	ow6EcVu1tntltb/i9Dmy5qIkfwTWkB9JXaE5ZBq+TCvzaLNhPGosKps4Fm9swCU4OAQR0ZcLA0N
	zCfnYXKW1w6zAmDEqrse1t3uoNSeW1rlV99zA5uUuAw/+HIh4KyMzaOB35CoAwhomKWjQ+pPZXv
	lvtwq4mKi3oz3a9V0uTIE64Fb+hic
X-Google-Smtp-Source: AGHT+IF5QS7U1gQp5EK+mzkIOidbABryXRMKrOzop/Wz6dY8jIT2LyHp2h25jV47kd/TYq7foQHzgg==
X-Received: by 2002:a05:6512:10cc:b0:54f:c4e4:c288 with SMTP id 2adb3069b0e04-550e940acc9mr4013004e87.0.1747690552472;
        Mon, 19 May 2025 14:35:52 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702bb46sm2024134e87.168.2025.05.19.14.35.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 14:35:52 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso45007041fa.3
        for <linux-media@vger.kernel.org>; Mon, 19 May 2025 14:35:52 -0700 (PDT)
X-Received: by 2002:a05:651c:40d4:b0:329:1326:a3b7 with SMTP id
 38308e7fff4ca-3291326a4e9mr12891291fa.37.1747690551663; Mon, 19 May 2025
 14:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAME8Xxh9KhiWD3xu3O19Av6KWTsKa_eUT6q+Pk4ECMC3PQYWAw@mail.gmail.com>
In-Reply-To: <CAME8Xxh9KhiWD3xu3O19Av6KWTsKa_eUT6q+Pk4ECMC3PQYWAw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 19 May 2025 23:35:39 +0200
X-Gmail-Original-Message-ID: <CANiDSCtaRH7Oi4mDTg0Ptou=-SZwu_AiOJQBgYwRSncNUm-NqQ@mail.gmail.com>
X-Gm-Features: AX0GCFsvKhhebUcW4q4X-pSKrJtvewy6XEE3XH72lddzJikjCRzWUj5Bc30CA9E
Message-ID: <CANiDSCtaRH7Oi4mDTg0Ptou=-SZwu_AiOJQBgYwRSncNUm-NqQ@mail.gmail.com>
Subject: Re: Device not support on new Lenovo Legion laptop
To: Flavio F Lima <flavioislima@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Flavio

Thanks for the report

Could you try setting quirks to 16?

rmmod uvcvideo; modprobe uvcvideo quirks=3D16

And then retrying?

Regards

On Mon, 19 May 2025 at 22:18, Flavio F Lima <flavioislima@gmail.com> wrote:
>
> Hi!
>
> Thanks for working on the Linux UVC drivers.
> I am contacting you since I have a new Lenovo laptop and I am using it wi=
th OpenSuse Tumbleweed but the camera won't work at all. It simply stays bl=
ack on any app I open.
>
> So I found out about your website and followed the step-by-step to provid=
e the info so you folks can debug the issue.
>
> I am sending both the lsusb and the dmesg log attached.
> Let me know if you need any more info.
>
> Thanks!
>
> Fl=C3=A1vio F Lima



--=20
Ricardo Ribalda

