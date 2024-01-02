Return-Path: <linux-media+bounces-3141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5D821600
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A19911F21557
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44BA379;
	Tue,  2 Jan 2024 00:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz8xdXew"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1169C360
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78160ce40ceso288021485a.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704154827; x=1704759627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTaEp3XVmk5hBWJHtuJ1RqHFEs+keboZK7LqcHaxz3c=;
        b=Xz8xdXewsqY++x9AbToQn/sL7BNw52UqUI/LVteiVc5iMzyigpodzzLj/8ym22fkYY
         HO2huMOy4lNi05hrCz6eCj+rC1scpNDkJMFKuggVwHa4EQWwm8p/y4tpNOCLqzdku18c
         L9PfHdMxRvcvS/dj6idp3MKymNrH9qtiydiXEU3xf/ZdaN2HxqczHyhDDvyI3PyxBrrE
         xxlWOw77URh3N5O14NddlWj6zmO/PbzP0K5E40j96t87NgYVmYqdo9O/++ALdibQqHSE
         iRW1JEr+VqxCltJRrvQwZEP6RWZqzr0G/oA3f/TrjqMDOdnic8wn9NTnUe7YtwNh39Xd
         8edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704154827; x=1704759627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTaEp3XVmk5hBWJHtuJ1RqHFEs+keboZK7LqcHaxz3c=;
        b=wV1fDU+PecxnZpPfytPsQcBI1kWhsXCTPzZjbyx53Re6V8ZDDR+146VBrDLfhuSbrY
         Uoq+p4fbyuVCxKVuhn0MXz+3I9qZ2sSzQNeqT8xyG9cRtIuCbvqt2yYgKLvWkmKRgffD
         TjoiiGDFSXM+T5mirVe69a5lT88j2gJgvJtcGHTikwasg0JpAY2odZ+r87EjTpBtsTYo
         pQLFsSvsKNqRKZSP8e+Jym7XNdEeW5R9e+L/hxhL6xL4XehDOvspcItj3W/sUXWcjSYd
         SeAq77zk8AFTBbN23HUHua0yN6mGGoRrdUlBAStSx+XVNiQoRaMwbJo21LGs49ofNqDT
         bTCQ==
X-Gm-Message-State: AOJu0Yyt5hnW61PX6fvDTj35AGiuW/Zwx2/7dedml4DRrQHwwLKJltcO
	ILSHd5LzC+wQr/YAFHBYm0tdDB4PeSxztJoPZw4=
X-Google-Smtp-Source: AGHT+IG7C6zjsI21HK5RH9vZz18r3pG4+41+gLHtVqdN9XItmbIvm/ebng0goKX7sdhkxsUxf5ePHdQAaO9hJp0b0eE=
X-Received: by 2002:a0c:eb84:0:b0:67f:be16:819a with SMTP id
 x4-20020a0ceb84000000b0067fbe16819amr10962323qvo.72.1704154827014; Mon, 01
 Jan 2024 16:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-6-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-6-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:19:51 +0200
Message-ID: <CAHp75VdRny9rUSb9Y9rgeiAFkhHR=9LO45BsQbZk0X4U7CEhfA@mail.gmail.com>
Subject: Re: [PATCH 05/15] media: atomisp: Drop is_valid_device() function
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
> Now that a single build supports both the ISP 2400 and the ISP 2401
> this function is no longer necessary. The main probe() already
> contains a similar switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK)
> checking for a known device_id.
>
> Move the revision check into the main probe() and drop
> the is_valid_device() function.

...

> +       if (pdev->revision <=3D ATOMISP_PCI_REV_BYT_A0_MAX) {
> +               dev_err(&pdev->dev, "revision %d is not unsupported\n", p=
dev->revision);

While at it, can you fix the logic error in the message ("is not un"
-- double negation)?

> +               return -ENODEV;
> +       }

--=20
With Best Regards,
Andy Shevchenko

