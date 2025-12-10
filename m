Return-Path: <linux-media+bounces-48565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A27CB351C
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 16:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 252BC30309FA
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 15:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD0B311967;
	Wed, 10 Dec 2025 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SMSbIc5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5F2EBBB4
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380630; cv=none; b=CUMpJwSkLjdvzaAHwvi6ZYaZla9gy5IIEU9SoQ/FDkHqB+nZBFJr5qoHIkktMrMOidkCq3SS2kiTnPvstdiuUWJynlJiKMqZhh5iG47/BWDO7a3MaIaHyRL3knwUNI/lZUfjzC5JTA1hWfUmaWnQjpJOGYtbQutW4RlubhE7xoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380630; c=relaxed/simple;
	bh=3oM7C5JKk0bBzWgIUK1EKF/80L5/WNgj6mhCv2v/NwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/L1SHbQ0KhVF8p5jd72yCUbj5FWFH3HoRbWQw9nidezJ/o2o6l69bdY4Rpox1VT8dfljUsvWYyq0arNcqBYjO+anjTZDH6usYojI6HRxefnga1zK6RCiiLZG1mSInqFlJ8tqmf3NSjNKfaWBzwSMjrS+Lw6LjuKtbQiL9m0m18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SMSbIc5Y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5957ac0efc2so7856952e87.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 07:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765380626; x=1765985426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oM7C5JKk0bBzWgIUK1EKF/80L5/WNgj6mhCv2v/NwU=;
        b=SMSbIc5YKU768ausIWGBzE0R9YlGBw3rOnSKMQKEuy6AUWvTI3trDUzoP4FswyHiJw
         qk6e70I5OjUZ8FB6XUmysukvUBOAJMGe4gW+m0sd/ny4iMXO1E86w2vlZdtI4wcuiJcJ
         MdlTny+y2S8uxDx5HbRjJnITD3OToIQmUxt2pro6hcOTEFEGnIPG2ukA2APUTbWIlaNY
         4lCgZTGsbLExKPQ4uo53zMR9wnrTPRTGVVst49ON6IVeJMBtC76mkt2KBT0lw6x5Y4oc
         2n+FeM1cK+xWs+MeWnoTGUqvGSt5PEGrU/Agb9eJkI/0Rd5DUblTFhXmjPHDRQAtHiiC
         XXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765380626; x=1765985426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oM7C5JKk0bBzWgIUK1EKF/80L5/WNgj6mhCv2v/NwU=;
        b=BSwppDE4IZg7dbsegy7bt3nrAGSbO1NS2ZYT9pybus4FvpkgAhg7Lt/3lyxzIvKr0u
         k6kFkE3uOm5H2QDr3KTOH2miHy8w5XOnBnjQZfwGdjFIVYSmyddeN4DNDCiRmwgtWHWR
         aIRqzRPM5t6bfabiIoI/rzX6Py2+aMH0EhbKUVzOq/0HBRG8wrE2fcvhubTKnSi1Hiq4
         xzWLRx0eLy2YejggI6aJfgS/loTlmHvGAMfU9j/EF320tcAUDd6VDwgHrly/iLHUJkWF
         2cwhZV+SWUyaAmAdMQNo4JWFvF6utfTmTuj/LHkdlXnueQj9w8WJhoiUPcIwvpf1+jB3
         Ufxg==
X-Forwarded-Encrypted: i=1; AJvYcCUt+FUZm0Ny8F6K17dEyfaaW6vdH0+o+HD4LfepFWVcCJQ721+91W9b4tU39saLSilNrgwtPVdcFNHq0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnQH1dWbwx10Fy+zQHO2hmUNhCsUWOzupuBsJyjEq8qfSsDDK
	3OhTgmvCqA0CmujesfLLPeVhu1O+f3DLISDJKPD2RrRBWQoEoGr3RKwBwH00uWDqd5KziD6f+uW
	gLqaYXflvGgnaqODr7k4lMGXZawUQv8h1t0PUXaDbsw==
X-Gm-Gg: AY/fxX5O+g9QONQ6BaNBmLfBU/TD3CBxJe95Q4zyX5R4DjzTuWpCmS1h+NIGaNT7Mt9
	ydWRX7UvfjThH3jDOns51wiyiYGaUpdPmgG0ycdlEVRcBtCzX76yrlSNESJXoxBbcaRApCwYrmz
	bIMxosaDg2ClOOokicxFMuQAjD/IRNTHvPAun82Gg8BAw6x17NMvA3s64wj0vUzDI/tEj8KKP0Q
	D7SQDx/pImT8MGtpr8uWDxP966ikHyDm3Pr6s3bX31oqquf2bHGx/EVcSws5p5wxcWJR/RoQXTa
	oJfn17mzAAI3u6BG2iPNER/orxBP
X-Google-Smtp-Source: AGHT+IEYPLumSLiqv9vm35UuD54sgjwSHWM6ebmAu9tuA8+ywHCPfhWkSszStzlqK4kPNAby2b3RcjziCDgwx+M2Kvw=
X-Received: by 2002:a05:6512:15a8:b0:595:81c2:9920 with SMTP id
 2adb3069b0e04-598ee4dbebdmr1141791e87.27.1765380626523; Wed, 10 Dec 2025
 07:30:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141303.223254-1-marco.crivellari@suse.com> <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
In-Reply-To: <7e24110636db36e8c0a877d90d2ed9570c4aecf5.camel@ndufresne.ca>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 10 Dec 2025 16:30:15 +0100
X-Gm-Features: AQt7F2pXItH5geVIbULqaw0IgXchV7ZnVe5Ou6Cc5C27xz9gAGtwoAoMzdHRMko
Message-ID: <CAAofZF44pUoyDPnnv9UUuMkYvqiSWP4gELg4rutgo=3tNpBZsw@mail.gmail.com>
Subject: Re: [PATCH] media: platform: mtk-mdp3: add WQ_PERCPU to
 alloc_workqueue users
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 9:57=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne.=
ca> wrote:
>
> Hi,
> I have to admit, there is likely no review here due to the lack of knowle=
dge, so
> in order to help educate myself (hopefully its not just me), can you expl=
ain why
> the new default of WQ_UNBOUND would not be a fit for this driver ? After =
all,
> the author didn't care and didn't make a choice, so I feel like its worth
> asking.

Hi Nicolas,

The fact is that "alloc_workqueue()" without WQ_UNBOUND it means per-cpu.
So what we are doing here is just make explicit that the workqueue is per-c=
pu.

Currently there are no behavioral changes in alloc_workqueue(); in a
future release
WQ_UNBOUND will be removed and unbound will be the default. But as for now,
it is still per-cpu.

We can of course change the current behavior and I can send the v2 with
WQ_UNBOUND instead. Looking at the code there are not per-cpu variable and
the workqueue does not have the WQ_BH flag, so we can convert it if it
is better.

Thanks!

--

Marco Crivellari

L3 Support Engineer

