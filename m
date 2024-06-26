Return-Path: <linux-media+bounces-14168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C04917EE0
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 12:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C989C1C2151D
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 10:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D584517D356;
	Wed, 26 Jun 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoTanZ/j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6CC13A26F;
	Wed, 26 Jun 2024 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719399041; cv=none; b=urKntrAi7TKoMNLybwxWrliumKz18vr1CYZJeuOj6EYMILK9+KLMY6GQFOjc4hukBnqmAd00tMfvlMOl2IbPX1L9s+qcC4kunDgknDL1KGZeXlow9WQ8Cp5HEzrcyq63YQv4a+ktFEsQ2Wx8QmHWEpbs0bds1MZPhGNokWTDyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719399041; c=relaxed/simple;
	bh=Nhxq8J22maEd7Tggpjfv1hTvgHfsAmvbZS82KOa+e/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2NS2z5lRYjGQkP+LuRZ3yf6hAn7naRtybcCXwutA0AhrcTzYb4W/SZIll6mB+lzKaNtYy2092Eu5+SflCQhysmkj4TNKLQKeps9wgixVmN1fa53vlY7TP4sPK992n2lHQ9SeN26abC2wgprqoXJvR5RxqNTQoOTnzfdlPYnWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoTanZ/j; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso79844741fa.0;
        Wed, 26 Jun 2024 03:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719399038; x=1720003838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nhxq8J22maEd7Tggpjfv1hTvgHfsAmvbZS82KOa+e/k=;
        b=RoTanZ/jyd30r9jBjmJfdpAiKPA1CgxjjOwh+GV91OqFH4qjK92+2BV4819rVaxDEP
         AUXNl3+OjwvifhaiNqkOC7x0qdQBySpbn9winJ5kO0wCU8d4EnUD3qy7h5fOnFsUl2+a
         3jZRGJyKXW+A4z+QIQ5TVz88cPoCmM0nSJrYwvjub0VBlHq5XCvPQZbJfIImKaLj1X72
         DGK2TC9nqwbUZUpne0paOvRSRa0HM1kYBo3u2r30e31Eb1scdZikxpcfWKaiBZne0B5M
         w8+zS/04mxTGUj6BF8/fc1DdmuehTJcl0B9onm0JwZfOibkpYLcjiHAUSS974r0RwvE4
         N8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719399038; x=1720003838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nhxq8J22maEd7Tggpjfv1hTvgHfsAmvbZS82KOa+e/k=;
        b=PcREWWLQNLLA4u7BBGTV1+7dFJAYiH+e3kRONC0lRYSK37if2vsl6zTN4JEU0QxCEM
         WIW4nCcK/NV1rnZemb404zHZnuKlTWTnnLgHyQ5fob374sZyVeN674jgTI4xAByvFggK
         C2Oz8K4z0B4669f0nfUykOQjFibUX4nL39YJOcZUvICH7avpC8Wx1yIrFNNOek1x535w
         J/wATTWrcG3zizQhtMkNR4DnOJTbv7AIgyYqTT1u/mUVT3XSfuSOeLUHVmnSPqvmhbfB
         Sgu6QofA/Qw85ryuo/lXDvR01cnfW+eSp7FzPNh2BlbTRaJpDDI42VckN7hHQ7OnW9+D
         xRaA==
X-Forwarded-Encrypted: i=1; AJvYcCWPzQ/fVLKVV3Pr2u8K24Rp+DQ31WQLSUa4N9yKYANwvwbWuMifjrWEQbVWIhu7gMNkx2isEUAnUW1CaEiyqHnhW5CY8uV7fsu+CuIb/rktzl1c1m9la+Cb49c713Ye/kKnA74xCE/KEifh4qvzylxM4oDga1zWBGDs8BXF6JxWIvsg1R2HrXyXISFGcA7vCk9Zoy8onCgQgPRB0NlOT8QxUgElVA==
X-Gm-Message-State: AOJu0YyQTsLGOv1JW85M7JdfkFjjVYm5xRCPhV7Cn2mOnrCwnL11GDvI
	A51iS0Of7DqVKtnDGF6fSY9qExwJnRmmQzd50hmEsZZz/uwoJoKCxMO0Qo7PMU3oMFYS38P+6c2
	02w3mvHPW7FPAmZex/yda6ZV0hZA=
X-Google-Smtp-Source: AGHT+IEzpWzUx+9sNDvROX+c/vTLDyxb0PHt0OT6ZaCeex1LDL7R1aTIDHu9u7EiPMNnUygtmqVi0YGK9vKN4DrqFlo=
X-Received: by 2002:a2e:9bca:0:b0:2eb:e634:fee6 with SMTP id
 38308e7fff4ca-2ec5797a56emr69286531fa.18.1719399037471; Wed, 26 Jun 2024
 03:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-5-89ece6471431@gmail.com> <47997e61-26e5-4643-ac69-17db09be9bb1@linaro.org>
 <6a8b1bd1-8413-41f7-8889-7f4d42ce0d6d@linaro.org> <CADgMGSt0NiJAHSneYS8AXvDqKHsscvxW50tdxAYYOofpEgeofA@mail.gmail.com>
In-Reply-To: <CADgMGSt0NiJAHSneYS8AXvDqKHsscvxW50tdxAYYOofpEgeofA@mail.gmail.com>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 18:50:24 +0800
Message-ID: <CADgMGSuqUCrA4+yt1yLGACDPVARpavWUSGV2f1MGrv5rn_Xavg@mail.gmail.com>
Subject: Re: [PATCH RFT v3 5/5] arm64: dts: qcom: sc7180: camss: Add CAMSS
 block definition
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 1:53=E2=80=AFPM george chan <gchan9527@gmail.com> w=
rote:
>
> On Wed, Jun 26, 2024 at 7:52=E2=80=AFAM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > On 26/06/2024 00:49, Bryan O'Donoghue wrote:
> > > Where is the CCI and sensor stuff - could you post a link to your
> > > working kernel tree in your next cover letter ?
> >
> > Found it
> >
> > https://github.com/torvalds/linux/commit/441ebc3a8948e03a1115dc6710e951=
9a2594d0ae#diff-4b55839d42d3ffb773ac6d1babc9aa66dc2b9b11b346caea5d2d3ffb6ee=
900e5
> >
> > ---
> > bod
> Ah, i found that camss branch is overridden by clean patches on the
> last commit, let me re-add the camera board dts too.

Hi dev,

Here is an all-in-one merged work tree. github action compiles fine.
https://github.com/99degree/linux/tree/next-20240626

My test phone is nearly EOL mainly due to the battery expanding risk.
Interested developers please find the above tree useful. Feel free to
let me know if there is any missing info.

Good luck and thx guys for delivering a world class kernel for us..

Best regards,
George

