Return-Path: <linux-media+bounces-60101-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMKZIQCB82ni4gEAu9opvQ
	(envelope-from <linux-media+bounces-60101-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:19:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 213764A58F2
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 18:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71D0B3003353
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 16:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B034611E8;
	Thu, 30 Apr 2026 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qznVMYUt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE9344D9D
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 16:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777565946; cv=pass; b=jiU8V4bRf7Vhl+SOaYxJf8QYkvWOgR+0KxqE7xjoLc6L/vUQb1n0WXcnS0qKzfhm3bFI2CRUBGyG+m1yZsIMmY5YqVAfOjcO5TBw66BnsjeDeH4eqDjvfpRnyFPn1FMV/xEghf8POUn5x4XMrDBbQEu2S5t/IOoHJwWZxEKQyDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777565946; c=relaxed/simple;
	bh=Ibn6LshxBxBGw1H4D7uycE6iwE28tRGUjg3ZNaPJT7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwqkjY38e/S1QfSu+oDX90kyt2aJr9KXa1NnJSbKkStfj/FPEfWnSw8P3M6PJLJJ0gGFRR1/67cKzYtdkqrEkgeKhQmkzLZst65x+tzmXzXGv/8wI6+UKjs/OHTeBZSz8mz71MpJ1dyvIOV1AgpePfGQXST5FKJ9WC8rhBWO80I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qznVMYUt; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso710389241.1
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 09:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777565943; cv=none;
        d=google.com; s=arc-20240605;
        b=a8CAICXzYsUW4o/+s3DYFwY8u6ADFNhBw2j8jEJqnrH9dOVAg0ChM8rAkjS9KRjxrQ
         Vfv+LS8U7UOa5qNKrYYY38WgLj62siAubKnCRPh7QhwD7UaEZyExvi3EwQcwWn7P0iir
         uCAf8iBNA7xb746VHV/m8R5Kqcb3017FoZEFoPzwYC5uyRuzPT1dzz0ljIJH/HNQS0IY
         oUQOLbJPGxP50WxwkdvyO1j/9kayooFBmFS9n54xYKzHqNjAYjcyynxDDYhJyRVXudOG
         SwJZTsbrk5a1QS6KVNFeo8VGfJUZgWte9uV37u5TsevbeOpqyYmS2wpbncBVF5nWXTmd
         Qttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8blcYQdSkW/3Gh5cr1K0Y1kWzFwMeRmTqNthM1mNKKc=;
        fh=roKN6aRIi+bmlmIt4itrbAZ79o+BcxpB4aP4h01ioqU=;
        b=R21ZgB/po2/n7YQXCK08nnPVPoMyQVEiYrXm9MYns8Peg0NkmKKjkgFcSJDHmQEX0n
         Nmv7EtCdgb7J91mG44FQpdCUcl4LQT/IAj8P8EcQo8PwjrWq3fTmZlNoEe9xn+9pEWyO
         zHrqB8rbgo5T+GzBxvsvwhSmE8u885Tdaus68uA6KRR+akZKjt7+UnADwpcKtJBy4Rwh
         ZOwRkhX1x/CL80ePpieo/wnmJI7OMHdOlYX3FUTenF5AzSKCrvLSOuD31m3qtCHW2N6R
         cUMk5YTGH8FpZyTnj5HGBV4O6fzO0uhNN2yOoeynzUllwsvcHt9NiJkWiCoo/4LN2Ed/
         8W9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777565943; x=1778170743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8blcYQdSkW/3Gh5cr1K0Y1kWzFwMeRmTqNthM1mNKKc=;
        b=qznVMYUt/52QBfY1dzOU03ZbNv2kjGphiFU8Zb53aVlNKYvRsyEJfLkpHeZMWzMivW
         7ZSQZILnJVkVetYkc9vK4uJCgrodXReVqnztaOuPET8fLT8Ncq8RrRc3uN8egmGeKyrn
         /ZD17Wes2ukCTxQ6vsbvt1MvWYjDCbzRAsnNewU/1FfcdWdBswrBtDBYfUs7IscEUiTK
         d25b8PcKOa7knoV7fhsDpb6P5zOgdPS+5q4ds00V5zJlo5mImhQmm1llR4KDr1v6mfBW
         7KkF/0xIGzeon8+DWkAYKC+mZYMkLcKZRAyrNX89IJ4LRJt/TxosTnxasfP7DrxKBpJj
         xZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777565943; x=1778170743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8blcYQdSkW/3Gh5cr1K0Y1kWzFwMeRmTqNthM1mNKKc=;
        b=JOFEbdD00Sx/umCpHiEiYwMrLsC+1/nkEHpMLibzXoig+YGSAUUamtGvwIjnVdDEkl
         T/ZW2z3bMwqUtenyLDXkjpQgbxbKARyldNbHuBM51XrOWTbVEEPlbyFufeQ9xFwlrKIn
         9jED7QYxtHT9BUqJwWsm7sXm+bPncodKE37ycu8nY93nY9sU1RJ8UQdkkVBYR/vFxtJP
         NVzdFqjFMm3uAumcs+f5r+9oX0EHxXpmqBQYHkBXIK/6/9tfjkdir4G6+Qkac1AhoJJF
         HnWW20Idaj9cG7NuoEr74lh4V0VOjT3ER4Tc7v/gv5i0O4XXQOV6s0hseiT804GWU5UT
         Wlhw==
X-Forwarded-Encrypted: i=1; AFNElJ+R/R1S6gDisOJpdPmyfuzwfNWkWhBuFN2BxMnrJgj9b+/8iLF5WVeV4ma3XZZQ+a+/+rf4bLWy7qc8aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSLpO4uav+FacKF0GkYD8ao0aoQq71uAaitCJ0qK6m0KEtOX/L
	ibq8kY/J0GLP8si3I1lYm/HXAynRwBJMCErcViAJWQJuDfyY1gxodX4KZEUFfHRA01mRJZ3/rV+
	+j7FomztQaZRUO6D7+FlBFOHNgZqGX0w=
X-Gm-Gg: AeBDieuNgR7zK2acxBVjN/DMFuKOGzSR/+BnR9V7fldDI3hjPTSh2wCnU8QMUdcJ1Pt
	atn8JFoX7jR/9QqQpxpZi+tdlhTOw9fLOSZibAmYzrq+btubUCdHvU2blwFASES14y1S37QCqud
	e+vBLYO6IKcbcsc8HsyB9AIzyK0Ghdh9ZMN9JWZ1QwmVK6hoyjGHqwKok/m9ErzFdvTZ0ZzEcOn
	tt16oyWO/5toZ/GcYerllHTiXWv05tdbJPHz2s1sJaRS62DOQkVSGVErjeLGPH0Fxz9h3H+PYhj
	CaRRDdaxqxXLvheJwzA=
X-Received: by 2002:a05:6102:4b13:b0:610:2912:adc9 with SMTP id
 ada2fe7eead31-62ad55ceee2mr2475484137.28.1777565942954; Thu, 30 Apr 2026
 09:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429070351.1307204-1-mitltlatltl@gmail.com>
 <20260429070351.1307204-3-mitltlatltl@gmail.com> <afHI29SDHDggH2Wt@kekkonen.localdomain>
In-Reply-To: <afHI29SDHDggH2Wt@kekkonen.localdomain>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 1 May 2026 00:18:09 +0800
X-Gm-Features: AVHnY4KkiOYjvdAIVqFYihZrsquUrTAR1YygxVNEZF-RwX-El0Aekdrg1Wc220Y
Message-ID: <CAH2e8h5mGfYZiG+Uy05xp9cDxy_7uAZ46ywHYrK5VYavLyLtrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: hi846: Add 6MP and 8MP modes support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 213764A58F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60101-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 5:01=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Pengyu,
>
> On Wed, Apr 29, 2026 at 03:03:51PM +0800, Pengyu Luo wrote:
> > Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> > mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> > utilization.
> >
> > Note that these modes require 4-lane MIPI CSI-2, as the downstream
> > driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> > operation on the target device. The register sequences are extracted
> > from the downstream Windows driver.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  drivers/media/i2c/hi846.c | 154 +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 153 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> > index 09c109f3fba9..b8ae7344f1a0 100644
> > --- a/drivers/media/i2c/hi846.c
> > +++ b/drivers/media/i2c/hi846.c
> > @@ -1027,6 +1027,106 @@ static const struct hi846_reg mode_1632x1224_mi=
pi_4lane[] =3D {
> >       {HI846_REG_TG_ENABLE,                   0x0100},
> >  };
> >
> > +static const struct hi846_reg mode_3264x1836_config[] =3D {
> > +     {HI846_REG_MODE_SELECT,                 0x0000},
> > +     {HI846_REG_Y_ODD_INC_FOBP,              0x1111},
> > +     {HI846_REG_Y_ODD_INC_VACT,              0x1111},
> > +     {HI846_REG_Y_ADDR_START_VACT_H,         0x0172},
> > +     {HI846_REG_Y_ADDR_END_VACT_H,           0x089d},
> > +     {HI846_REG_UNKNOWN_005C,                0x2101},
> > +     {HI846_REG_FLL,                         0x09de},
> > +     {HI846_REG_LLP,                         0x0ed8},
> > +     {HI846_REG_BINNING_MODE,                0x0022},
> > +     {HI846_REG_HBIN_MODE,                   0x0000},
> > +     {HI846_REG_UNKNOWN_0A24,                0x0000},
> > +     {HI846_REG_X_START_H,                   0x0000},
> > +     {HI846_REG_X_OUTPUT_SIZE_H,             0x0cc0},
> > +     {HI846_REG_Y_OUTPUT_SIZE_H,             0x072c},
> > +     {HI846_REG_EXPOSURE,                    0x09d8},
> > +
> > +     /* For OTP */
> > +     {HI846_REG_UNKNOWN_021C,                0x0001},
> > +     {HI846_REG_UNKNOWN_021E,                0x0235},
> > +
> > +     {HI846_REG_ISP_EN_H,                    0x014a},
> > +     {HI846_REG_UNKNOWN_0418,                0x023e},
> > +     {HI846_REG_UNKNOWN_0B02,                0xe04d},
> > +     {HI846_REG_UNKNOWN_0B10,                0x6821},
> > +     {HI846_REG_UNKNOWN_0B12,                0x0120},
> > +     {HI846_REG_UNKNOWN_0B14,                0x0001},
> > +     {HI846_REG_UNKNOWN_2008,                0x38fd},
> > +     {HI846_REG_UNKNOWN_326E,                0x0000},
> > +};
> > +
> > +static const struct hi846_reg mode_3264x1836_mipi_4lane[] =3D {
> > +     {HI846_REG_UNKNOWN_0900,                0x0300},
> > +     {HI846_REG_MIPI_TX_OP_MODE,             0xc319},
> > +     {HI846_REG_UNKNOWN_0914,                0xc109},
> > +     {HI846_REG_TCLK_PREPARE,                0x061a},
> > +     {HI846_REG_UNKNOWN_0918,                0x0407},
> > +     {HI846_REG_THS_ZERO,                    0x0a0b},
> > +     {HI846_REG_TCLK_POST,                   0x0e08},
> > +     {HI846_REG_UNKNOWN_091E,                0x0a00},
> > +     {HI846_REG_UNKNOWN_090C,                0x0427},
> > +     {HI846_REG_UNKNOWN_090E,                0x0059},
> > +     {HI846_REG_UNKNOWN_0954,                0x0089},
> > +     {HI846_REG_UNKNOWN_0956,                0x0000},
> > +     {HI846_REG_UNKNOWN_0958,                0xca80},
> > +     {HI846_REG_UNKNOWN_095A,                0x9240},
> > +     {HI846_REG_PLL_CFG_MIPI2_H,             0x4124},
> > +     {HI846_REG_TG_ENABLE,                   0x0100},
> > +};
> > +
> > +static const struct hi846_reg mode_3264x2448_config[] =3D {
> > +     {HI846_REG_MODE_SELECT,                 0x0000},
> > +     {HI846_REG_Y_ODD_INC_FOBP,              0x1111},
> > +     {HI846_REG_Y_ODD_INC_VACT,              0x1111},
> > +     {HI846_REG_Y_ADDR_START_VACT_H,         0x0040},
> > +     {HI846_REG_Y_ADDR_END_VACT_H,           0x09cf},
> > +     {HI846_REG_UNKNOWN_005C,                0x2101},
> > +     {HI846_REG_FLL,                         0x09de},
> > +     {HI846_REG_LLP,                         0x0ed8},
> > +     {HI846_REG_BINNING_MODE,                0x0022},
> > +     {HI846_REG_HBIN_MODE,                   0x0000},
> > +     {HI846_REG_UNKNOWN_0A24,                0x0000},
> > +     {HI846_REG_X_START_H,                   0x0000},
> > +     {HI846_REG_X_OUTPUT_SIZE_H,             0x0cc0},
> > +     {HI846_REG_Y_OUTPUT_SIZE_H,             0x0990},
> > +     {HI846_REG_EXPOSURE,                    0x09d8},
> > +
> > +     /* For OTP */
> > +     {HI846_REG_UNKNOWN_021C,                0x0001},
> > +     {HI846_REG_UNKNOWN_021E,                0x0235},
> > +
> > +     {HI846_REG_ISP_EN_H,                    0x014a},
> > +     {HI846_REG_UNKNOWN_0418,                0x0000},
> > +     {HI846_REG_UNKNOWN_0B02,                0xe04d},
> > +     {HI846_REG_UNKNOWN_0B10,                0x6821},
> > +     {HI846_REG_UNKNOWN_0B12,                0x0120},
> > +     {HI846_REG_UNKNOWN_0B14,                0x0001},
> > +     {HI846_REG_UNKNOWN_2008,                0x38fd},
> > +     {HI846_REG_UNKNOWN_326E,                0x0000},
> > +};
> > +
> > +static const struct hi846_reg mode_3264x2448_mipi_4lane[] =3D {
> > +     {HI846_REG_UNKNOWN_0900,                0x0300},
> > +     {HI846_REG_MIPI_TX_OP_MODE,             0xc319},
> > +     {HI846_REG_UNKNOWN_0914,                0xc109},
> > +     {HI846_REG_TCLK_PREPARE,                0x061a},
> > +     {HI846_REG_UNKNOWN_0918,                0x0407},
> > +     {HI846_REG_THS_ZERO,                    0x0a0b},
> > +     {HI846_REG_TCLK_POST,                   0x0e08},
> > +     {HI846_REG_UNKNOWN_091E,                0x0a00},
> > +     {HI846_REG_UNKNOWN_090C,                0x0427},
> > +     {HI846_REG_UNKNOWN_090E,                0x0059},
> > +     {HI846_REG_UNKNOWN_0954,                0x0089},
> > +     {HI846_REG_UNKNOWN_0956,                0x0000},
> > +     {HI846_REG_UNKNOWN_0958,                0xca80},
> > +     {HI846_REG_UNKNOWN_095A,                0x9240},
> > +     {HI846_REG_PLL_CFG_MIPI2_H,             0x4124},
> > +     {HI846_REG_TG_ENABLE,                   0x0100},
> > +};
> > +
> >  static const char * const hi846_test_pattern_menu[] =3D {
> >       "Disabled",
> >       "Solid Colour",
> > @@ -1042,9 +1142,11 @@ static const char * const hi846_test_pattern_men=
u[] =3D {
> >
> >  #define FREQ_INDEX_640       0
> >  #define FREQ_INDEX_1280      1
> > +#define FREQ_INDEX_3264      2
> >  static const s64 hi846_link_freqs[] =3D {
> >       [FREQ_INDEX_640] =3D 80000000,
> >       [FREQ_INDEX_1280] =3D 200000000,
> > +     [FREQ_INDEX_3264] =3D 288000000,
>
> Looking at the driver, the PLL configuration is present in the lane numbe=
r
> specific register list so the link frequency is in fact the same for all
> modes. This problem isn't introduced by this patch but I think this needs
> to be fixed before adding further modes to the driver.
>

TBH, I didn't investigate the calculations. I just searched the
datasheet for it. They are exactly wrong. Thans for pointing out this.

I can fix it, but the question is this driver was writing against
25Mhz mclk, but the typical value from datasheet is 24Mhz, and one
device is using 25Mhz as the clock rate, my device is using 24Mhz,
25Mhz is unsupported on my platform. It seems that making the list not
be runtime is not allowed as nobody did like this.

Best wishes,
Pengyu


> The pixel rate is likely incorrect as well.
>
> >  };
> >
> >  static const struct hi846_reg_list hi846_init_regs_list_2lane =3D {
> > @@ -1134,7 +1236,57 @@ static const struct hi846_mode supported_modes[]=
 =3D {
> >                       .width =3D 1632 * 2,
> >                       .height =3D 1224 * 2,
> >               },
> > -     }
> > +     },
> > +     {
> > +             .width =3D 3264,
> > +             .height =3D 1836,
> > +             .link_freq_index =3D FREQ_INDEX_3264,
> > +             .fps =3D 30,
> > +             .frame_len =3D 2526,
> > +             .llp =3D HI846_LINE_LENGTH,
> > +             .reg_list_config =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_3264x1836_config=
),
> > +                     .regs =3D mode_3264x1836_config,
> > +             },
> > +             .reg_list_2lane =3D {
> > +                     .num_of_regs =3D 0,
> > +             },
> > +             .reg_list_4lane =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_3264x1836_mipi_4=
lane),
> > +                     .regs =3D mode_3264x1836_mipi_4lane,
> > +             },
> > +             .crop =3D {
> > +                     .left =3D 0x46,
> > +                     .top =3D 0x172,
> > +                     .width =3D 3264,
> > +                     .height =3D 1836,
> > +             },
> > +     },
> > +     {
> > +             .width =3D 3264,
> > +             .height =3D 2448,
> > +             .link_freq_index =3D FREQ_INDEX_3264,
> > +             .fps =3D 30,
> > +             .frame_len =3D 2526,
> > +             .llp =3D HI846_LINE_LENGTH,
> > +             .reg_list_config =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_3264x2448_config=
),
> > +                     .regs =3D mode_3264x2448_config,
> > +             },
> > +             .reg_list_2lane =3D {
> > +                     .num_of_regs =3D 0,
> > +             },
> > +             .reg_list_4lane =3D {
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_3264x2448_mipi_4=
lane),
> > +                     .regs =3D mode_3264x2448_mipi_4lane,
> > +             },
> > +             .crop =3D {
> > +                     .left =3D 0x46,
> > +                     .top =3D 0x40,
> > +                     .width =3D 3264,
> > +                     .height =3D 2448,
> > +             },
> > +     },
> >  };
> >
> >  struct hi846_datafmt {
>
> --
> Regards,
>
> Sakari Ailus

