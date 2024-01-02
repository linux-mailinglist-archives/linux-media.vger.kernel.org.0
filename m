Return-Path: <linux-media+bounces-3146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB21821609
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 560A82819CE
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5BE363;
	Tue,  2 Jan 2024 00:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxbC0giV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB036A
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-67f85d29d14so74229806d6.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704155651; x=1704760451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfqH8G08ty3BRoxiRJlrx2qbokmxAtMRS/aRrX6GN3U=;
        b=mxbC0giV2O2k16TAd+x65JdCncMoWg2tODUGZnydWhaaFxOZXhXUucuumxhXadIP9e
         dVJzAU1LsiK2o82HVANMeo8a99AvhjtmRqtC3INCF9hQAqtwnDrkUiJCGFBT1A2FQ95+
         GzSD5yD0j9SXCPz6TqVOydbI6zgHrQKqZfG7xlv0iWkpIIL1Cvvlw9ekjQSOKQIBmZrD
         sB4lqpyZPtAcVqKeax6Iq4sylauqwyafbxL2e9J6Kcio/LCrDhKaKJOS867fJfWqwy6h
         waoJxFBVQPeN+mmC5zgay7akg+/FL5bYWp/18rNqJ0ni+AB7fzzJEKb+MXMT5v8qoop9
         523g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704155651; x=1704760451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfqH8G08ty3BRoxiRJlrx2qbokmxAtMRS/aRrX6GN3U=;
        b=OpLtnqcPiUizW+1tuijld4kQaMgJJxWr4R0+5gvoXZ0qFzT6o6a/LSx6jCb8DR2c95
         +L2yR4am6ro+T9bVW+RK+2G3OO9HyN3zhQiYvGuaYjgWQUr+UUG/Gw+nQEt+4t/Cy4pe
         sEsipSHL9UjineCHjyMMw/HXVdpdAdz+wEJBWWAyTxvRFqbB2vYzZ4G36fPHOXq8BVDl
         trW3NnPUJVffBInDw1nxn/tVYNayWrddik5/EmY8IgVdtMWElNTLZLdY6g05vd0XSwms
         tzEI308qb3jGUsQCOTcz9RE0A+RYgroDWRglYtYo065Dwaaj9wqcAJF6gM/GWSB+j+a/
         igJQ==
X-Gm-Message-State: AOJu0Yxt4W710OyjQqgEDUJCCKyT19yUWL/1GzAFLPoe0HsicZmN8Rl4
	zRjRTaJyD+oFltZL+3hM4FhtztcrW3FCzW5Z1Qkxl+8aD5g=
X-Google-Smtp-Source: AGHT+IGyaJiXdgWqFBUu5f2BoOupM0lrgwObVrHTPW9QoEdjv0OTM66Kylt0YY2ugKaKsEPvWQdH8hjq7WtWoDGwWX0=
X-Received: by 2002:a0c:d783:0:b0:67f:fc67:882a with SMTP id
 z3-20020a0cd783000000b0067ffc67882amr15182078qvi.119.1704155650893; Mon, 01
 Jan 2024 16:34:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-12-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-12-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:33:34 +0200
Message-ID: <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com>
Subject: Re: [PATCH 11/15] media: atomisp: Replace atomisp_drvfs attr with
 using driver.dev_groups attr
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
> sysfs attributes preferably should not be manually be registered but
> instead the driver.groups / driver.dev_groups driver struct members
> should be used to have the driver core handle this in a race free
> manner.
>
> Using driver.groups would be the most direct replacement for
> driver_[add|remove]_file, but some of the attributes actually need access

..._file()

> to the struct atomisp_device (*), so as part of modernizing this part of
> the atomisp driver this change also makes the sysfs attribute device
> attributes instead of driver attributes.
>
> *) Before this change accessing these attributes without the driver havin=
g
> bound would result in a NULL pointer deref, this commit fixes this.

...

> +       if (dbglvl < 1 || dbglvl > 9)

in_range() ?

>                 return -ERANGE;

...

> +static const struct attribute_group dbg_attr_group =3D {
> +       .attrs =3D dbg_attrs,
> +};
>
> +const struct attribute_group *dbg_attr_groups[] =3D {
> +       &dbg_attr_group,
> +       NULL
> +};

ATTRIBUTE_GROUPS()

...

> +#include <linux/sysfs.h>

But why? You can use forward declaration, no?

> +extern const struct attribute_group *dbg_attr_groups[];

--=20
With Best Regards,
Andy Shevchenko

