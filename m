Return-Path: <linux-media+bounces-31125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C82A9E37C
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 16:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3EA87AADB1
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 14:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20CF1A5BA6;
	Sun, 27 Apr 2025 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUz0RzZK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EC779C4;
	Sun, 27 Apr 2025 14:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745763867; cv=none; b=PnKtDE0BhGgc5tCXPOMbI5MMviOPBYEjlRhCqvkgNN1hin00GJfQQKVLsLgy4rKfnXAtOtO+Uqpoux/8fBv/U/xhxiVPJYRoyUnhimVSrUA6dS9dkYC6b2YlFqNrrPcIoIx/6R3Ftk64irEAIZxRYvDYVTIvCUx/bdC5CN2Yn8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745763867; c=relaxed/simple;
	bh=CYELTFpR5RO+UOyF9XdelPjNz+Bh+smiwCLw6IrLdZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BfydODlMa+fxj7gR9FXW2CyQJphJdPUlVmzEdlXFyYKYGXTU85rbJDO2BmOMRIcKWHpK/TbMws6n+pF/qYC5ZC9repbfgEV/wjazLCCFvMm4McdjJJMcclcu2ZtEiTz8mChkmITjv7cidEJ2gm5EK/MsBzeU1h3KuFb8Wkc8zi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUz0RzZK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso7385117a12.3;
        Sun, 27 Apr 2025 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763864; x=1746368664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTdCSXyXKLGjb4xxRuXuC2QAcp6Bhl4G5LPZiZnxAkg=;
        b=CUz0RzZKR05KT7vLGB8Rn5afblt+COzKsUCyeZ8JqLq2msC9J+R6ej5B2cNnKYXpqZ
         BEqMOLs4MlqUStdcW6t5YA8rhr2cep/5X/zx43YnzmQdmcZPmZf3Kcqog271b+cWqGa6
         VJFm1O6xO+SA3NszDUSM40+PuFuZSrbQBtN0s6+qs54HLZ5u+67pPgu2hfIlgAlvLLuF
         AwWuh4kAx8lm5OYFP+WJ2Mskdl7Ojl7AM0DtBzaJiCO28OTfkGM830l5Wy6hT04KT9lo
         tpW48Zkw+9jirf2A1qBvs8PXGuOy0wf5tNoyJ4inDptr0zTuxyEDIqwiBxC4YRffbq0Z
         mexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763864; x=1746368664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTdCSXyXKLGjb4xxRuXuC2QAcp6Bhl4G5LPZiZnxAkg=;
        b=GOrhTMJiuoo0xAoHPiQDUa/iyugy3wuz0CkX0hDXNIUTd3+V5rK2IbfJYVT8SXh4SB
         sOKG2HQz6M4nBrVcFZs9BD0R/UalY9Fok3QXPjo729X9hBdFOP0ZzYVONLShdygz+fqt
         sJXFKWe5cINXvqVqiEuUwpw6MBT44U6/fHA4TBg5JtMGfAn3gtHs8uWLWSsxoqxBIfXF
         NuKaoXval8kmzcI5D3VJmQCF/oNK49mQqo6Z7xg5O6gX6skUPmKsBIMNiVtxkU9Oxmg4
         ZmW+o5tG6QNntROR0UDYWz38JCH44sp6RfyPtH1avI6klqrqJF9r1a2qhuGX5xoJtOKv
         2SxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPt0x6lHUEvrvZhRP3u5znZeERZn1KzlsAR0deTBVWZPMwhAmS0LapezBpfnGAFh5SLG5KC9Rl899KFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZriykhYm0X0FNM4WX1p8XUG3bAURiX8CaH5PUA/NpKBEN8ZFk
	t5kk0URWnv2d19/A8XVmCJgvDTz+kx7/XQFTR+mHY5hjo2j6bsqf
X-Gm-Gg: ASbGncvMM/X9vfP+PTe5NnEMLOXnYaCqPINMSviwp9iZf1WuSdUZzfLcQg2z5PngkLV
	fp7em6SLTupiCRlUulqiUTLb0WtDKenqhH7befM+y5aZYAVAR2gIlQiTEwlnrSr6CbMhX3aCnfE
	0rYn8ZfJH79P6M5zMoa2Jxo6Yozlcm9SRTrhKEZcXGJ9+oLGa7AtDqnGRczW3HPfPPAEZE4U5eC
	dRej1E7Z6WHbZTtgeU1Kr3BWB1MJKaEGYjFQOHl2cX8GsJWgeHFoLbqtr9xLDm0i76D+3v7HU+l
	WZiAO87BVkgwMnzSh6xMtKzjrcA5R8OT1K0HCBKAfzgMj5qzSnoY7B8LgK4hvxZ2pWeOZL8dGlC
	FvkQdcQ6eiJ0rCX9Bw1vIZbTXWFvb7OQb7n0LPgVVB2jbiXnAKCV8Gl5aQ4s7VCRbP98Vu80tl9
	0hBG8n5+2pGZjb
X-Google-Smtp-Source: AGHT+IEGGx+E6y0ja04a6qnyw/DrZz43zsPPJqJEON+oYaLNJPZ/6oFZnmp5gDVsYnh60N40JF2ChQ==
X-Received: by 2002:a17:907:97c9:b0:aca:d54d:a1f8 with SMTP id a640c23a62f3a-ace711175a7mr969009066b.31.1745763863610;
        Sun, 27 Apr 2025 07:24:23 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-1150-51db-ebed-e084.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:1150:51db:ebed:e084])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6fea9sm447956566b.127.2025.04.27.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:24:23 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: andy@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	thomas.andreatta2000@gmail.com
Subject: Re: [PATCH 2/2] Staging: media: atomisp: style corrections
Date: Sun, 27 Apr 2025 16:24:22 +0200
Message-Id: <20250427142422.88271-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAHp75Vef0DuupHr9CAaU9qnDEw6O6KRPaO51uzrKXPwvfAiiJA@mail.gmail.com>
References: <CAHp75Vef0DuupHr9CAaU9qnDEw6O6KRPaO51uzrKXPwvfAiiJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Apr 27, 2025 at 12:41:34PM +0300, Andy Shevchenko wrote:
> On Sat, Apr 26, 2025 at 11:15 PM Thomas Andreatta
> <thomasandreatta2000@gmail.com> wrote:
> >
> > Corrected consistent spacing around '*' and braces positions
> 
> Missed period.
> And what is the correct spacing and why?

I agree that the spacing looks weird and I questioned it too, but the script
checkpatch.pl highlights as error:
`sh_css.c:336: ERROR: need consistent spacing around '*' (ctx:WxV)`
`sh_css.c:338: ERROR: need consistent spacing around '*' (ctx:WxV)`

Should this be ignored because the script tries its best and it becomes common
sense that the suggested spacing is "wrong"?

> 
> ...
> 
> >  static unsigned int get_crop_lines_for_bayer_order(const struct
> > -       ia_css_stream_config *config);
> > +       ia_css_stream_config * config);
> >  static unsigned int get_crop_columns_for_bayer_order(const struct
> > -       ia_css_stream_config *config);
> > +       ia_css_stream_config * config);
> 
> No, this makes it the opposite. Please, read Coding Style if it sheds
> a light on this. In any case the kernel style is to avoid spacing
> between asterisk and name.

Understood. I'll resubmit with the correct spacing.

Thanks,
Thomas

