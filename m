Return-Path: <linux-media+bounces-35534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D0AE2B30
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 20:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 388D31898FF4
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 18:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D4126F445;
	Sat, 21 Jun 2025 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2+8qPqN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921C221DB5;
	Sat, 21 Jun 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530320; cv=none; b=gpkG0cFnJrsj3JZGqNi3qDhTiy+kkpIaBIVAR+QFqCKzvGayg1dQf/X3+6sHoercb9iP6qmWGhxeJwi0Dy/skd+T1l6kYVdLAH4V6r/fe0VlP2/xc1hwqlvuSmHbLZY6dv2uNr9ljCs8kunTAyk5IMETzdQsQxGfov18+U9CEQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530320; c=relaxed/simple;
	bh=WXDAT0p5ZVcXK8GhqJvWCQLjsqE9/G3NdrAazvXFfmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ay5ENtM2M9PNBAznvSuGAmoZpe9i3uFUeHGmoLCkJqPhOMcyFCnj+i7zCJxmqTEnN3jajFRVdRgEEkdaUQfHMzEgOLAaqNF7VCHDC2YDtWWVarFR4rNHrG1wfUq85tIWFC1QAdXdJCH9cm68TnawtTOttQZD8IHLks3r+CW4nIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2+8qPqN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so6167527a12.3;
        Sat, 21 Jun 2025 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750530317; x=1751135117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kw9tbk5Ggbk3BxQq8PGaG2PHCPfTa77ZcVZchgZ1Z+E=;
        b=M2+8qPqNJzkwqAIHweH5in9bHx/V3bUCcY4YkVJrXhWHKWmK98CczNC7EZNmuHWmyI
         SpjEcMyeJUAFljpsfn6/aSl4XP7+MOZ/T/ERB8FEIDDipf1vn1SEc+ekB7zWBaXotKJk
         Wif3wgxE8XgSpiERWoxSxDS42FsPNRVqsDuOCc3q/VEtZVsw7SptdmZe+ztQyzOATP+W
         33jSMrIgd4f6t8ADaej/ift7M6OTalWgOT6Q1as87o+YHXkwlWITCehXuRjZ7o+YhVih
         zOHJ/7agqzP1pDJ51SI+8xp0Qsu5ZbbROiWv+ja55ZZTob6NLgGYBygEusKOxowtzlw2
         ayMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750530317; x=1751135117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kw9tbk5Ggbk3BxQq8PGaG2PHCPfTa77ZcVZchgZ1Z+E=;
        b=JVFee3/yJVaVp4OxYaZvl1G4I758+ZICUWTHuDIb3wePy1lDE16kwzGpga3AY/ybDX
         9EnuoIYVDYWsC8WytLILXOcL4MWMdAOde4IhgUBudtR/knAAsxEVc0syZh09QmTuy3B4
         +Q3Pcgtc04UD/WXpA8e/6RcPpNEvaPqJS7D1CNXI/23u+M3h07Vjrdrp9yDlUZvjCoD9
         p3wwA3FrNH0lOfOJa6ppTNAeCMLqTVKZEJg9RxE0Vib3HmO56QP5APQc5RfQejQBn/oP
         K3TtizEOvuBK1ZVIxvGUzGiqNFV7Dl5XNfKvTSg3N0beIpYIhB0N1pVJYIiP1lMv9Rgd
         SE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjOxLLYcTA6hGo2VCgmBVpuKGRP9X4rcl0DCFNTFVgfFD5Wp4TAFmWiYnMiQbF91r3xMbJs5dPgUSAoek=@vger.kernel.org, AJvYcCW5Jv62nM+NRIoRUiJQu8U1UC2WGgXBMg13t6fQDdNH9aS7yGG2di/E5gmFLxukV6q+02rfKvuCXr8FeVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT+EUcFeWVs23tV6HdIxXgTqSf6bNblfXkWkzrhM5+Rc+v7q7f
	/efGEhq9+PnFEfWATFeKWBXuRqYvKjlBTpAAizHhN2lGdDpvUVWYtrFDQMqG0a74yHkSokAxx0p
	mqbU0QWzLG/Is+8RZB+Gub8BLtuaE+WQkFcGe7jU=
X-Gm-Gg: ASbGncs20+cHWbCvMQROicGwGhluscgE5u5LBAp3p2I96EOuNrhjzZOPC1wSvQRHW96
	z5yT+gbLk0nvd/m3FUQe93tc5+atOmzbwugoPkkcKrsNsSTwlP51JWk8R/zOJES1yqW1r1V5lE4
	ImXtpX0hhyZ5a1ww1jGHzqlCyIbEJU5Qw5yIN3210nmFg=
X-Google-Smtp-Source: AGHT+IHK2rTt5Insjp/jKKM1rSYBliXDNBFwgyaQDS2bk5jUmokhpWhRIGFeX45VfVac1F47IfDW/3qmzFO03lvfzoM=
X-Received: by 2002:a17:907:1c10:b0:ad8:9e5b:9217 with SMTP id
 a640c23a62f3a-ae057f653a3mr686464466b.45.1750530316842; Sat, 21 Jun 2025
 11:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Jun 2025 21:24:40 +0300
X-Gm-Features: AX0GCFtrGpRHPsY7yoSy6uZXYIi5rESiR7BcUli23Y0PElYlMLQpvpeR40LW4SE
Message-ID: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 9:30=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> PAGE_SIZE handling and standardized sysfs output.

...

> -       ssize_t ret =3D 0;
> +       ssize_t offset =3D 0;

It would be good to move this...

>         struct hmm_buffer_object *bo;
>         unsigned long flags;
>         int i;
>         long total[HMM_BO_LAST] =3D { 0 };
>         long count[HMM_BO_LAST] =3D { 0 };
> -       int index1 =3D 0;
> -       int index2 =3D 0;

...to be here.

>
> -       ret =3D scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> -       if (ret <=3D 0)
> -               return 0;
> -
> -       index1 +=3D ret;
> +       offset +=3D sysfs_emit(buf, "type pgnr\n");

This changes the behaviour in case the sysfs_emit() fails. Not that
this is a big issue, but it should be pointed out somewhere.

...

> +       /* Direct return of accumlated length */

accumulated

Don't forget to run a spell-checker.

--=20
With Best Regards,
Andy Shevchenko

