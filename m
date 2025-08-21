Return-Path: <linux-media+bounces-40510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2BB2ED13
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64BB6168B55
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 04:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD53288C0E;
	Thu, 21 Aug 2025 04:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd7ZdSZ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CCB1519B9;
	Thu, 21 Aug 2025 04:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755751192; cv=none; b=lAXHRfVK7PQoHmEZjbDT7ZBqnmbW6ULdFXd26RumFtXd9PNl/JjJTa7xOT4RvtU6mfWglj0+hIS+PMhCFnY/LJ8mofsUqueUfSN/sujI6AHTWF5/u+fJghrQaFxVx3Jwu9iaE0/nC0ym4VND3OXj+Emiz2vbX4JAo6JPdXuHsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755751192; c=relaxed/simple;
	bh=br76vRpQpCWOsXPYJHMnjMrgtEy3lkiWpNPN5qRq9q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIXeJM4RrTUnLsuTSSgStDPOXEzrQCNKgTflMOTSnEfqST2tA9xztq73NNQnAnbpmlW4anKG7L0RmzzCG3AKQAEj9s2K1iKHG+8L1rk2AZxPanTZLTXVwXPzgrmUiqpnTXvVsdqQ6VzOcz3Wc1KrV/mRKOjfamMM173rp1HM2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd7ZdSZ9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61c003f6be8so40282a12.1;
        Wed, 20 Aug 2025 21:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755751189; x=1756355989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMYPSQA46qYB6D9Felq2OfwmV4HFg5GsAl5y4OBzbyQ=;
        b=Dd7ZdSZ9AU8edgSosYTW0NjGdk5QowbBoEBTP4K1rF81jCOajylJyaHiX6KO20tCfZ
         yKbnn6S1L+Mg1W3wUqid5LsTgW7cGixMsdK5yThwv/lTfMi7svEsYifytXk7OqK4SW2n
         uURAG3sod4+YNmQ51wUgr8K47SuZTsNvcj77vC8zIIsCewx2KMUXQg+wmD0HV/o2t59r
         rUj5VC0OigQn3buLd2ilpGeKuuj6TRQe8bnFGXbP08sPtOhqOo6+o1Lc09pbaTLKUYEe
         Akt+Sx04mJ8hGfBDmxfhCJOuLSXHYeuPNr4iPWWyxUD36mErE7nUEJINm1lFNlxZahyx
         l6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755751189; x=1756355989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMYPSQA46qYB6D9Felq2OfwmV4HFg5GsAl5y4OBzbyQ=;
        b=jNTbNDwGlvQr9pQIYEHSm8YisuIArTveoZAdtSJG7Xffy5B1htZZIbJHBqlJ2zge7J
         jpY1PsZHfcQV6pGEYHg4Pc0km1EutB5qkYOUq2EoNjz2J8wDOfEGHgJh1oFe9dmWWu0+
         zq7E8beS2tdHBUHd+2H3j4qKvpJ7ivK4UwwSxIGXvDkYiw5ByPnC3OL1ae4tIQrYy4WH
         FAJBZ8tANkdN1fY1t25jzDbyQn5g3+UMHRA4IFmikcmhhT/6Oa1M2v9xm7itbvLyq7CJ
         XFxLi9dB3AJtvOadIivmMRx4igvSAlDlI647xBlO13mYOPaCl3AiF9QI+Oo0KtZJ2C4v
         rI6g==
X-Forwarded-Encrypted: i=1; AJvYcCXfeilhZUYEgnKT1OBvNgyNWIlKYVj8paW8neZQq4BWt16ptwNyPzf13lJ2hne4f2fkF5hax+5bREPCE3M=@vger.kernel.org, AJvYcCXhYoVoYkSd1Z2c4vBSquRhbKgTz76mYsvfA5PO6Fv/pxHW/2jTNOAnHDsiPvW/75JA81Q+m8z2m1dSZKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0H/INp6h4b/1IFa8U/GpyFU3fHgwIikJ0cYyBCA4HwBQssnn8
	NgIRWDAPVziYAS63iEqARWULHLo2WVAoqyL8cxIweoRt4FrCF8fUbwmQPq+8sgUChbJUqA3yIXs
	pL7sid5zvzeAi2KMOK2qxI2U+D6fdTpA=
X-Gm-Gg: ASbGncuzakZ6XVSMz5xqrF7aReXEXFYgCYiBKto+xWUMc9Fb4+5/2sOo4xwedqF4EZE
	tvKNX2C7aN3wN+7TJOXkOehp49g0TLK48HKQ2J/6Shr/Xi2FcNPsJpnO+OSpJ61heinCd39ldoW
	UAHRuSm/lCTR5xDkyH1Dq09O5QsamsYxsDy4+Sq2vO7r/GG6nLXLyJ42TGAQZR9WO7BySIwWyy3
	Ouxv2k=
X-Google-Smtp-Source: AGHT+IHA58lZ9cyC75iW4GS6OivkNlCtKEtxTP9KpKjJcOTZPF2Vd7ycf/NKxNBOiyKpeHuXz8claRlSnu7eBcmiF6g=
X-Received: by 2002:a17:907:86a7:b0:af9:d7ba:4dd7 with SMTP id
 a640c23a62f3a-afe074c7c05mr89903766b.0.1755751188480; Wed, 20 Aug 2025
 21:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817092942.95053-1-rongqianfeng@vivo.com> <aKXkQ0WXaG-hMgEW@smile.fi.intel.com>
 <9a289ccf-47b1-4e24-b317-53aaa166bb83@vivo.com>
In-Reply-To: <9a289ccf-47b1-4e24-b317-53aaa166bb83@vivo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 07:39:12 +0300
X-Gm-Features: Ac12FXw4kkB4EeiJi02q8Hy6NLedTDErmM47Tu9Eo04h5y1UTsmjgW4BDivda5w
Message-ID: <CAHp75Vd_fEVssDjQqn6SJWZ-W4=hpvgQ_fyS_KE3jfbaB0ZijQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_array() for array space allocation
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Colin Ian King <colin.i.king@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 6:27=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:
> =E5=9C=A8 2025/8/20 23:05, Andy Shevchenko =E5=86=99=E9=81=93:
> > On Sun, Aug 17, 2025 at 05:29:39PM +0800, Qianfeng Rong wrote:

...

> >> -    descr->in_info =3D kmalloc(descr->num_stage *
> >> -                             sizeof(struct ia_css_frame_info),
> >> -                             GFP_KERNEL);
> >> +    descr->in_info =3D kmalloc_array(descr->num_stage,
> >> +                                   sizeof(struct ia_css_frame_info),
> >> +                                   GFP_KERNEL);
> > At the same time it would be nice to use sizeof(*...) variants instead =
of using
> > type-based.

> I prefer sizeof(type),

Preference for sizeof(*...) is for a reason, and main one is the
robustness against type changes. The shortened line is a bonus.

> but using sizeof(*ptr) here shortens the line and
> is indeed better.


--=20
With Best Regards,
Andy Shevchenko

