Return-Path: <linux-media+bounces-44733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B4BE3664
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC7E54EDCD2
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39CE32D444;
	Thu, 16 Oct 2025 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cU31ywAt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067A231A7F3
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618119; cv=none; b=nkGTZK56YiIvsBDjIwLw0NGvbZAwGDR/AKbEQU0+3AlvOsxqNWWDVIZwXqkwWW3R7s/TF5pLW8oaSzYvJp4sKyFISN11snwFNPbwqdsTIS59i7fKD/aKHOB3zxHYYv+TyODmXSJkw6uv5gcl6ykhvzUwpNaeKg71MkFqUctQiJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618119; c=relaxed/simple;
	bh=ev4xi92YkUrDcoVNL6uxLos7Y67B5zzgJ5jAk4NRFmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=au/wCdwiQxRmAoTdeFohmLIrmTV4pcORJJs2QUVQTkAIyqzzQg46I+hEdpQM5BN4FhBl2I/ZcCQkPxIqIbaaXZz2ZnRyNVQ+QYCwY/NPvuUvIMgKy1gk/QLyjGJUh9DvYaJ9HqfBrdwuAEwiaOPGTvAUCUV4Rt23nRYOOvow290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cU31ywAt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA41C116C6
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760618118;
	bh=ev4xi92YkUrDcoVNL6uxLos7Y67B5zzgJ5jAk4NRFmA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cU31ywAteN8XZ2PzuJZAvKfdJILTDrUSQ/kml3bI1A2vyOtbWOsL0Fpt9GbCsNp3m
	 CLyiryM4DQhHfae/yRTDbZOLZ3vD6ghQV+2g8FFTVXlO7NdskCgGru1H0eotHlWdja
	 Pu5z2ZjW4D/XxVBy6FMvYJg/dbVlt2osWef5TH3Yo74MmcSVJ9SYM19TepJNvnW87h
	 qiNfytimFYr6GV0jMPQ6Tl5rvWvR0L8XZzttF7kx/MgouC5wkAcsiAamUy1t/swHrK
	 rpQwGpfGaAb98PcmBrTcwuUF6dTAWPG9l0rtYqxtRsbcpx5nFCwF3Zgd8wg/pw8o2A
	 Kk9KUzkcQqzVg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3c2db014easo153965966b.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 05:35:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXCDmILj9+bhxt8BwFGYQJlMYxKqT9F5U6f1rJhP00HrPf6JkLYl83f00rEGd/lcBGhnON6kIDgPMIFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQR35xEjF8TBbh0PTq7D8L5z9DU3aJtS5YfjwsLTr3zqwbU4SE
	11Khov+Iys8DWEiHcwvvaM7avqkhT9FuCSFcQ+R4oBzvDsUqS5OT1vE+NoxE50fos16doz5U/QX
	rkcQdcN0Ev+HAXRXnXX8/FjN0XHjAfg==
X-Google-Smtp-Source: AGHT+IF09IaTWh5hPMByGEhJhbB7ubCMKkjb0+VywtvJIMXMIb9+PKxQo3yMI16LEly4MkZbwkJSOQahzjMiqRuOFZw=
X-Received: by 2002:a17:907:9706:b0:b39:57ab:ec18 with SMTP id
 a640c23a62f3a-b50abfd5472mr3466409966b.45.1760618117323; Thu, 16 Oct 2025
 05:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org> <20251015-ethos-v4-2-81025a3dcbf3@kernel.org>
 <aO/4cQ8+eLnwqFSh@lizhi-Precision-Tower-5810> <CAL_Jsq+L2RHgP9FaEpxzzVRybyjeNr84xgEBbU4KEyZtrz63FA@mail.gmail.com>
 <aPAL67Oct5yJv8/d@lizhi-Precision-Tower-5810>
In-Reply-To: <aPAL67Oct5yJv8/d@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Oct 2025 07:35:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+sEYztJKdD0t8uPwwv1uKk_tac3MqQMUgxfrRjRZmz4A@mail.gmail.com>
X-Gm-Features: AS18NWAqGcCvN_8PgOdkGiiyBvIwDxdosaOdIF4pUQJKs-MAlM8rA_NiueiqS1k
Message-ID: <CAL_Jsq+sEYztJKdD0t8uPwwv1uKk_tac3MqQMUgxfrRjRZmz4A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] accel: Add Arm Ethos-U NPU driver
To: Frank Li <Frank.li@nxp.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
	Daniel Stone <daniel@fooishbar.org>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:02=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Oct 15, 2025 at 03:36:05PM -0500, Rob Herring wrote:
> > On Wed, Oct 15, 2025 at 2:39=E2=80=AFPM Frank Li <Frank.li@nxp.com> wro=
te:
> > >
> > > On Wed, Oct 15, 2025 at 12:47:40PM -0500, Rob Herring (Arm) wrote:
> > > > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > > > relatively simple interface with single command stream to describe
> > > > buffers, operation settings, and network operations. It supports up=
 to 8
> > > > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > > > are designed to use an SRAM for scratch memory. Region 2 is reserve=
d
> > > > for SRAM (like the downstream driver stack and compiler). Userspace
> > > > doesn't need access to the SRAM.

> > > > +static int ethosu_init(struct ethosu_device *ethosudev)
> > > > +{
> > > > +     int ret;
> > > > +     u32 id, config;
> > > > +
> > > > +     ret =3D devm_pm_runtime_enable(ethosudev->base.dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D pm_runtime_resume_and_get(ethosudev->base.dev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > > > +     pm_runtime_use_autosuspend(ethosudev->base.dev);
> > > > +
> > > > +     /* If PM is disabled, we need to call ethosu_device_resume() =
manually. */
> > > > +     if (!IS_ENABLED(CONFIG_PM)) {
> > > > +             ret =3D ethosu_device_resume(ethosudev->base.dev);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > >
> > > I think it should call ethosu_device_resume() unconditional before
> > > devm_pm_runtime_enable();
> > >
> > > ethosu_device_resume();
> > > pm_runtime_set_active();
> > > pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
> > > devm_pm_runtime_enable();
> >
> > Why do you think this? Does this do a get?
> >
> > I don't think it is good to call the resume hook on our own, but we
> > have no choice with !CONFIG_PM. With CONFIG_PM, we should only use the
> > pm_runtime API.
>
> Enable clock and do some init work at probe() is quite common. But I neve=
r
> seen IS_ENABLED(CONFIG_PM) check. It is quite weird and not necessary to
> check CONFIG_PM flags. The most CONFIG_PM is enabled, so the branch !CONF=
IG_PM
> almost never tested.

Okay, I get what you meant.

>
> probe()
> {
>         devm_clk_bulk_get_all_enabled();
>
>         ... did some init work
>
>         pm_runtime_set_active();
>         devm_pm_runtime_enable();
>
>         ...
>         pm_runtime_put_autosuspend(ethosudev->base.dev);
> }

I think we still need a pm_runtime_get_noresume() in here since we do
a put later on. Here's what I have now:

    ret =3D ethosu_device_resume(ethosudev->base.dev);
    if (ret)
        return ret;

    pm_runtime_set_autosuspend_delay(ethosudev->base.dev, 50);
    pm_runtime_use_autosuspend(ethosudev->base.dev);
    ret =3D devm_pm_runtime_set_active_enabled(ethosudev->base.dev);
    if (ret)
        return ret;
    pm_runtime_get_noresume(ethosudev->base.dev);


Rob

