Return-Path: <linux-media+bounces-32042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8C6AAFDEC
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 16:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78E55B26E01
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 14:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70E427A117;
	Thu,  8 May 2025 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5w3sKN2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01F27A111;
	Thu,  8 May 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716152; cv=none; b=nKPwbl0Vf6AUyWkKNJZtpwK3SRxCsV6Zw9Dt3xVaYI7mQWHtT3vU5pkAHZjQKpmdL4NtheJDzo5FOHWu9MiRBbDGD3kF/DahEmA+IzfUg1yX3s/mVPlXISDuC/Ko0KNs0kF9gs0MmB5llIOJDHiszkN9nvOBojvkcod5qM7J6FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716152; c=relaxed/simple;
	bh=Wi41NfxUGhbTbv1pQ0AGhckkbn6srjFISoz8v8J+p+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgYiJF0S2sMqMehoflFv3ibvu9C3rEid1/WNnOlNEJQAWThmaB89P3kryTP5yYiAV9eil325lf1BvqZ/7ryTx9hhKbmGEurMFC9UDWc0T0fNrrm9JqBp7ISXNzp9VNcDY6Ee46k/av0NmiNzn1NP/THEzx9vzpMMIANclQfd2Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5w3sKN2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso191799266b.0;
        Thu, 08 May 2025 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746716149; x=1747320949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi41NfxUGhbTbv1pQ0AGhckkbn6srjFISoz8v8J+p+Y=;
        b=j5w3sKN2ybmhdAX58sx9s+pNRLJsXadx/rph3M5Zuk+vFXr0oBkwhpeknW2ba07EvY
         8t/VWGtqUvt9NwY9pR8wEZCZ7TkvyVUWzHTOFcF4t7hjYroAsH8d4TjUITC1zg8SpNjp
         RE+4BvnR6gKOuDP5SXINA2A6kiUhQ0LbdncR/3qaU2JeCdKKrL5aN3fjqg1+SdMDVSWo
         68OyNUK6X6QaU3TSYIuOMJsXRJIWWUjhnWigBaBwKX3SxjeOcvPIaTgKsx6MTAW2ti1s
         wJVI7wJJ9rBTv9DyFQrmd5F/WyA1NMcx3F5xGmzbZoRSaUDiMwLESY7ybOErbRRyO8qv
         zN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716149; x=1747320949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi41NfxUGhbTbv1pQ0AGhckkbn6srjFISoz8v8J+p+Y=;
        b=emC8vrlrV++nNn+PlGBRZ7rHF59i38L5yUNo+Bp5lXQuy8nqqnu+xGRSIcsRudLSoj
         ugKO6YOhmKTtYzsqmER+u+NlRDbuFzAd50v2wSysE688XF1qRJE461BwhqERuzdgaGdg
         83inm6Io3z3Pn3vynXL18T69jb6UIuXRzoSGvcHZWnrLutmGlG08WztjJUSMJyUFBAEf
         wGCYp3fMiR6H3QREig3itk344vbn979npchNIgxMbJjfR+0N2WFU0pQh5wX9QX0Amwfe
         4kIBlZcmoV/pHRbp+OURcmOUDG4kO+3X2kLu4P90IDysrpNfSmTHc+Rp2J9QmG9OLU/3
         AvvA==
X-Forwarded-Encrypted: i=1; AJvYcCXPomqSCVTpneJKOqL0wgcl0a8L3GB+mfBAnZbPtmPjVQqObpcsSiWMBHzbgEa//l8CeKzS8lthDEDr0w==@vger.kernel.org, AJvYcCXmWaXi+kg+9DA2VlmOcV6z+gdQbwVpJJH5tR4QaZdFzQ9/vN1dXv1mDEHVTIe55lp8k2eyYYIDXUdVzZhegJLj6BhuWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1fT18gnsQl8N8cRFXB5Cn0gKKlpop5lCmFxcWZHX3M0GqGoZ
	Rnbft+LmlFowz0EHykQYUfhylIEVVZlV6gQ9DKlGYSY9O3FBZGHCL/B0LfG1ylXgn9mlrkzmNPP
	w8oa56RSClMORUR4EG5l3XwB+QsQ1ft1B
X-Gm-Gg: ASbGncs5xQX+jzgiUsTaveMteNII8mWcpjULaT6MtGARBWDFKhSbmhKh5vUQLCM/IcF
	qqw1MWBP7nsaIvaPqWne/Ip/lrPLHEIoLyhGCByeh3uY6WrIDURUdmIrDXPNaH0yrysezK1zO1k
	2H9xltIbGT7rv2DFEPfkxeaquW6CnPVHIX1I8=
X-Google-Smtp-Source: AGHT+IGiKRW4TiDoK9/lBhRrzeQKcy9vPDCmLn29aM+2GMRxVJdJ+CW9Z051dhndWfzh2L6JSFGlIL4gDWZ3hZmGZI4=
X-Received: by 2002:a17:907:8d87:b0:ad1:e7f2:b94e with SMTP id
 a640c23a62f3a-ad1e8bcc880mr783564066b.18.1746716138298; Thu, 08 May 2025
 07:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 17:55:01 +0300
X-Gm-Features: ATxdqUFbSQF6mj9SBgrSeC8p9uP8gtobKBLj7O4lMyjvY1f-aFMKCyAoOnzP-K8
Message-ID: <CAHp75Vf3jUuALHGk3fXEDRnWKh-z0prSgQ6sYhK_dcrxAiyEYw@mail.gmail.com>
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

On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:

> This patch series does some small refactoring of the int3472 code to allo=
w
> re-using the sensor GPIO mapping code in the atomisp driver and then the
> final patch in the series moves the atomisp driver over.

I just realised that the AtomISP variant is very likely a predecessor
of INT3472, and hence a lot of code has to be shared between two. Or
even having INT3472 being enumerated as a pure platform driver for the
case of AtomISP.

--=20
With Best Regards,
Andy Shevchenko

