Return-Path: <linux-media+bounces-37937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C934B0846F
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 192A9A41A6B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 05:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9A0202C45;
	Thu, 17 Jul 2025 05:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cyn8J0hM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FC17263B;
	Thu, 17 Jul 2025 05:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752731905; cv=none; b=blNN5cvFZD8iVRhCy6cOZRp4u290J/1wwjsOMHNpxYsF38udoFc3zkkaizWvGuk+zswq81zVuToaUaTf3ZSM/0w9VXfKMtFxypsV07cTYVNlWJSLKrm7ouliklSnOYRW844WmlgPmmRGQ+Y51iheR3qjV0R3IZ1KRX4BvayVQx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752731905; c=relaxed/simple;
	bh=GzaeNvGgBNjYJOHg+v353vPVI0VbmmbGU8uUuOb+dVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c//FFG02JCGNEq5ua6yjVr2v97zf3cRPNBPehA55ah9a5nqip79R3FHWdogZWjpKO4eS3AaT82ybAi7bOtMNqMxbmPxyZxGIdYzWY4bpKjvkhzlGFTRcgMn9xN49S7apD7bD81WXx3P5EPQEXlF/6Za5pz8XRococp8EgAK3ArQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cyn8J0hM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad572ba1347so88590766b.1;
        Wed, 16 Jul 2025 22:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752731902; x=1753336702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIRTijv9i7tleNjJH5h95nFpr27ijpYUBRAXq3DNagE=;
        b=Cyn8J0hMxBuKHO/Ccaj8FKA/jvxZYDBNMyN5baGk9rS/U/l6L3VrZec5syPiX05ipS
         aQuL8iJd4NjwCxutgpl4V2a//dTbZdpHhcbIQztDjInldA650NUn2IUzbJ9NfDVXBqCG
         /862pra89Mf+Shkzxuj0z4or9RQcPAUvaPyjcxReltGs/cRyK+Yg+EpEFskf4CAI6M4F
         34nFmLsaUUu7F+uKKC7mRWXE5vfiEtpg6jn2vC0Uwwx5UWJnuqCAYjYi45Tg/gVIVLdP
         saVoR14J5qTIvi5YYQt/7DOIz1BWdyksjzFeyZVkW+eFgDvjQa9eyKxuEGMrT60FX1D9
         AT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752731902; x=1753336702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIRTijv9i7tleNjJH5h95nFpr27ijpYUBRAXq3DNagE=;
        b=weNFIh7SWCyP1yxOc4VKW4OxNCY9qMLQnD8VA8F2yyFqmgG0pFjUNneicfrLj005yV
         yuR6AWcxW/e7d2i8ZdhAGhW1OKkzMnzyOBlzbDK9+Tbr1euUjB4WFMluirw7IhfzwrN6
         abj9XImkRqQzkTyiY6BWU9YNQgZhfxYP0WXaIK5axnrniaMJo+ZKWARaQrBfX2qN2kDu
         xo+Ma5NurksMTViF0xUPJ3rSeTCw9mgAOSA3nyLhMwHdncsaHZoNE8ngi+Q00ZJRZiZL
         4KABVlIgjqK2SHxAnU52LBoOn3uXyzPrm4P1mBMGeysPWAb13arr+sz9Y7SXPi5t2CK7
         v+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Qz8GP/yFvnlVTfQvWLefQ/vzRq2MeJ5m4N6uELF3XEbt8LW0/7Esqexzx4n05xlU+C6BM7riqOeF/V0=@vger.kernel.org, AJvYcCUDoD5scvh0awg88NGdtBLwtK7q98l4CUHKz8v/flaXImk8pB8XDvtPNdONADxdnqBC7s/vBURDZ1UpKa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDXJynj0QpvbHweLNWQBrRUxiZaiorvV3RZkVrr3G3AGPXzCY
	epvvzGYlbpUBPWAjdnt4MIBBmkrayVCb0aAHHhivjgKd3t2ibPAP+dlaZwWpgqHrUFb6zmGnqQP
	qr9lbcNuEAIXmjD10oDqhbGc0ZE/qXyo=
X-Gm-Gg: ASbGncs6z0EbhyUaml5racYYc9u1clvpld0LWPpbyuVrC9/R7UGzT35IUcpfrOYi/cX
	Y+DB+kpudyCsmawLYcMsS1yed7bwJ+cXbR0UcuRnjKXJM3xsv0Yya2Uy6L9B7F5D1rLpiEaNsF0
	ezBIFBcxObg25dDfrJmXjkbG87KxPUv7KxHhRYQBgBCeSE4Ua5HECj5dOtP6xuD51Rg7mRbqNeb
	ytPm+0b9A==
X-Google-Smtp-Source: AGHT+IHI5thB/F2IFWJUiFlPA/6j+NF8ktS0u61JpA9SIcP0uSP4e1OxKm+GBgDu5WWhK82Gm1N5+7hJlRvgmyvD9u8=
X-Received: by 2002:a17:907:1c10:b0:ae3:7c8c:351d with SMTP id
 a640c23a62f3a-ae9ce1acb18mr557820566b.56.1752731902079; Wed, 16 Jul 2025
 22:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 17 Jul 2025 08:57:45 +0300
X-Gm-Features: Ac12FXxVS-slXnx8UX3hAelqaVMWQU1Khdwpoqjuk9lr1S5_RIlvpaD-SvuVP9A
Message-ID: <CAHp75VdpkswJiuA9ems_7o8i9W8HWN4BredO7qsaR6HjO5TxdQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 4:30=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The function atomisp_set_fmt() modifies shared device state and expects
> callers to hold the isp->mutex for synchronization. While most internal
> callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> V4L2 ioctl handler atomisp_s_fmt_cap() does not.
>
> This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> pipe->frame_info may be modified concurrently without proper protection.
>
> - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

...

>  #include <linux/delay.h>
>  #include <linux/pci.h>
> +#include <linux/cleanup.h>

Keep it ordered.

...

> +       int ret;
>
> -       return atomisp_set_fmt(vdev, f);
> +       scoped_guard(mutex, &isp->mutex)
> +       {
> +               ret =3D atomisp_set_fmt(vdev, f);
> +       }
> +       return ret;

As Dan said, this should just add a (one line) guard()() and no other
lines being touched.

>  }

--=20
With Best Regards,
Andy Shevchenko

