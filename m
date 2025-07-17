Return-Path: <linux-media+bounces-38015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079EB08D95
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C192A3B6543
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB3D2D878E;
	Thu, 17 Jul 2025 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrRxBStl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5B2D46AD;
	Thu, 17 Jul 2025 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756849; cv=none; b=L5abjRIm029NANUNtqdRmgUYl4tcYrPFwoxiAMJAoRF7r1fJBKC3HVNOy/gWDqbTQcLQNYP+bllgVWTA02DXRJZDz9Ny3lTVSdEAbWQfROdTH6hNTTc0TTIadPzo3FLP6S+7AROf+kJ0kGQEa9dsetggvubEvFBf5IWRdTLr/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756849; c=relaxed/simple;
	bh=6TqfmLAeBvpkFMFttqys3Zi3RrrHoD67gu5Uh3aTgmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOy3Uu47nwIvHbE0yZvZ+IPZ7wdy3mUmfCwWima6+TKYo9Ae7rMubzimkKp+Q2SKfxtNIJC+/p7RtGRlQT4Nd0V9WQpPUbl1boKiBcvEg58tdtSIrIEuIaIEa7D2ynRO9R6U4WzQ+BUTb2vT+59hUqbfvUe7vD5KpCU+76rMpUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrRxBStl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso366549166b.0;
        Thu, 17 Jul 2025 05:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752756846; x=1753361646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TqfmLAeBvpkFMFttqys3Zi3RrrHoD67gu5Uh3aTgmU=;
        b=OrRxBStlj3bZYFGwn/SrPad57cYkaImlmktRRPR2bAGr9IdfPuwNmEIFO8lvaLX/bg
         38F3v7FmKWZq6MQRs7XUw62Xx0O+vZ3U+JwS4/W2iEGZ7uaJOZr0onegB54oeOujHd8n
         eMrxtmqcT/qJfJ81G4Fs65/YKxC4V0vEWd607IALGXQ+Pc22nwXfN3kx05vlgLaZwug1
         fxlnlEZF3Wy1z0hmzmnaOBm02mWgoq0ZPXSh6+jPgVPFxrdnsEcSt5Zl8tnf2XyfiJVX
         IdbRgIKPdhzPkMaM9yeuNS4HuC5i3Mghy5H8IR47mpWddjocUH2oMMPeKOulifU7YiVO
         KctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756846; x=1753361646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TqfmLAeBvpkFMFttqys3Zi3RrrHoD67gu5Uh3aTgmU=;
        b=lYHPpO2eMyGe70lPektG4a12W57YsyS60wJqPV9j4k1qcPDbRmVL1UWp+4+AOwFX2U
         rlZYR+6qKGJPqlVBcvzqSievLDnU2wF03sWT2GKfdwnFjvX1HsdW2mR0nGNQgSMgbo4M
         th0Ho0+Elcn5bZ1lmPNU33RXbIJROLjSZH+zvyAprycbYq74eRODTqg4kDTQ+Hhwl4et
         29hRjFqlUijo9LDnAATM/n15Y/7riP1HGd3W1mTBcCTyfgBwIIDRDC4w1k2m7APGJios
         Cj2ygaVsmjISYro/AzsPZWK7GJCG4MnXpCVnPTQ2jmSzQOK9Tt7o+qGlwbVbONoaHjeW
         40Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVh2diaO3rFYnPX9q0s84Jmg20H/Az2c4CFKt/UheVXKi3dNq5ZyGXWUyCUm0AUlfVEJv3nCd75r/PDLY0=@vger.kernel.org, AJvYcCWH891vw1g0eVUaglAKC74aTiWem7xxtTPk3qQFZ/qi292fQOzgY/KFDiGLNMQeVG0nzJDvBGoYD+GjZk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySlfwhvRQwZcoYUqhjIKQtBI/6y73zMcBjajVOkXRTNsLiS7BO
	/pjhmmiem/physZpE8yVV45H6gNX9s9+sz+aQI7RCSyJTewTeDW4BWu+HlcbQcx+WOBubOP1x+v
	EOLSj9fzPBHJ/LmGvN3hbmH8gQ20HANo=
X-Gm-Gg: ASbGncuPNFmhGt8vLI+kRFmdvgNauZn71wgFbIGe+yI36PDnVpTuvJjF4sNT73UH4CX
	19FETeYOhZHiYqGmXPvADz+c6b8z9WqGh/lUvIRs9064gUVFXxeVvMrKbVoG05V6ZIOuBshc/ac
	V0idz8DgkSe7JcNAYHoAWX3XhdPHO/hF4w6WmklINTBfr+0q7Selie1tjYGxbwRqHU2fUaTSRJf
	UiQg6sgRQ==
X-Google-Smtp-Source: AGHT+IGwgcvfuosm5N+DZ25mI8Ik05xk7HliuiBmFYrl28GiWWkRW4WUjkaBwNjkPRhTpYEMuODvsj0bfLReIdUzIcI=
X-Received: by 2002:a17:907:2d86:b0:ae9:cd0a:5827 with SMTP id
 a640c23a62f3a-aec4deaf092mr281081666b.20.1752756845076; Thu, 17 Jul 2025
 05:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 17 Jul 2025 15:53:27 +0300
X-Gm-Features: Ac12FXwwqnptpnT5aQ5qlp88PaC6-4KM13ZfLkpBCRIfiqwB3k8OHjQ8YI8f-Yo
Message-ID: <CAHp75Vei5e3TMxTTWXBZVWsGqFbYwn6QQoOKz-MYmFd4xaTraw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 3:43=E2=80=AFPM Abdelrahman Fekry
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

Now LGTM, FWIW,
Reviewed-by: Andy Shevchneko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

