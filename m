Return-Path: <linux-media+bounces-29276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F3A79957
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 02:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A104B1890236
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 00:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DCE11712;
	Thu,  3 Apr 2025 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PigCEdIS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325E11FDD;
	Thu,  3 Apr 2025 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743639652; cv=none; b=KhBeVqeM63Yo6RSY4tJQJqwde6GE15pX2nEnkKh8WrhR7lKNhFSknXsMexNmqsh5lqZw9hD0BlHv9lG+h5qxQ8zwxcbl1Yf8r6EB9x5ja+LyJEGhAprlE4ezt0M3GC5WvWa1d2TVYlOyB4CsMZup9UHoQZaXRo6+WpwEsdB4IYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743639652; c=relaxed/simple;
	bh=YTcWcC3eS5xycxGOwbIpWeqr+3UyjvW4rwYWi/skT/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLvbBeWt4pichV8jbiuzijLXhgJfQcctUA1CUaUjW6fvRFsACRDOu14FOkzbg0rfzAtPbj6y1EGa7XAx5a299EOK2I2cnocuPPMA6ev0i5b39KCDGjDC9Ir+mnRdBtFzmTCn25Yn1j95ZAhFfzfqUcSHrjpYF5VBe/y5f5QKVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PigCEdIS; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4766631a6a4so3164591cf.2;
        Wed, 02 Apr 2025 17:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743639650; x=1744244450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTcWcC3eS5xycxGOwbIpWeqr+3UyjvW4rwYWi/skT/0=;
        b=PigCEdISitKIaOaFjeA1Z+XDYGAXDPrv7GCNiK3RVBDJk3xz4BV6EfviLmy52nwlEI
         6GUmLuVycSpRTRo+RSEpc69/bBNvS0FNlKR7Z8B4Fe17VjLYJ5TcLSfU3DXSk55+rL9j
         46s3BRIRuQ5q4oX3vfJp0pkyTmPAD4kCupgqazf2G/IriPrQjYl5f3Kkgc6uczCv2lGa
         /gAMLo9+Z96ecnXVmDibeR44W5sCPorGm2QVc9MoldfRz1xfVuHvPMPFx47E4nkiFFRZ
         zsACW5F5FnEtxFI3rJ00jN2OeR62RXu2I5a5pFgSUB9gL2mbcATAp+X9T5FqcDlXreDD
         lorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743639650; x=1744244450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTcWcC3eS5xycxGOwbIpWeqr+3UyjvW4rwYWi/skT/0=;
        b=NOS0RX2jbH9iHKxQXpKqffYeJXUVG2TWpaZVBOafxzUhipxqJ9RYCAeBLxTswdwDit
         TXL66Tj2lVirU1KCsch4D4+JaAM3U5FYUNc3jB8Lv6UBoH/Mw2r5AueEcObHnWOCdlcy
         TKZetZrykpL3a3ZjBqATCmNcMyEhNgV2yZATHBMV3kH6KVtlshFuE5kkrWi8hbZeCgzB
         AJXXOKtaXaMD+n5fVrTK3ef3f/xpdOmLbhx42k7wDOGDFJk51b/HPB9m/4oYOtaatg2Z
         IvSA+EGwlXlIHI6erTOgjxP0OYeH2lHtVZ+PV+h8E4y1/dnb/fcU1xZICs64y6v/B+pT
         rg/A==
X-Forwarded-Encrypted: i=1; AJvYcCUZny0rV2pBjrGVyLIxAuadp9CpDCvLlcDAPzWnHHkUdBgKW4fwn30bx0LYqZpGnSfYmyOxmo0fs9sratM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVTkpq+IbCr9aaD/P1oUnDNrhTpiwcZEnGVZ+od9RMATpmZoO
	rndkXhgtbuAVfcGC7RbNXXTNVB74OlRqIwRvdLrV00XrOXwL1UwlxBfXxBiatbr+0hau3G4cSSh
	VjwEI/bohmXnpCXfFnBToSNMAOYU=
X-Gm-Gg: ASbGncteysozmDW+bgF0EVg9R69niCA/gc36cGtYbtyI0waEepLq70v5blzcGooWbk7
	OjE9HGgnhzazW/iXHrX7NkT8bA8RHEhfmV0UTWpOb3+hVPT47n0nHmpRu10SqiePnh1YLgOlLie
	q95qR15t8BY9mONMF227m0hRERVCl9IRxmOHQuVms6pcXxSd7cjdbRqPBKEg==
X-Google-Smtp-Source: AGHT+IGzwHjTIZKTNeQqWvRvh98uML2RqTMbLoco8WCy7SIhCZDAQ33OpZ5L8LF732RiieS2+vgu9G6uDHb146LBflo=
X-Received: by 2002:a05:622a:1446:b0:476:7b0b:3110 with SMTP id
 d75a77b69052e-47909f79ec7mr78348071cf.20.1743639649908; Wed, 02 Apr 2025
 17:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402135001.12475-1-gshahrouzi@gmail.com> <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
In-Reply-To: <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 20:20:00 -0400
X-Gm-Features: AQ5f1JqsvGSzKWOas4Sgn9LEyx6jBvrZcC2qazVUaWvDVj5nrhnApX3foc-ewxI
Message-ID: <CAKUZ0zJ+N9BoxZVnkGnFhH00yZJKP9b+Dnp5oTwv0N5gZKSW1w@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead of spaces
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:37=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 2, 2025 at 4:50=E2=80=AFPM Gabriel Shahrouzi <gshahrouzi@gmai=
l.com> wrote:
> >
> > Replace spaces with tab to comply with kernel coding style.
>
> Still 'tab'. please, capitalize it to be 'TAB'.
Whoops.Completely forgot about this one. I'll have to reread the
thread or write it down so I don't forgot in the future.
>
> But wait a bit, the driver maintainer might do that for you whilst applyi=
ng.
Sounds good.
>
> --
> With Best Regards,
> Andy Shevchenko

