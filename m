Return-Path: <linux-media+bounces-3169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50960822338
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 22:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 605431C2273F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 21:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F68168A9;
	Tue,  2 Jan 2024 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECCf9EIF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD02E168A7
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-67fe0264dd2so62117596d6.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jan 2024 13:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704230665; x=1704835465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36Ih5trLY+IAE+FFGRo5lyyN7SKY7bVEH9AA4YXN+rw=;
        b=ECCf9EIFbkugJyMmCw488ONMtB/O6x0ymiznkwUZC+GChOKDRYJD2dPe6QWF053mNk
         kB40/x4JHSHZFIFH7tq11wSrZ1TW07Xzx2yQrEJzv7vkG7+Cbrljo1kLSnmze/aTJxKY
         92++DkEYyj8AypWNEn1ret/xGPyLJKBIEPtopt/N/uzoGaD7rfRK4C9og5WU//XwXEzY
         HH05HxtkXmz1/KumMio+2gND+ipovGqXaVdqPUmN2XzwnPHLO6HzDtij2xisY7djIX19
         YO0BNsOFXVw/b8/NI6y51WpLWvbMG9D+EK2iEh6CHPsDPrCQtG2om5n6qiYhik06kiEE
         +Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704230665; x=1704835465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36Ih5trLY+IAE+FFGRo5lyyN7SKY7bVEH9AA4YXN+rw=;
        b=WO7T0naClFsIqxPmwcTSdWaLJvxXNvQoZjj8C6V2WFfCACZYq7VUfFIXx7r5ONq4mf
         R/uDaqWuLvmn8nu43sQO+r3m6naFKemsr7NWoghPURbZ7evtQw/VxS0sdYPReJukGV8z
         55XlP7BbMeSIgkuHHYkAhyXlpSk+ZMYN3TDBtMpzY5W+BhriklLfz/x4Bmf3fYPsQrdC
         BBVKQbmI9vW+hUKuQ/CYDhCcSZft6TGb6M+U420V6esoyKxcLNrJu61nXhtFrbbqDYoC
         2tmsn3QJok6F3XKF4WMftfkADE4oiWM1A5Vs07hIk67jMV+y1KD7b/IjSpWBJs0sr8fu
         zZ7Q==
X-Gm-Message-State: AOJu0YwI04gQjOZ20412HQpp53WcS4pvTZmPKIliymFxrKLsP47VtXa5
	tx/cUs9vZ8g70G5pAEs0Vsngbnd5CXdmgJIQd+A=
X-Google-Smtp-Source: AGHT+IFo2Oe9524xTH9MwYCySZe7vLvLS3FEpYKJ+mYEn4IBmV8sdJ5rFzgmI/NOWdSdfhPwvyxn10rw2Xez4QyE/sI=
X-Received: by 2002:a05:6214:2aa7:b0:67a:a721:82f0 with SMTP id
 js7-20020a0562142aa700b0067aa72182f0mr20180214qvb.74.1704230664739; Tue, 02
 Jan 2024 13:24:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com> <20231231103057.35837-12-hdegoede@redhat.com>
 <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com> <960cc0a6-6ef8-4a66-8f83-89e854b7b578@redhat.com>
In-Reply-To: <960cc0a6-6ef8-4a66-8f83-89e854b7b578@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 23:23:48 +0200
Message-ID: <CAHp75VeREE+DEuCiAyPQkMRe2ni7K+di1tSFG=vjW4EWeS6gPw@mail.gmail.com>
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

On Tue, Jan 2, 2024 at 1:30=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 1/2/24 01:33, Andy Shevchenko wrote:
> > On Sun, Dec 31, 2023 at 12:31=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:

...

> >> +static const struct attribute_group dbg_attr_group =3D {
> >> +       .attrs =3D dbg_attrs,
> >> +};
> >>
> >> +const struct attribute_group *dbg_attr_groups[] =3D {
> >> +       &dbg_attr_group,
> >> +       NULL
> >> +};
> >
> > ATTRIBUTE_GROUPS()
>
> I deliberately wrote this out (had to write this out)
> instead of using ATTRIBUTE_GROUPS() because ATTRIBUTE_GROUPS()
> makes the groups variable static and here it gets used
> in another file then where it is declared.

I see, but can it be refactored / does it make sense to refactor that
it becomes visible only in one module?

--=20
With Best Regards,
Andy Shevchenko

