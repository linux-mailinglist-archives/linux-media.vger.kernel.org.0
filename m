Return-Path: <linux-media+bounces-3147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2682160B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 01:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E4B9B21217
	for <lists+linux-media@lfdr.de>; Tue,  2 Jan 2024 00:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291BB62F;
	Tue,  2 Jan 2024 00:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiSegKTK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8D336A
	for <linux-media@vger.kernel.org>; Tue,  2 Jan 2024 00:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-68009cb4669so49498556d6.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jan 2024 16:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704156083; x=1704760883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE9wfDZFcK96VbDGyj6SH7W6g2PIOAb48Opms4rfcVQ=;
        b=WiSegKTK+C8Oezl2LrYbFGxmxDkMcnS5ft08ioJyg6w6+6qnmDYfWCar2YICqw42F6
         0PsIFQx2Hug2XDZWHj3+uJsPZw2fqLbF6SizRe5NcDhgU3Nc5gXwxmVat3579rbnAkM/
         OKMK8wxgIxdbIRaQRQFkzrhWb9yeYBf9VGe9l6e/FJlG/jp2rcHhEKngedcVbVlXqD9z
         5O1dbk4xAUMr2OjXM9YBWF/PDoaWCPs9Sxjg//X94zIF57CIO/QJAADX+aH2rKtaM+3i
         XFmmlRu/2Ebot8CVGsZiGXMO7n664+HfAS7psgFV/SG0Wg+Q47x4WT+8+xaN4CwfrdMJ
         sfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704156083; x=1704760883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE9wfDZFcK96VbDGyj6SH7W6g2PIOAb48Opms4rfcVQ=;
        b=nM7Fuk64fKW7cyAjwHbbWxnG/5QCXIwFZ+z7SYfReneZDJkyhiWgs/RfIQ6WBvqOSG
         TJFZXZlQ77eaxzstjCbCd+qqk4DItSHYS/vU9OhgxWXu3bH0vJ1X8wiCpTy3LBhIC1jl
         Q+zJlcdp1I7lIRhinJjC115Wt+qfj09Ej3+yDYQwU7TjDWuoq9vxWimHfYLBlEQ30mXx
         NmQJE/B+JI8Nvf+F6DwgdeB8Y0BzCpghbx1lCQebjUG2BYm50AVHqIbEvgRyzomv2Rf5
         XVm+MrGqtswtA6Sed/VkW4EWYD4kot0E/NjtriR5TPn15aAGmC9F00hikcvBBAd1flqQ
         VSYg==
X-Gm-Message-State: AOJu0YzULsl9vsX6yob8kEkxz5bJiea293pU0MBYcDQ7Jr2KtlE7oQFw
	tAaTb+IvtDNcfS4ijDX7ABBKKdzJokCxY1QhfaE=
X-Google-Smtp-Source: AGHT+IFYAQv2QsPpLeIPqXvnadL4bGFIMoNSQFeOtjtYag+bKimORLPRKkjfJXkS6hVBqUf2BaL6CWZEpJTjLH8Espw=
X-Received: by 2002:a05:6214:20cf:b0:67a:cf80:cf12 with SMTP id
 15-20020a05621420cf00b0067acf80cf12mr28978766qve.0.1704156083305; Mon, 01 Jan
 2024 16:41:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231231103057.35837-1-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jan 2024 02:40:47 +0200
Message-ID: <CAHp75VeqCo6CAjybd8sw=hLDytQLeCDw6ZOjqbZRrve5Mhq4TQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] media: atomisp: NULL pointer deref + missing
 firmware fixes
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
> Hi All,
>
> Here is a set of atomisp fixes I have been working on:
>
> - The first commit in this series fixes the driver no longer
>   working due to v4l2_subdev_state handling in media_stage/master
>
> - Gracefully handle missing firmware:
>   - Fix the driver crashing the system when the firmware is missing
>   - Make the driver bind in power-managent-only mode when the firmware
>     is missing so that the ISP is still properly turned off. This
>     requires custom handling, not just standard PCI power-management.
>     This allows the system to properly enter S0i3 with missing ISP
>     firmware, allowing the atomisp driver to be used as a replacement
>     for the pm-only drivers/platform/x86/atomisp/pm.c driver.
>
> I am going to send out a pull-request to Mauro for this almost directly
> after sending these patches to the list, leaving pretty much zero time
> for review. Sorry about that, with the holidays the timing did not work
> out very well.
>
> If review finds any significant issues I'll do a set of follow up
> patches to fix those.

One which would be nice to fixup is based on the sysfs patch.
Another, but not so hurried, is to have cleanup.h management for v4l2 calls=
.

Side note: Since we have many headers to be split from kernel.h
(array_size.h, container_of.h, hex.h, kstrtox.h, sprintf.h) consider
replacing "proxy" headers in the code. Especially when headers in the
driver include kernel.h for peanuts.

--=20
With Best Regards,
Andy Shevchenko

