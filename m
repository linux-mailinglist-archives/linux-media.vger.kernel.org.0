Return-Path: <linux-media+bounces-43431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF0BAEB8B
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 00:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C048E1922702
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 22:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771652D1F7B;
	Tue, 30 Sep 2025 22:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9rHi+jt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58972C235F
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759273159; cv=none; b=NUGXVBQHy66gVDPoEE8Z5q+W2Ryk4r9oKf4hZnPBIyJa2UR0S7tK0zzjHw9fsIWkt/RXf5fIubZGaxXBmmcPtQCnlDN7AsJgsntZv6ZP9joN4qObWQwUBCgeD9VLV5XB3vZ7pJxpmJBwXSTBZsPj+QIT7YZIHaJIN7esI9H/LI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759273159; c=relaxed/simple;
	bh=pZbH7LPZiV6YQRsuN23fRTyE9NZC7LXkXRPWHo3BLe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alMc31g3kM9+GMOPNRbu3XcdrlMQV7BbUIluJF6EqvGm+o419tMqFsgsZxLQkY/9eFF/gfoijeHEAceM3xNLIJXnfa4jBmMqrsQ5301qfu9Sf8rEOTc4pBwn8yZrq5Ar46jVWN7UrEn/Z1ODqDiT/rJLva1cnl0nbBftzZCxNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9rHi+jt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77994C19423
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759273159;
	bh=pZbH7LPZiV6YQRsuN23fRTyE9NZC7LXkXRPWHo3BLe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h9rHi+jt8NsmaTS0OJF+mP5P2Y0zeOkF8evYC2568+HLe7liiEH3Jahjstgmmo2Pg
	 nxd5G6ngtw3Xt8rbRgvDOHmR9sR5U5BceKMZjr9GRYRDBrqg7K4lE2OCr59GBhLGIG
	 fFe1LkCKT3ER/mvlpsjXzGuCD4JLgRUjrIZA9rH+fJLLLk9Gw4oE41rwfcE7wOgq46
	 YWMDVJ0iKNazX2s3s7tLrOE69GfYuG/pXM72MpkVgp5CVyIHbc8Jl1kl2+YA7qIKN/
	 N8uw+D5FCwCjaV7Mln/ro2DtvL7SQ5XeMH75hSlCOGjx+NF8fWEbXox7zn4+csg818
	 b+sZaEDB3bxwQ==
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27c369f8986so63156465ad.3
        for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 15:59:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV45ovBfSfyT04VbKz5hiNDo8VkPq3TCzrfhd2AJG2ANS4XPCaR4Z+wG0nMCDpJVMj3vO67TpvK6ZrS6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/GLkm4+GeGK2Z+r095gU7Wc1oKiVsslqA1JL3KHx65ah0I6QG
	QGyRmf731KTT3VJlIX9i7sCYCRXK1+MwnUFc8PYD/nsYnbZhbToWJ6wp34YsrRlJ0kIT9UFTdFe
	eAJoqbb4/0dm9whGOsyS2LL488fAnYNQ=
X-Google-Smtp-Source: AGHT+IEjOJY+T/R5p0HUNzDJbvMSExqfd4Zm4zKN7PDOWoXwQsAkRMa1cPIdhvK5mllhEGX7uEeioJja0ynGdTlQ21Y=
X-Received: by 2002:a17:902:dad2:b0:269:8c12:909a with SMTP id
 d9443c01a7336-28e7f31167dmr15520695ad.31.1759273158970; Tue, 30 Sep 2025
 15:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-9-h.dewangan@samsung.com>
 <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com> <75d06769-4896-4095-9969-03a517705196@samsung.com>
In-Reply-To: <75d06769-4896-4095-9969-03a517705196@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 1 Oct 2025 07:59:07 +0900
X-Gmail-Original-Message-ID: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
X-Gm-Features: AS18NWAOxLyorh9QMzb_rAtOLuensrQj-n9XXTXgykqSdy5eNYjdJBLoFkIMVc8
Message-ID: <CAJKOXPe0kGFoUxOGupwD_rSshTBVFhH3184xOH=NquSGn2QxcQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08=2F29=5D_media=3A_mfc=3A_Add_Exynos=E2=80=91MFC_drive?=
	=?UTF-8?Q?r_probe_support?=
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Himanshu Dewangan <h.dewangan@samsung.com>, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, alim.akhtar@samsung.com, manjun@samsung.com, 
	nagaraju.s@samsung.com, ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Oct 2025 at 00:46, Marek Szyprowski <m.szyprowski@samsung.com> wr=
ote:
>
> Hi Krzysztof,
>
> On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> > On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.co=
m> wrote:
> >> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
> >>
> >> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
> >> Exynos MFC driver that supports firmware version=E2=80=AF13 and later.
> >> Extend the top=E2=80=91level Samsung platform Kconfig to disable the l=
egacy
> >> S5P=E2=80=91MFC driver when its firmware version is >=E2=80=AFv12 and =
to select the
> >> new Exynos=E2=80=91MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not e=
nabled.
> >>
> >> Add exynos-mfc Kconfig and Makefile for probe functionality and creati=
on
> >> of decoder and encoder device files by registering the driver object
> >> exynos_mfc.o and other relevant source files.
> >>
> >> Provide header files mfc_core_ops.h and mfc_rm.h containing core
> >>    operation prototypes, resource=E2=80=91manager helpers,
> >>    and core=E2=80=91selection utilities.
> >>
> >> Add a configurable option MFC_USE_COREDUMP to enable core=E2=80=91dump
> >> support for debugging MFC errors.
> >>
> >> These changes bring support for newer Exynos=E2=80=91based MFC hardwar=
e,
> >> cleanly separate it from the legacy S5P=E2=80=91MFC driver, and lay th=
e
> >> groundwork for future feature development and debugging.
> >>
> > No, NAK. Existing driver is well tested and already used on newest
> > Exynos SoC, so all this new driver is exactly how you should not work
> > in upstream. You need to integrate into existing driver.
> >
> > Samsung received this review multiple times already.
>
> Please don't be so categorical. The MFC hardware evolved quite a bit
> from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed.
> The feature list of the new hardware hardly matches those and I really
> don't see the reason for forcing support for so different hardware in a
> single driver. Sometimes it is easier just to have 2 separate drivers if
> the common part is just the acronym in the hardware block name...
>

I know it is easier for Samsung to write new driver, but this should
answer to - why the maintainers and the community would like to
maintain two drivers. Sure, make a case why we would like to take this
code.

The easiest argument here why we wouldn't is: new vendor downstream
code means replicating all known issues, old coding style, everything
which we already fixed and changed.

