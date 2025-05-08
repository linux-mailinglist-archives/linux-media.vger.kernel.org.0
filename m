Return-Path: <linux-media+bounces-32017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9297AAF5C5
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886343A851C
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 08:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA496262FC1;
	Thu,  8 May 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jy49b26F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543A2620C6;
	Thu,  8 May 2025 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693324; cv=none; b=X9ep/XT0s6Ul6XW6PLsgZCihgvouJmZPZFZ5lJzUv9oy5CE/PaT1jHodtcahjGP0kLJMV/CyWqKz1HIDwFl+3B8eDe13Itlc6uhO1EPZ6PKFcXz6a922r0snFgMcy3isrmu9LAONUc706PwWN537ARF2trCRod2EWUnLuu3Ze7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693324; c=relaxed/simple;
	bh=e3t7QJAuaFJtViosS65Bennck9HPjSpPtTFfrFBECa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KY/Lul1bz+Nr6AuxzJKukHVq3RpFQrUxqFOEwpcSQkjYoJXfiireDrMrcSF8ZaqVnUQJedK+x8jJaNnRZWVjvNclilLUD+d+9pUkD0p3mue3EnZk6kKkGGG3SW+1ISvX8zOGEq2GKIOAtHqHNV6RCH2HDZ7/hTvcMW1gu2iMCX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jy49b26F; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb415dd8faso112651766b.2;
        Thu, 08 May 2025 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693321; x=1747298121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC9aDZS0LKYqmqpbLRQ0il6x7yHH8lhw0zmN0sVe3Os=;
        b=Jy49b26FwA0n+GVHti0sPoZg7Oa65+GPLbEnc2DUCPAym7MLehuvpGDhtO2etC59dg
         g1PHM4LLdhiykXhfXOtBiJ4K2Fw2DRxMZGKL66JzErCsZL81q4y37D8vl4ZcMm0b+jjv
         ieDEr56d93Rr52N075wfZwJxwkKWlcyfNYV/d4MksxeA+LK5wMaW0gpeAImoZjSuDdyY
         t9K0k9RWmtgI3c4hH0CNmYCbuIdKLldbTy3BbzJ/dzbCfUDAzA6q2KBW1jTCyIzSWLuG
         x7amL3Yx0JKG8viFxhAK3MDYUBrk1qyujFhiU2tC8ViyzJCtSCxgN1/+JXEKNlaX02Bb
         blUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693321; x=1747298121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC9aDZS0LKYqmqpbLRQ0il6x7yHH8lhw0zmN0sVe3Os=;
        b=wh1hFPhgi3eSa8xYTKg1/0Y4d5WKPqSS0EuYJUY9YJO9ZEQV6tTPGk7WYixURMAhEj
         eAP/j3lhQ/N7DFWe/VwLkXBnrEIqtJ29ZQc7AWeHm2XQlHZLSq1DKZAy8uNxxGdSsHY1
         fYpg+nI8fCJz09WnSUe5zJhNKmpZ1WMz8OcGCQrJ+C3vbbZlm8VcAiB78WuAZWT1nkjt
         4vduxhAFA35Fb5GgP4owrwFCz0D/+rslpTHpyXULcDesljXwuh7ucuCP7lCN85PXU00t
         KUt8ld8fKWxQBdRMAzrGGnkOcYTR1GknGtNZJ1rvY4f3fuhzLi7AWesmeEAmESeSnUA0
         gr4A==
X-Forwarded-Encrypted: i=1; AJvYcCU1W+5ERYi1m1RyZQLixHfAq+qx6/DzxIjQ+cSj15Bngwq4VSC+kIYozXEfSJFTKgnawzK04r9DenZyBw==@vger.kernel.org, AJvYcCWbvo0EZ2ktb92LAyoPK7p44ASDJhTvFqVO+vVHPOvzpQjfoNBAdF5ut5s8jtfSMuYVjBstBlhnRqnIqszCf3hMner7tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqccXGHnZwf9Ngi5cuacP6Lu9pAuADxzZ2e0fDjiyQY4WDY6YX
	miGrr1YoOP/J6ycq8CcQNxqoY6TgzRJqxb0JJ+NH2Yh5BmhpkGdiYjT2gOijRrT/IujwotBuBoH
	ZkRIKbO4D0Tk7aKOXxwhcscnZ4Jk=
X-Gm-Gg: ASbGnctmHGY6HhLGjK+ddkVbgcdQaMl09DQXDH93pM8JPL0bDoAGVtsFuXzj/aqpqHs
	PI/MShS2B/CxIAqlFU6/P37ZDoiWEO3WFVzRGOxQYZN/EfuRFF/eZe2GshIiDEOBSMaUuo2VfzD
	rYtzfSzz7bNf682RgFIs6jCA==
X-Google-Smtp-Source: AGHT+IFpTRqB004nqyjzDqZJ/RdnM5xzbDAlNgJkwigYL1F9Hqa2p1wCGUuWD8zw4M5LDHI+4YuxtzAWl8MSMgluW7c=
X-Received: by 2002:a17:907:3d8b:b0:ace:c2ab:a720 with SMTP id
 a640c23a62f3a-ad1fe67bec2mr215231166b.6.1746693320490; Thu, 08 May 2025
 01:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com> <20250507184737.154747-7-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-7-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:34:43 +0300
X-Gm-Features: ATxdqUEYVL7wDPaJGrVwNdydfTxWU0TSHRUnwOLZJPK0ubdIgZb-muGbEwg1zkw
Message-ID: <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:48=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Replace the duplicate code for calling the special Intel camera sensor GP=
IO
> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
> the sensor with a call to int3472_discrete_parse_crs() from the int3472
> driver.
>
> Besides avoiding code duplication the int3472 version of the code also
> supports more features, like mapping the powerdown GPIO to a regulator on
> the mt9m114 which is necessary to make the camera on the Asus T100TA work=
.

...

Don't you need the Kconfig(s) update to have proper dependencies all
over these cases?

Otherwise I am fully in favour of this change and the series as a whole, th=
anks!

...

> +       /*
> +        * On atomisp the _DSM to get the GPIO type must be made on the s=
ensor
> +        * adev, rather then on a separate INT3472 adev.

rather than

(FWIW, it's your typical mistake, it's something like the 10th time I
noticed it :-)

> +        */

--=20
With Best Regards,
Andy Shevchenko

