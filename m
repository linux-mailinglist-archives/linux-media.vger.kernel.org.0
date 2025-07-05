Return-Path: <linux-media+bounces-36890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF1AFA11F
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 20:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1E8A1BC1E3E
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 18:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84608215F5C;
	Sat,  5 Jul 2025 18:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds+vSmUI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B3B10E0;
	Sat,  5 Jul 2025 18:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751738893; cv=none; b=tuNXdkT4h7Yk3JHZoEqjzaVgJNKBAMCuKmiquUqM+HBOm0QN+Zr5zdWDXPB7XEoprGPvc6GnGh7L+Zx8EZdyLmVQ+jLVYiOpASCDxQqzzKO28G7AFObcxMaDla7eBTrEfHPxe1PNqMBgEcsdGwZLmYL3t6urSduKtiDWCpQSiFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751738893; c=relaxed/simple;
	bh=sGKGIQHy+zTRytEmBftvQHpzONQDr6+oZMPB/S63mos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAkHxiYYooMYhu7jwwe+mgMirmGzAzC7W0NGxM4Yi0LwjorCkvRR0OlpOmLA8XDXOfcFtfaSGRCvF/Lp887Muv5PE0QKTtDIq4rZjsOYWy5dyk6hvkivw5dzBVq01EF6QDffc5JoSRv7vKbGw0xwONTmOVZ1bZQ1JqfvrC7v1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ds+vSmUI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so315031966b.2;
        Sat, 05 Jul 2025 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751738890; x=1752343690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6bLCeGDQeQZMQiRFxTeizi9tOxgkfo7gLog5AhFDiY=;
        b=Ds+vSmUIG/QFONjmv2vNBoCQX4JJZ5BO98j8lRjRrm8J3hYlu1kzVKtWZYtO+dGD+c
         N2KhIxNr5NiUGeIvkLC5Kid6Dw9NPZYxIeTEPOZ53NmoY9rjm9IPr3nflh1/Oh1Seq/v
         mVwhZbR8YjnSNitzZ6fT65mQI06FIf3OPe01Nxj3pLw8cZUudd4j8sW1em+0R/W4MSCK
         o0dCertprkY0GCLamAcTWdP5WhPu86cRnSgqLzJCBlscUf/8xDy6PNxphryyHho/69xN
         9mFi6Gd2geI3pk8y6t6Va/tfvpqDoH5hjFSRIyZQtwi0zD0d1sPmDfWMdLl/dqBDrf5H
         a4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738890; x=1752343690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6bLCeGDQeQZMQiRFxTeizi9tOxgkfo7gLog5AhFDiY=;
        b=d4AWE3U44PxaGB5Ql1k36fiWOIYfCgoKZV4M6zIPad7r18uxZF85rITVXiRT/UlKgC
         c8N3/6YBW05E38nFNLWrGFjPgpQPm1c5O+OPsM58o9u4T0QQ7O1KUQnkWLSKsPPsrcw0
         0+7xyVyYe3C37exhTOEiCdlyxHDUtCoRZyt5FQS33Euit+kLmbhKQBcUnegw896olQ3W
         qTQX1zBwvaipp7XZjJN4Afia13IdBz6SFFjS1OFpWsjyNGktsiVgxh02Wx4tbosTNWsR
         Nmq1KwkzFhVlYOi5mObLD55OKJ+6eQ10heN5y6LBp44iPKSBihdFs0SsEJ6KuUw7N/1S
         fX9A==
X-Forwarded-Encrypted: i=1; AJvYcCVWlvnfQLXjwapScF8G91+Ktb1yTQScEdCa4Ree4ueBKbb0VXqQrjcyEP+gAd2kZqnocgYNPYlQYhKCQ/E=@vger.kernel.org, AJvYcCVtTaprArc17rsnG2RZK7SoptgVHKudSKJFkSHfpOC80yOhaeMz7lA/wkzl6gW8JGFM4MxMmTCZUDOX6XM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+JXDgqPRKtJxvl0kqW80uJGKu+cIloEygpzfXDQmUlclo0GQ
	G/ab6te7Fifcmw34wKkw4NiUre8B6CTrw5bkYlHDU+spekRLLY7cdFX3v1RNiOu1TTdsDQSYxCB
	irCZWcO4s3AUtNeEO7r4e46HQliX3nb0=
X-Gm-Gg: ASbGnctJj8IgyHpDSpyCtsl9P8wdQl82w5XP929QrMqjDqQz8chtjPuYMX99sTv3lJj
	0DfWZg4rmmf8AKwoqe+Yy47ASEYzhTO84snSaeVO3T8MgoB7fPfqCGrU6hGff1RPhY5UOsHHrxZ
	hYdLbHQGEIU50cdAwvaYxEM1W9PTtGVM06VvHmvJEz6uQ=
X-Google-Smtp-Source: AGHT+IE1Cq9p7cSRPwynzodWAgvfMOthEeUmfHLyjt0H+yN/aOpw20qnU0FfZWE0no1RyRBUbeVhXfrrZRL8oMEpcxc=
X-Received: by 2002:a17:907:3f0d:b0:ae0:db23:e3e3 with SMTP id
 a640c23a62f3a-ae3fbc56f54mr719319366b.16.1751738889527; Sat, 05 Jul 2025
 11:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com> <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Jul 2025 21:07:33 +0300
X-Gm-Features: Ac12FXy8HqGDde4LXMXnmNirVLlHn-id43g2N4hLH2kwDt3orbiLIxl4Rxixl0c
Message-ID: <CAHp75Vfc7QsENHsaYMKau_4DU3-LmW2XaUxd=oHqTS3F3R85eg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] staging: media: atomisp: fix indentation in aa
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
> This patch fixes tab/space indentation issues in aa
> following kernel coding style guidelines.
>
> No functional logic changes were made.

...

>   *     ISP2: BAA2 is used.
>   */
>  struct ia_css_aa_config {
> -       u16 strength;   /** Strength of the filter.
> +       u16 strength; /** Strength of the filter.
>                                         u0.13, [0,8191],
>                                         default/ineffective 0 */
>  };

This seems to be a kernel-doc format. Instead of fixing this, move the
description of the field to the top comment and make sure it follows
kernel-doc. In such case the change will be much more useful.

--=20
With Best Regards,
Andy Shevchenko

