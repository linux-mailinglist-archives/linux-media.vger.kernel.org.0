Return-Path: <linux-media+bounces-37841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E0B06FF8
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 10:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B09E1AA3BE5
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 08:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EF828CF5E;
	Wed, 16 Jul 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCIRgVe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F1D28C2DE;
	Wed, 16 Jul 2025 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752653499; cv=none; b=gtE0U2FocIRGBy9k06MazkudLiaNvPPbEBut2bkcDpHA4s+/mX+QFDZxw0CuzlU6jpyUBgQ1FEdbKyHXxt9W7N8TJqCe2QXGt8A24GW5pt0VZAhe337rE/+vq1hQWYVNqJrmZMjfXyfl3l0UUWvenfs5+qQqCh3syXx6I92jsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752653499; c=relaxed/simple;
	bh=k79BMsIbK+zTQT1FqOMBe93RDWwnnBPN6W0nNfSHYXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZKXpwrYUNZ+05yR1mk1+hcz5cVn2r23Ww8R0e3dzoAe7iZRdQgDDPNBBBnXBPLIh8WVS75l7RiTLKDRjTq49DFlFEJNki9beH5dDMjuFB3Fs4PaItrl+4+p7OEAJaUq2sn+lLde5tyEMGZnN5s7EByR0volyFYxU2kXaXcC0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCIRgVe9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso10528960a12.2;
        Wed, 16 Jul 2025 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752653496; x=1753258296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J10ZHGKZA+2to8uQChpxJ+la5LZtKmfI+OysvrYK24=;
        b=kCIRgVe9CO6PKuI56g9tA8ZcBpL0ju7HnlCz/rVD3gjMubo0m7reW4ZynYBLh8SMpP
         LSmADwc0d6RfUASsDfy9dkwoQdHz2evRTR/Z6BA6h/TFQ+248MUJGCk1phwrkykxZ/ZD
         XS2pnrHuPw7YaXAh/84ZG1peiocejOeZ3l0/0NEG+eawhDrIIgO3ANbqITXI/t+EBTJd
         /9BOARuLZk14ND9MNDAV6Uqu0mduLimUQYZ80h5QboFPWXs+MLOI9F6xZ2oRb2QU3NQB
         6VdZCOfzDJ4XGkzze2jl7tKtZbmysFx2FsMPIWTg/VHSvzU97QieHuGK5/pSSFzMF22i
         oSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752653496; x=1753258296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J10ZHGKZA+2to8uQChpxJ+la5LZtKmfI+OysvrYK24=;
        b=HMTgU7G09HTjxI/0tkmTpDYa4WSyQNQONmxL2FglyDh0W/Hi19aeRXvX7FZujXhQrO
         YZrorYOwrNBOZhJ6vC2CNMk9D8MdNftIEXosbzSVGlmt1jHVhJ/8Tt1F4g4pbG9yJjPZ
         2NQrBki+ND+Hrch7AFJsW39Dz74XB+DsEnzRXGQyz3a6FJ0BycrDlAK6QtXpdpKntN4b
         IBTJvpa5eqEXp1MjrB57jq521LaxMFPcCpxwbf37dQJ5JwrYf1Emfgq3aIYi2Yx+Z2IG
         R9A3Vn7r84oiE0DHxJXuGNe3mmNyuscERhLxDhUpMhJuvlfoVefvqy4F5KK0whgRQFXt
         4Avw==
X-Forwarded-Encrypted: i=1; AJvYcCWVRI/VsxO9JTegSyS29EdVazT06UjeUA+uCLCUr/cXnvKiQqmEAdwivD9pgxQ9pDIPT94VO6dep89/8mA=@vger.kernel.org, AJvYcCWdAIXMDpORYjjbj/U6hzDbzueSXb2G1HS4OhQyJUAQ6Oq/Ip3Nz1/jKgBUyTe7ts4AlmgydCWEfrrqyW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt8tmjW6PJKXHZBhfQitmXipDwhqihSG1wX8XfQf89Y0bxWgpg
	yRguwtUBpUpsnXGBIG5VHzvOpwQ/Js5TT9VEC9Pb/p5WMJUEy2R05CPTEHYvk3B3Kb/BSL2xFlI
	nHkeqTbPtfaBYmzgIaW2Ufb2xoEmpwFk=
X-Gm-Gg: ASbGncsUiHr8gqvshnQ2cHM5oAeww3+TzNr+EcFpcz2tONOazKFdYJX01bj9RVtc0bd
	fREXt9X6rPJPmOF21UsWhplpTX2Si3LWOqMaWuug3Cprdll/6te0HN2k3hOI1zUkYjsf4EOdWAr
	Q4eKXto2OFi0cSNhv4IDwQyOL7Md07djIjQx2/jrceFuBl7BHvWChCerjhYXRsNVuzmC21errXr
	GgKoX5C/w==
X-Google-Smtp-Source: AGHT+IFdUeFRiLRYSzyqZz8go9Y8LtsVEDFel7v1v4PGl5CPO196A/RSkK7i/IOWULX4PwzobdlFqnfns3bzAhWFF2E=
X-Received: by 2002:a17:907:f1ea:b0:add:fe17:e970 with SMTP id
 a640c23a62f3a-ae9cddfe2e8mr163141766b.14.1752653495712; Wed, 16 Jul 2025
 01:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250716014225.15279-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 16 Jul 2025 11:10:59 +0300
X-Gm-Features: Ac12FXxtN8CIVFs4-2mQKtJils4_U3AeV1g-oFVo2bsh5PDlNAO4qKhAGDd-3Bg
Message-ID: <CAHp75Ve6rE22crmt5mUioWtkWm_-ODV+Dk2gcTQ8ickhMMkvAQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 4:42=E2=80=AFAM Abdelrahman Fekry
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

If it's a fix, please add the Fixes tag.

...

> -       return atomisp_set_fmt(vdev, f);
> +       mutex_lock(&isp->mutex);
> +       ret =3D atomisp_set_fmt(vdev, f);
> +       mutex_unlock(&isp->mutex);

Side note: Can you consider switching the driver to use cleanup.h
(guard()(), scoped_guard(), __free(), etc)?

--=20
With Best Regards,
Andy Shevchenko

