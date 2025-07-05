Return-Path: <linux-media+bounces-36889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF56AFA11E
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 20:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D163A28D7
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 18:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A7A215793;
	Sat,  5 Jul 2025 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQ0ppzwP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4010E0;
	Sat,  5 Jul 2025 18:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751738781; cv=none; b=Cqn9ulXtt9tKwJ7p5+BB6HZnBwx8owea9kajsHsJLy971/PQ1EodI8aenCo0eibr5BRgbQWBKMeAx/gTnWV3DMRwX35U+8tMtPbh2ZWwtaH//6CzNEkT3eJoIPj9buzI2Q7L49e+GVvsgBOpcN+bmevguiy5dEnoXMXq0+KZPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751738781; c=relaxed/simple;
	bh=uR59lb9H/lfgoU9Sn+rQKcQEZ1rNsprAnKuqExnCuvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/8tN4lQXDVivxO80bgGOFDgRumW+5b3NUO88edWsi7FVyXawwUy+PaDt8J6IeGPVsinAyI2XxhIIzURMEHxeCdBa6eVHExh5YUs8Ek/d3+t5ESvG7QGwJlM/x8BL2OHj8FSp/zocRsCZGn5+9JGtqBP4ycWPuL9nbnIWkvbggA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQ0ppzwP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso3519903a12.2;
        Sat, 05 Jul 2025 11:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751738777; x=1752343577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r57m1/rYYXdbfa/z4iUUp6uIVwbvm+uoIkvDFGx3vE=;
        b=kQ0ppzwPTFrlZRX2WbThbDY6e8aXRfZyVnTGHbVriO2EPPlus2dpM+Akn7ZR+6pd/W
         mSY7vYuDqmD4k72VSHn+qzrR1MQEqPJhmAnDWYMZpvJ33qfsQdPJiTjkxKO53c2hSEiT
         jQ9gENlY4eHJRgu9yg1F8nO3PCTXHgFLUObixMZiqy2dAxyCPF3+JGoOtYzsjE7ooktK
         CXPgjAgnOqzB9SKXzbSrFgXFvZFyiqgoLmxpZsGeI0IvO1on5xXitiH4jvS7Sbbe5wn7
         ZLHN/3oxjw2bZ82olJGw6NYyHispOShg9Eg9xg12eu6nARq//VOhXbC/zloTZHqVO8dO
         zsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738777; x=1752343577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2r57m1/rYYXdbfa/z4iUUp6uIVwbvm+uoIkvDFGx3vE=;
        b=PoFXYaP5ragP4uCsISmwnNFMeDhX21y6RNyaG5igHUCqg+/1cjFDClCIpbR8j6zW4m
         FFvIm06YfFeMp8AEYyjqh3ksQ+d9dqWp6Ih8UtVfF15DLbZeMom6mENWSw/TBDtOYMe3
         gDD+l4lpLe8p/CXpYMSeGN9NVRk8yHehU0vzFm6E7Zb52erVswCZXA9zEiGbEhiwrILT
         1flJO0SsuZ4H6PT167j9ovYFBAPlq90TMmIETF0KAqH6N3QxDhgDup8h89WZCBvqdma1
         tqC7+m4H/z00khy2WE7E06n6Cf5dp4zGKjSqINNmP2LTHJuFblV4gn7cAam8BpEpI7rp
         MpWg==
X-Forwarded-Encrypted: i=1; AJvYcCUaCdmRahKMoO+mN7HbwnuU4CRLySUadCmjW8tHKAq7OmawD6StqoC/b/m0QPStEWjtcHzL0f2+pPSjG0I=@vger.kernel.org, AJvYcCUxvc5NuZHzWKP/f/GVojazAsoyS/ckK59BfDC0HsSHpYmNnARuM/7zdNGRNBt3dXRAivzJn7Q7geGH7NY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6XT+TGU0oN6pQ+L+lnBTx5f4oxrdimHN3BZX9g+pJ11fTfn4
	+A/YTPqK1ssAuAYsW1E7BopIQVlkz895e7RzdQg2rCZJUvNmLbDzWb0Aj4wo1zLA+XOGvhWNNLd
	wQVPkR9TWDyY9Ag866T35LCT4RHkemMA=
X-Gm-Gg: ASbGncu5mzUHSJQ7+LvloziW5RZa9zJBV44BOUaZmkkFIQs+BjYeNKNTv/BlYJQbtUS
	izp2yQxuqLcDOLyusemGjjqfVQONh+0mVw2MmXneCN7D88gGLHnVjqOpgr+1Xz4O2c+WJMLFMbu
	w/gfo3mv8taFbKDn52/esADOnZV4+Qffk9uBZDR41WI8I=
X-Google-Smtp-Source: AGHT+IEDfHyDt38OunkkIya8vKcdY96VOV+ryvPNgk44Qbne1Sw/BiXVwzmd0z0H+gWDDQpeNgZYUITNAg1JkyW8CAw=
X-Received: by 2002:a17:907:7f8d:b0:ad8:9f9d:b139 with SMTP id
 a640c23a62f3a-ae41079eca6mr259561166b.5.1751738777030; Sat, 05 Jul 2025
 11:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com> <20250704-new_atomisp-v8-2-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-2-2a8560cbd9be@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Jul 2025 21:05:40 +0300
X-Gm-Features: Ac12FXxc0pLzjFm1T_riYbWX52EozYkvE-lyJ6R0GNlauuX5KTWJMb5xmhXu-8U
Message-ID: <CAHp75Vdd8aOhQ73opych5WohuM2CXq2dPgdgHW0ZdYHRU=u5WQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] staging: media: atomisp: fix indentation in anr
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 6:41=E2=80=AFPM LiangCheng Wang <zaq14760@gmail.com>=
 wrote:
>
> This patch fixes tab/space indentation issues in anr
> following kernel coding style guidelines.
>
> No functional logic changes were made.

...

> -       {
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> -               0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
> -       },
> +       { 0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> +         0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> +         0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
> +         0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4 },

This change is not okay. Please, leave the curly braces on their own lines.

> -       {10, 20, 30}
> +       { 10, 20, 30 }

This is okay, but also makes sense to add a trailing comma.

...

>  void
> -ia_css_anr_encode(
> -    struct sh_css_isp_anr_params *to,
> -    const struct ia_css_anr_config *from,
> -    unsigned int size);
> +ia_css_anr_encode(struct sh_css_isp_anr_params *to,
> +                 const struct ia_css_anr_config *from,
> +                 unsigned int size);

Don't we want to have something like

void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
                      const struct ia_css_anr_config *from,
                      unsigned int size);

?

Ditto for other similar cases.

...

>  /* Application specific DMA settings  */
> -#define ANR_BPP                 10
> -#define ANR_ELEMENT_BITS        ((CEIL_DIV(ANR_BPP, 8)) * 8)
> +#define ANR_BPP 10
> +#define ANR_ELEMENT_BITS ((CEIL_DIV(ANR_BPP, 8)) * 8)

Doesn't look like a good change.

--=20
With Best Regards,
Andy Shevchenko

