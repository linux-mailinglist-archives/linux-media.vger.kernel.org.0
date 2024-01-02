Return-Path: <linux-media+bounces-3142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC79821601
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE4481C20F1F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14DA38F;
	Tue,  2 Jan 2024 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6XuokBi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37000377
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67f85fe5632so65645126d6.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154968; x=1704759768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW52z5r4n+LGvICG8nTn+MMpQ4/ivy77JIAEZwyx8RM=;
        b=e6XuokBiNlrxHt3DwUCkgmbsV9xxMvumjD7akms+12Dt6D9iq/idhkrSRdMAF0lj3/
         RALNh/s6Wbnnvubb69DIjLmBKD9/9tqetD3ENtrkbA5PbNFjiB9ZcfFimgV3Wj0TTU3I
         pbhZSnR9EWY9Uu8weoRKDM4z5Wv0Tt5DJ9K2jG/EWEmWhxsgvzv2dV9obGvbDQEppWX0
         f40rNSl5Y5gQls9V/X68o2Gjg68zv27CjmSw4Ytd4F2acNFNUgmMFlD40I0X/FggiASQ
         w2dj263XjhWx4Ad62eOjX3ceM6cTcgAzir6RltJXVK+F30DIOZcHvjqbHif7osPsanFX
         vGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154968; x=1704759768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qW52z5r4n+LGvICG8nTn+MMpQ4/ivy77JIAEZwyx8RM=;
        b=N2gnd81MBVBADnTEiXegmcdoP1daGvSNEQOM4oOWq0bNVYDV4c4xH8IBGCTjzf+7WO
         VVLOg6r/fUCKM3QdU835hlhxU+2yZ6LZWPTbseFKhjozCxdUq/S9Tt/PNOXsmOWRxh2U
         yCDbCbNWqUbJ+znW7iyzfJo/XRwBoze7Xee9nVpa48+IdzxtB+HB/6q4PNC8fM2kEtdm
         acyIi3BWNUwFf0G33nRM6IjnucGBwFpe9NZPib+U/Yvf6y7IXNVXM5IZ7tE7hcV2adzH
         iJdS5LEt6/pyHtndf82/Mwh5bhpLMg1z9Ac0BwXi6RpNHwAV2UX2JVgAeNUxKuPyZl8O
         WbKQ==
X-Gm-Message-State: AOJu0YxB7+QWviIPU9wpFCPWOhnyhcjyM0WGNsDa5W8zCKnnHwmPrXpW
	ZelaR9cGPVZ06tnOSVVIiB1SZU/PSraOpw28ZCg=
X-Google-Smtp-Source: AGHT+IHZLfgCExJorugA2fJndb8mlKl1+np2mwUWGPpV92JEdmDVbXL3egn1ByENf1kxiLnhkDouGsqcLSoZUqCyK/Q=
X-Received: by 2002:a05:6214:258a:b0:67a:d843:e0d8 with SMTP id
 fq10-20020a056214258a00b0067ad843e0d8mr23674169qvb.18.1704154968115; Mon, 01
 Jan 2024 16:22:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-7-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:22:12 +0200
Message-ID: <CAHp75Vf6tpsJFO1Ds=SEUkuDi8gf2sk04oZTjCYgvOtt4JdG7g@mail.gmail.com>
Subject: Re: [PATCH 06/15] media: atomisp: Call pcim_enable_device() and
 pcim_iomap_regions() later
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> ATM the atomisp firmware is not available in linux-firmware,
> so most users will not have it installed.
>
> Move pcim_enable_device() and pcim_iomap_regions() down in
> atomisp_pci_probe() so that they are never called when the firmware
> is not there.
>
> This is a preparation patch for making the atomisp driver handle
> missing firmware better.

...

> -atomisp_dev_alloc_fail:
> -       pcim_iounmap_regions(pdev, BIT(ATOM_ISP_PCI_BAR));
> -
> -ioremap_fail:
>         return err;

Before this patch, can you drop these two labels as one is not doing
anything useful and the other diminishes the idea behind "m" (for
managed)?

--=20
With Best Regards,
Andy Shevchenko

