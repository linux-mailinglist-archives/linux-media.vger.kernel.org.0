Return-Path: <linux-media+bounces-30563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B5A9419D
	for <lists+linux-media@lfdr.de>; Sat, 19 Apr 2025 06:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC8719E2197
	for <lists+linux-media@lfdr.de>; Sat, 19 Apr 2025 04:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B805617BEB6;
	Sat, 19 Apr 2025 04:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TphLAdwX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107116F858;
	Sat, 19 Apr 2025 04:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745038258; cv=none; b=EkAoTFGC3310Q/qXPFmBiTO1JH55rh/JxmXGFSMGGZXXwVJSyBRDj3+ZJYFulJ3jD3Mf8GRTkYGeGF1JBDlaZ3d/habw6li6GPYZxWdzPbxpBo7VF+ZjOYfgA43B1iuRxaInX/yAKvo/hirptWt+lfC/X8Exq1PhgcsEOMnuTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745038258; c=relaxed/simple;
	bh=xllVgqoRLGvzGswF8Ov1YPU1Ma/P4Q74aaN5uZdOglQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEVZiDEK9NfdT0zcWF3Y/zeRGFTbN1kry3Omq3lhfm4jkdHDVK1S5fPO+GJtj91bHcISunYrKjKj6geMcm43vXJ9G5y4cLTNbWWOYeX2hXdb/5M6+aijA52eHgIOtQzJflZecPHTvo4woP+5dX7QhAi+NYGNVwLXlLl9NlL0aEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TphLAdwX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2aeada833so469472566b.0;
        Fri, 18 Apr 2025 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745038255; x=1745643055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xllVgqoRLGvzGswF8Ov1YPU1Ma/P4Q74aaN5uZdOglQ=;
        b=TphLAdwXZpm5iUErTPNDcnZQ84ICxw15MXsAuCUuSEwhMliowokCppfYZMa7iUOipd
         dKTS0bpYeQeNzaPD42CvYIIdSESPYQsJtezjatjM+lWYBRzXn8fDE2+28tHU+xsO4PyT
         ywk6lCR2d/a0U3RUEUZLKsEJ20IiVZZ2Zm8S6rYkTk3U1NpQo4mePgIXteOkM0DTVnhb
         vihO48tVGvaDzvDhLDAfzFrGXqATR2mfLF/Z7e2s2el+1TlY7UQVWBKKVkfRyYb/bXG/
         4clsTMmo9NaJW/oBKe1zt2ZoYfJ7klJY7eCDWGRqzRWAxOzY3UoMPCT9AEi0KThz9EsI
         NTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745038255; x=1745643055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xllVgqoRLGvzGswF8Ov1YPU1Ma/P4Q74aaN5uZdOglQ=;
        b=mbp6bh8gpy3MOzKpcL+vTi2ZzZ3q7qWi0zBBMcMCtJFprX8+BD9+7E/ypUDa1/gzEn
         gshpDU2LFIIGE3xle34UvHszfSdIiFWhzSodBAqCMCncJSzA1oiK2g+GHzfCnkr6KfcV
         /LXtdSzM6ulmjBXtGIlbuEfjVzNt7r8TIWyRcUKaKxnfCJ4gq7qhnqxCHS+585eoH7NB
         1fGUMPPIbbthqt7F4+vXFzLKCOIdMkI0eqpm2MlXH1goDnLHXjYOnt6TZiLMT+qzX2Sl
         WnpioxX1C+nk6n0vUWzZhK3/R/rW3qWlq0kUSiqcT6TqEYt2qrY77oN9HMJNgOOZboBh
         HZNA==
X-Forwarded-Encrypted: i=1; AJvYcCUNDYBtZ0+PtfrsItzGhgep3xegwfQwTdxjOzg26TEVJKbl5yGU+3zqhbeMgLO1mljJEocWlzj/FCZAq7I=@vger.kernel.org, AJvYcCWE+CTioBsF+oArEULyaubjVJ3ftJcBpZfg9jTbaJwNUlnnITcDRGgExpSy+SsNytkp8OgtL6x1XJvioOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMiD1xXlUE56WEha/08LPEUg8z212EZMkwx9WEoMBfx44tHt6V
	QPVfg5OGOy2VJ1mA2hNnwFiQCUmJIdCCdTUOaBgwvp2L1fQdMYya+ozejjH8I5pkDMi0KkaPefs
	xTc78hi1eiFJt5KYNzEJK3Rhz2Vg=
X-Gm-Gg: ASbGnct3gT6FEnWux9vZysPjohh13eQNLGZ+zZ7Z7DHUXCIbE8aKmp9+cN/njQRN45w
	EL38j4t6Axl8SKEkHEdUHi36CPQAp/Hep4YAFXPIYPfLtBgjigbb7m/54dc/ItF/zBGFMwB12vG
	ApSYVGtTUbogvzi7MzQ6V+TQ==
X-Google-Smtp-Source: AGHT+IGAg+Qag6lXJNxjRNIcXfUNnuL5uHrlN9ER48s4oo4qFiaVa7C2rV69ToGe51SHan6QunD9ObLsjZTCBc93loo=
X-Received: by 2002:a17:907:728e:b0:aca:a128:f4e2 with SMTP id
 a640c23a62f3a-acb751203damr353102366b.10.1745038254568; Fri, 18 Apr 2025
 21:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 19 Apr 2025 07:50:18 +0300
X-Gm-Features: ATxdqUGrYiK4kSjGmHt566SEB6DssLKQwuFsw4imxlIBfayp0v4dv5L9yVKr_bQ
Message-ID: <CAHp75VexZWxOx+QZtYneAg+z3GJ9vqneVw0XVW8rxQX7vLfzwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: atomisp: Remove compat ioctl32 header file
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 10:19=E2=80=AFAM Hardevsinh Palaniya
<hardevsinh.palaniya@siliconsignals.io> wrote:
>
> Arnd's patch [1] removed the compat ioctl32 code,
> so this header file is no longer needed.
>
> Also, there are no references to this header file
> in the atomisp codebase.
>
> Link[1]: https://lore.kernel.org/linux-media/20210614103409.3154127-7-arn=
d@kernel.org/

Should be rather
Link: URL [1]

>

...and no newline between it and SoB.

> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>
> ---

Otherwise LGTM.

--=20
With Best Regards,
Andy Shevchenko

