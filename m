Return-Path: <linux-media+bounces-35553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2BEAE3210
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 22:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 066AA16ECDA
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 20:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2001F4725;
	Sun, 22 Jun 2025 20:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkG8alJL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A3D610C;
	Sun, 22 Jun 2025 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750625177; cv=none; b=K/1IQJBIU7FRa7sM6IlC9Z/O1PO2DigbGvm4jSR6EK5Gl2AKZBqptEjv0Jfwk1QxMc5zJAUgdu3CIMRJ7BKg3iEtppt6WhigqBJ8eXe4Ph8aVGrKL6AIYPF4GYfBpfQ4aVs6TAA2bnK8ZcVaZYZ5mroMyVHR0/ktCNJ1hI377b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750625177; c=relaxed/simple;
	bh=GwKR947l0oDsjvW7HGqBolLdH9hIFFWEoUtSTpR6+4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m53QpxB0fC1silYna1TKbiZSLDo1+LzIVhOl8ByIdF/ZX8tJxCgZpFjW8290aQOGRGcQiUj1gibSLyaDqYCpmI4947+A1nIJUZFLDfqT+C15Q+0m7UV822XE6fSashsPPsqr9vGFf1E6ri6gxU34BriVP40PeSK+eZKv0iTLIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkG8alJL; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e82492d2b38so285013276.1;
        Sun, 22 Jun 2025 13:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750625175; x=1751229975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GabHvsY3bDW7rA/BLlKelKFYiDWDiaFpKx8UrlL7A0=;
        b=MkG8alJLofpOhF/rpjkmRszVc4vGmApbu1YFzlm404ID94uUuaVWPrFayggSJrm8Pb
         +W4K6xqUAbwY11et+MmyhOk1cdr5JlS5BvFAjvUoJGj5ngEsCSj7FE5TKso+toPHGNVh
         H4VwNYJwOepPciCtKyMe7OxEaqXTdDFi/CaG8/Kx1m/TCgmZFgH7EH1n7P2HwJ9kxTrl
         05rsvwwit625Lscs57Hz4+Me66j3+eDdOUzdZ4bXnnMRN7WgDPM3xKPQwmpMO7tNSyeI
         SQHdJ3Bazw2eqnN2D2iwJdzjD9PzpVnajrheiEUkJGcsRaKntj/vfldk4VbdivX/rdbK
         6YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750625175; x=1751229975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GabHvsY3bDW7rA/BLlKelKFYiDWDiaFpKx8UrlL7A0=;
        b=XHKgbYs0TJzwj3MQB6DGsqokmTm4WsXMTL7zuWhSIlFp2tz93vjhOPQIMsmaFQzj9c
         heAHvVHzcEwoD9Hyy3rjD46Vol5Ydq44XkFcTpW/d+CicP3D2PEAig5hiftJsiLfoziX
         LjNMDSgvVaUR7Ko3tfBXWB+82apj37MUqs9kyfG5Vkn/Ciqal82+ctVb2WVGXRFJOb8z
         uP2Y7v5FgH8wS84Yp48C5wR88jHhyVZVPyB5zsz4g7w1QN8Jsv1dHBoywy275ASyzGkV
         a1m7bjvTQO2BzksauIQh9oEkc2ydB0tufwo5HwFk575FhoJKfNK9OUizWd0njZOVGDwd
         Eh9g==
X-Forwarded-Encrypted: i=1; AJvYcCUXClHQ+Sl3d84jaUD1tjeIiV3uTRUGqzs5Mt1/yr0J1ueSLcBDoNYXm8ttsBzTSmoGPVFgHXa+RhdzXTY=@vger.kernel.org, AJvYcCWIulyuEwQcMB0C1KjrQUXV/Q2k6GOQ7I/yLI0YHkd5+28DUy4cIT+F/HhUlBWLwmjCsFNCGwAghGJd9c8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0qqoXlkTwlklt7BSXEjnUujENJxe5Uwkn19/rj+SfFuxSITag
	0IZDKmGL7JgB0mBGly/Uc7aQbnlgglZQkL+Z7ty3fRKmAYtD3a4DTJJiPUPX6LzHAvNp3ycT5TL
	+7NTLzK8u4BVTbCq97cK9EJWUG5lzQZc=
X-Gm-Gg: ASbGncs6Y5NqyiJbj7SXtUciJcCTIPa01aC0W93JLXkeclLWOuOstHIhmvcMnuuAAOK
	cqxGCiQQlxiG/odMZeeA46S3ryoAouwbZQxjW5+MJf9jQeU7tYVFU01TmxnkFTItSAIZU8TJUhR
	kjjSbxa1SUlo4jp4wvRCgtSk9/7qmfcl044LDpPzjpRDGJ
X-Google-Smtp-Source: AGHT+IEmVlg/KOIX1VTwQesijc92a1D2RId/mLgev7pZcFOOQiaylUYoPLlZbiWQVi5ktMhE8d91KsTNaUz4jGYnOqY=
X-Received: by 2002:a05:690c:d93:b0:712:c55c:4e61 with SMTP id
 00721157ae682-712c64e8187mr66589657b3.5.1750625175439; Sun, 22 Jun 2025
 13:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
 <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com> <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sun, 22 Jun 2025 23:46:04 +0300
X-Gm-Features: AX0GCFvlIHgr7FAfwpYiKvbyIOWPCmbwyRuZ8_Mzqkhx21I0MX5OTBJ3q9AxdAM
Message-ID: <CAGn2d8M4vZzJSczv72AFS_ngPiCc=Hg5=U3wQFCtHp9EZvqDoQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:39=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
> > <abdelrahmanfekry375@gmail.com> wrote:
>
> ...
>
> > > +       /* Changing to sysfs_emit changes the behaviour if failed*/
> >
> > This comment, besides missing the space, is useless here. You need to
> > use the comment block for the proposed change.
>
> Also the text of the comment is a noise. You need to explain better
> what's going on here.
>
Sorry for the mess, so the comment is enough if well written or i
should do something else?
Thanks!
> --
> With Best Regards,
> Andy Shevchenko

