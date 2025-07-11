Return-Path: <linux-media+bounces-37525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66CBB02223
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 18:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F485A250D
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 16:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107582EF65F;
	Fri, 11 Jul 2025 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="e/mk2M0G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EA6944E
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 16:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752252362; cv=none; b=kZGoiln+ZWhSx4iQPAPXVmP8NBXhovF0dq3MfS7QlkJcXYuu89duRQpmEEmhs2NNTQWZuTtVej8/9kEN6OfEu11E5vHUOslii0GQN/ZNqZsZjIgEmp+f0JU3hRwFOQkQ/A3DMmOzNBDhfqSH/Oziyt7+toDdu99SE5UDTNNLuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752252362; c=relaxed/simple;
	bh=/lyNWm+N+92DlLe9EWHRgcUgtDsWEk9hDtMlng2SaeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9BEznw1N2+J3SjkRuMjIRbK9mzMvgt837znXE53Q51NXMJ1ULryUDXA4UyIpq/5WdxVItzB+GgXfMjq8dDoDB9W+cg2cZhkqrOd8WHSz2lJ9Br3tf9tKKC+T0y66MpclvsoqjW9aM2eLfxBJJp5c3Ag8Sz8m8H8c38NagSUArQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=e/mk2M0G; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-713fba639f3so21770967b3.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752252360; x=1752857160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVqtR2y37+fGKASYTrCFwyYcRTeea2/g0YbtiZzMR3k=;
        b=e/mk2M0Gnw6N5eTQA9mVBaXVXaZOlOXeX7Y55QGHvH8Fe/wKasuVUY9xDbcxtrNosR
         2URQc8f1MQhHua90PvS6R7ACUnBzXG1Pa5xW3IttSz8WeDjKx09s4b8mPU3VvfWePB1J
         K+wRp7D0qr34Tw/o2bfXx/5G3Ym2VhE82ZQEeSvwlrf20qyMxFsem2Z+tUK4yK+jsSnh
         hie9HzaiVz5HD8Ev0mLO4DbaUFsDaHt/NR/rPHBcu/Jznm4kY/wF+OBEyQxnUP4Oinha
         Ydj6uERz5bMR/kKOZ021x2kcWOE3eOJgqcN/5aKqI9sHwMbab//dFrrT9l9sCbk2MV6q
         JGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752252360; x=1752857160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVqtR2y37+fGKASYTrCFwyYcRTeea2/g0YbtiZzMR3k=;
        b=erV8gCWhvjVDNAYnzTwUX9gPYoJltCvpGD9ywx1KNmmQAlRGowKGBNA0978BJCmTxQ
         AouUnE6fr/8ngOVoZts/dGhrRN/p6UdEYMlhILZFAI2TlWvtG0AhmPfk+Ler3YZZr61B
         hnOmzVBvwml409nMqovcA+aGlRUJ06LgYK3k/d97HFFaZ1yPAanziwHaz5qHIYGOqmOj
         LKNNX7RFG2dwcbSI9W2ILvIpP/XHfaaH107/da8sD9jtDE+An9Wrw29U7Ki0l+79Piz5
         BZNDGDejWrtjeCLT4JNO/24FnA4wpSfZXJI9ZpOjg0xpM7og0DIA9utmy747LB3q6pkF
         EefQ==
X-Forwarded-Encrypted: i=1; AJvYcCXodDeUwqWfc3+WIQsIlPgZTN8b+AIJEddxeOBe8+7jZBA9MEIyfYCdXw6CECCHTOLKr87QSF8J1iCuxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbn148LCKuxssntRSbdMAk/xNLFNLqflz94xH4gVrZfsbeMly7
	VPsXFsdvOd+2gA0CDFYkjB5CrclrnRWYfyiK2+6OwVT0m/Lh2+QQm8LprNaRts6fx9u5ewyUBZk
	0ozjxi1ihOA==
X-Gm-Gg: ASbGncsJkxaQQ7/hR3qUyOUL8rKDr+EvP5Yk+kyQv81UMU9TN/V550rMoEmE4HRHtR8
	xx74dgHJHqi7eP7dVGRAOYf2FXM2dPkgdK7pHAyZ+Jbig8kpj0JwQkkJ1Z9xZqdbQ/fQCbHv74u
	eqsZXwlLhXwxVn7bs2sIW9dmQtkQoNt1DtLQGo4+4iA+tvl7WkOz/dKonfTjQyPG1jMm1Hw+BUL
	2uDwg0U/TxUmElfi5KAJJV29WUhScSMiKLh5HEy3oJp5PjH8rGvjx7t5qwSXDweDDVPdB7elNgG
	YoMy2FaMUutgVOA1INkOiJlBXj+237wDgWoP8P2k3XHJ4WIrkumLws9CuiSx3W9y3X490ajZjEm
	qNraM2NpuX3JLC2HI74bgUuu2PRPfG4zcPW+rYx5QxjZhI3O15OOFfTnnFxpYW7UuSw==
X-Google-Smtp-Source: AGHT+IFq8mDE8PudB+If0p/yz9r5BMm3b0sAMcM401GT4XSFuAGCatql+fXY5z//W9+Ngzp3GWU/hg==
X-Received: by 2002:a05:690c:45c2:b0:70e:7503:1181 with SMTP id 00721157ae682-717d5e944a0mr69820747b3.18.1752252359978;
        Fri, 11 Jul 2025 09:45:59 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8b7ae26c85sm1216180276.7.2025.07.11.09.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:45:59 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e81f311a86fso2092861276.3;
        Fri, 11 Jul 2025 09:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOR5hTHgAwiY5xeogRVxrriILkAAQY3hgd7EO0OCBaD93pSwQIsLRh98I+HKPM34Xn395md2m8mbpXsqM=@vger.kernel.org, AJvYcCXiMcZov/rhk4piecetDTfgSQx9HtN/TnV3iTn7Sf8mew6kB8U0iUNow48MiyoWcufNBn7Pukpdp3qy@vger.kernel.org, AJvYcCXslclD+Zm1wiY9+vBWQSe9u5GfkcE3t5LrtMJuGfhZkmKDjwfI6470H2dkiLDqSahweXrfDQvdMA4zbER3@vger.kernel.org, AJvYcCXtCSrLKC1bu8u13cJo2KD2wAIDNbWzDsxTpaWVTiALo/xH7ioNyVjtFgJwIO+0+kWh+fDuT3pLp7/C@vger.kernel.org
X-Received: by 2002:a05:690c:fc9:b0:711:406f:7735 with SMTP id
 00721157ae682-717d5d7b900mr75779167b3.13.1752252358549; Fri, 11 Jul 2025
 09:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-4-dc16cfe6fe4e@tomeuvizoso.net> <fcb3ca23-7ebd-4f48-92d2-969b24936b9b@arm.com>
 <CAAObsKBiSX0HcxJJjTNGgE4FD4eAYW5wvY=bROtdkZ1mqf_0VQ@mail.gmail.com> <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
In-Reply-To: <a1a93c41-4c21-4b7a-a8b8-5d4e83d73931@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 11 Jul 2025 18:45:46 +0200
X-Gmail-Original-Message-ID: <CAAObsKAgmDANvWop-GRAqE6eFRHeQiVHkF1nSwEqyWWY=mdRfg@mail.gmail.com>
X-Gm-Features: Ac12FXx7z145GnPjkDCiCeIztHHyJGSgIFJExInPlpkFTI1qLEtbnsvv5usQDuA
Message-ID: <CAAObsKAgmDANvWop-GRAqE6eFRHeQiVHkF1nSwEqyWWY=mdRfg@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] accel/rocket: Add job submission IOCTL
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 6:40=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 11/07/2025 5:00 pm, Tomeu Vizoso wrote:
> > On Tue, Jun 24, 2025 at 3:50=E2=80=AFPM Robin Murphy <robin.murphy@arm.=
com> wrote:
> >>
> >> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> >> [...]
> >>> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/roc=
ket/rocket_device.h
> >>> index 10acfe8534f00a7985d40a93f4b2f7f69d43caee..50e46f0516bd1615b5f82=
6c5002a6c0ecbf9aed4 100644
> >>> --- a/drivers/accel/rocket/rocket_device.h
> >>> +++ b/drivers/accel/rocket/rocket_device.h
> >>> @@ -13,6 +13,8 @@
> >>>    struct rocket_device {
> >>>        struct drm_device ddev;
> >>>
> >>> +     struct mutex sched_lock;
> >>> +
> >>>        struct mutex iommu_lock;
> >>
> >> Just realised I missed this in the last patch, but iommu_lock appears =
to
> >> be completely unnecessary now.
> >>
> >>>        struct rocket_core *cores;
> >> [...]
> >>> +static void rocket_job_hw_submit(struct rocket_core *core, struct ro=
cket_job *job)
> >>> +{
> >>> +     struct rocket_task *task;
> >>> +     bool task_pp_en =3D 1;
> >>> +     bool task_count =3D 1;
> >>> +
> >>> +     /* GO ! */
> >>> +
> >>> +     /* Don't queue the job if a reset is in progress */
> >>> +     if (atomic_read(&core->reset.pending))
> >>> +             return;
> >>> +
> >>> +     task =3D &job->tasks[job->next_task_idx];
> >>> +     job->next_task_idx++;
> >>> +
> >>> +     rocket_pc_writel(core, BASE_ADDRESS, 0x1);
> >>> +
> >>> +     rocket_cna_writel(core, S_POINTER, 0xe + 0x10000000 * core->ind=
ex);
> >>> +     rocket_core_writel(core, S_POINTER, 0xe + 0x10000000 * core->in=
dex);
> >>
> >> Those really look like bitfield operations rather than actual arithmet=
ic
> >> to me.
> >>
> >>> +
> >>> +     rocket_pc_writel(core, BASE_ADDRESS, task->regcmd);
> >>
> >> I don't see how regcmd is created (I guess that's in userspace?), but
> >> given that it's explicitly u64 all the way through - and especially
> >> since you claim to support 40-bit DMA addresses - it definitely seems
> >> suspicious that the upper 32 bits never seem to be consumed anywhere :=
/
> >
> > Yeah, but there's no other register for BASE_ADDRESS address in the TRM=
.
>
> That only reaffirms the question then - if this value is only ever
> written verbatim to a 32-bit register, why is it 64-bit?

Ah, sure, it will be 32-bit in v8.

Thanks,

Tomeu

> Thanks,
> Robin.

