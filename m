Return-Path: <linux-media+bounces-32019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF1AAF5D1
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71423B2152F
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 08:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC7F262FCA;
	Thu,  8 May 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOuSPcAI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B492E216386;
	Thu,  8 May 2025 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693492; cv=none; b=Rr6R8D04VLlLOfKbZ+pQ6xaeGxI+FU1toQWqvUV3EsXJYyBiJy1x83JspBhousLakSL3sm2zSS44NmLcu2DPqf7004344TvRmDJJXEjgaiOwOtv8pXpsf3NxmHnv+57KrUF9KPl9j93r1CaxsMFRLhJPQcJjsxqKHONLS4JAXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693492; c=relaxed/simple;
	bh=iiQFIztHrq36O9I/yuxgb2y2SBf7ToGaPplZyPSc/Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGbyOrOrdqD37swWPRn8ML4DOP7UuV+4t0VZ1F3sgq+ops9xxqHnNDQezxHhXTk6HuxoffcchCwOp6iQHxNheYDbidHDBDBwc0ZywaC/Q/gRJq4O9RbD9/LyogyMaSb1ZBS4xM6ioyyjPmafhhmwlJnIsJhlE1uOQEWESrnZd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOuSPcAI; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac29fd22163so119691066b.3;
        Thu, 08 May 2025 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693489; x=1747298289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiQFIztHrq36O9I/yuxgb2y2SBf7ToGaPplZyPSc/Qw=;
        b=bOuSPcAIWDWPMObLfh3IRtJBcL11DlTjottvj2qGeZ34dACQAdJJKgAn4ybsLassc7
         NKASmD/ei4rD++P+BmIskunMfbuaAcOF4ReKqm3QNiGNW30LJ+itR2TPkIsdn/mj8d48
         5hPKhCUrktx5BceVqiLtkoqS+ixY/k88v+jTCZI1RSULlPM8HpYATvYzGMuLTh/oFhFy
         yiNdnqIeG3dUtbZeqMw+xmt2sIAIVxFW4Os8UiXFRcF+4SUuyRhd6k79bTH1/0n0lmBV
         IJnvRX2BkYvJQ7RGow/SAVvd0o7Iwxvi+kgROF7eAw/1+RvmYakiwKOXm8n5EbJ3eYEk
         FvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693489; x=1747298289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiQFIztHrq36O9I/yuxgb2y2SBf7ToGaPplZyPSc/Qw=;
        b=YHr0XcjaXYHECZH60PN2CdXHcldBgNxYsnG/La+/WHTs8TN4bkdHXpG89OhC7s7h3n
         NCHvDNImhijBgmgIkqYIx0FTzOrg9DvUZGh7geAjv+2v4S+mo9f1IdlkJP03g7O47Tdo
         tSPT5eGdggJftCRf//2jGvww3+FTlcWhFt7gN3POnH5XB0o3vxHLcRVMVzKWY71VPhC0
         OMnjIKZEPnZ26tPSzSoUNMgQTPoVAAPPlh1PpurJpFdWvG1FANjUnEmHKbij4iDvQiUN
         exL1uefYTwhDeRviyAa7qF+V/AIe/ZVvJtWyjZBzQLf+Fyj0r+DIM3Dza0NLnzxjapqP
         jCog==
X-Forwarded-Encrypted: i=1; AJvYcCUjEFnjrPkVHqvIxTi1Ianjcvy2Jd7jk99bZV9jXQxWIepbUEdU31XF8SAa0ZHE3CjAedU1A7OvRlEQBA==@vger.kernel.org, AJvYcCWA/9kcVEv4rOrCYprLP2wD2WGmCtBUG/5CcEZXTqRj3H+mqPOvTj1cimLqVbPK5w5kj1froTjh6H6N/VE3TC123zGSyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+KPVBI3hORBGIPo68h8qzUK79bx4a/Y4oCuPQ5P8YMoALn6e
	LdVy+Nej1MGDrKuIsNlc+1avlEkR3YMzQ94E88dFvApQnau0vecejydkPXApjd+2FOmx0QpMHqs
	rBn1K8CH9pqPn/l7yFLV+uafzFX8=
X-Gm-Gg: ASbGncu57eAJomFfDoYGK8rI76yH6zq3QUnHCQ1N22cvG5BdPSEZi4JPOdUjuUimlZP
	LZJwMdGvtvrT5nn1e89sMsrgK/ytkMopRzDPo6qGgJWDr1WnL8mOe6c5okv7RY6hY+FXnijU22q
	iKmJ3FRcenN5XvONXntQFANg==
X-Google-Smtp-Source: AGHT+IFaXR7Gdcs01yDtClXE6wM3ZHYQPlAsb5UTjdx02NdsUMJRHxWGNlIRHUsz8Uwnw7qt9DGSCV4NeCHMcn7nLLs=
X-Received: by 2002:a17:907:c019:b0:ace:ed3b:285e with SMTP id
 a640c23a62f3a-ad1fe99df6emr189727666b.56.1746693488785; Thu, 08 May 2025
 01:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com> <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
In-Reply-To: <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:37:32 +0300
X-Gm-Features: ATxdqUFnrXw8IlYAU1jp6FWFk9eL2pdP6A2jXxJxraQiS4xe2ktwNA17VklxgKI
Message-ID: <CAHp75VeRTO2vPqb44qNp+MZP3R9y5qv3X+EjOJCaeCR3thsr5w@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 11:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> > This patch series does some small refactoring of the int3472 code to al=
low
> > re-using the sensor GPIO mapping code in the atomisp driver and then th=
e
> > final patch in the series moves the atomisp driver over.
> >
> > About merging this, maybe the int3472 patches can be merged in time for
> > the 6.16 merge window and then the atomisp patch can be merged after
> > 6.16-rc1 is released, otherwise an immutable pdx86 branch with the firs=
t
> > 5 patches will be necessary.
>
> Overall I'm pretty much liking this series, but one comment against
> the last patch (see there) and one question here. Can you isolate GPIO
> mapping code in a separate file, please? This will help to generalise
> this code outside of two mentioned drivers (I might need it in the
> future for something else, not related to cameras at all).

Ah, and formal
Reviewed-by: Andy Shevchenko <andy@kernel.org>
for patches 1-5.

--=20
With Best Regards,
Andy Shevchenko

