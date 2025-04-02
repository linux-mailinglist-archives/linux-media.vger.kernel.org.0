Return-Path: <linux-media+bounces-29233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A2A78F27
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BF8516BC4F
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711C723A562;
	Wed,  2 Apr 2025 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgpS6NSX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E41238D25;
	Wed,  2 Apr 2025 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598420; cv=none; b=RUa35taEkiFaLCSSsAxbGWa63Ksd+Ru2mYDq+S7CIR/mX2XSS9IqRTjggw+rMG2XC4XXpvcQBpJXtNUfhsGuOK/UHS/6rJ+vySIcZ5b7LhmrZMvKKmeeD0zZ54IZw0VpEVPS51wRs3TU1ez7ksLd4JxPLwyXK/cq11YHLtXbU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598420; c=relaxed/simple;
	bh=QWAHrdoHZQWrK4dNu2Qq9in6lH220oPuPQXNfKYeiJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deqUaxpcVOiNfoe+DNcpZFNrgmBNaC2QRY9jXFB4GVdKN+8SYl1yaG2wMM8rcHUBpT8jPpfm6zD9KNdI70cYetxtlu4k8tcPuA057mJ7LkbCSOl3zrB/zTXcLAB3p+ECJ4x+1pIHP+2LsNhxGVBj+hWumEVI9kwuk4X4LDkWjaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgpS6NSX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso6051460a12.3;
        Wed, 02 Apr 2025 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598417; x=1744203217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWAHrdoHZQWrK4dNu2Qq9in6lH220oPuPQXNfKYeiJU=;
        b=EgpS6NSXnqOTQAIJU98K8tAar5bA0gF42DZu5boRp9Pd070HYbxTEAnzOcrC9FvOJJ
         0Fe8Yu4qdb6R++x2duj9yMPo9hBOXMZu4WdrMwp4H+XLpU00sok0Jn6pBMIeuM5u8LJU
         Xzr+iEIeEyGUtcXlI8Fndac2127tcI2deqmSut4FSTOJ8zadWJOE/0npr37748bFmf9R
         gjeMdQS9wDGyi051SORP+tL092SIwrFAWHaEStbwf0QEawe4zdc1MLVM5FH/W/mGP4NZ
         42Q1jzoAixzdvSstJ9yZGFziTGNqsL4OCujBHuhwN/s9ZknsWvoila4RNBBWAXQnReNG
         7Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598417; x=1744203217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWAHrdoHZQWrK4dNu2Qq9in6lH220oPuPQXNfKYeiJU=;
        b=Z0JO4Dg9QcGUCx8nZ3D+41/EyN5OIcCLGqXMLx0OYAuZJ+8AUC8wZ+Escj7ZTt5vTZ
         lS1ydUeHRI4Y4+JMpwJyF95Ajgshfrl92oimH4b7uVCRq1k2kwcOAgvweCU/9ji2XBMs
         QNHPboqFzCjiIAZbyJA+/JoqHuj7YpKcYP8Ztpl8Cxl9R5QKyngcW2OsdwAwN679yuSb
         KtvDExK6unTpxFuG7RbPSll7eauvpJ/T3aZGKeQt2RgJ8Nmfn8mA9Q3RUjR7uSl7dqbq
         FWfYRUw/g8mToBWbkcslOqHdHgki91iI59+6/GHtfEzTL8iuzqdPGWrZAQ1cBAenXrjb
         3kAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUccaZyYkirq9bTsMj0N5DZIeFeorRpD/CGSnX32kVXsqqTiCLmwKiT8YdBFBmxKcP0St8j0kEExnIBfMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztbdbXI3dACorNjaiAuu2GBumkSET1Sa/Em5kmb7NQaKxI3sEe
	riROsZIzuXhVNYAtfgVKzyfaQFJfRwxZNsIjxmEdN0ox3m228IoM8nEmJXVzte1qtfYeQdjKhSA
	IfxKQIwhuSsDLf0d7Y66XXnV2kIo=
X-Gm-Gg: ASbGnctCeM5445x/402F94JfMVKB+8OOo/H9X4/sac9PsvCvK6YoIO5bJsB2bEsp9p6
	NQbP1/mpu+HU6vIhG9KNwHZyOZGssymRLODL60WltB9pJ3aJKWG9/sf0aDsk9ytFxeOh92AQLCa
	3BOkyFFEeVDuyGmhVCvt4Q+dnFCjfkBDPgwy61oSQ=
X-Google-Smtp-Source: AGHT+IGxDgr+/GaLpKlsw9St3w6GJvEPpvjphaV5hDOM2BUJ91HNibOwkf5Ij8wA/sKQqWEOmB+VBIEys451X/p7yBI=
X-Received: by 2002:a17:906:6a0b:b0:ac7:9937:e259 with SMTP id
 a640c23a62f3a-ac79937e35bmr225555866b.0.1743598417114; Wed, 02 Apr 2025
 05:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com> <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
 <CAKUZ0z+mqGwyEt8oem7gLMXbNp6D3MPPMXEH5GCdA4_768d=5g@mail.gmail.com>
In-Reply-To: <CAKUZ0z+mqGwyEt8oem7gLMXbNp6D3MPPMXEH5GCdA4_768d=5g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 15:53:00 +0300
X-Gm-Features: AQ5f1JpDktiw_Kd3xROZdIkDbnI11lgI5EHYRPHPVopQZ4eLDQiCWlbTGKfxrq0
Message-ID: <CAHp75Vdr9YO6GJmomumP=tksZfVj4BtDHx=Rb9Cr4gSQPnt+eg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Fix indentation to use tabs instead of spaces
To: Gabriel <gshahrouzi@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:28=E2=80=AFPM Gabriel <gshahrouzi@gmail.com> wrote=
:
> On Wed, Apr 2, 2025 at 3:12=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Apr 2, 2025 at 5:40=E2=80=AFAM <gshahrouzi@gmail.com> wrote:
> >
> > Is it your first patch to the Linux kernel? See my comments below.
> It's among the first patches I've submitted.

Good start!

...

> > > >From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 20=
01
> > > From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > > Date: Tue, 1 Apr 2025 22:04:25 -0400
> > > Subject: [PATCH] staging: media: Fix indentation to use tabs instead =
of spaces
> >
> > First of all, your patch is mangled. You want to use proper tools,
> > perhaps. One of which is `git format-patch ...` and another one is
> > `git send-email ...`
> I was using git format-patch but not git send-email which seems to
> have been the issue. The meta-data from the patch was getting appended to
> the top.

These are just normal headers for an email. They may be used by tools
such as `git send-email ...` or `mutt -H ...`.

...

> > Change itself is okay, but is this the only one case in the entire
> > driver (which is something like 100k LoCs long)? Even though, and
> > while for the training purposes this is fine, you can also think about
> > checking the common style of other functions, which may be shifted
> > with TABs, but still having not enough spaces or so.

> Good point. Regarding formatting, it probably makes the most sense to
> address these issues comprehensively in a single cleanup pass (similar
> to https://lore.kernel.org/linux-staging/cover.1743524096.git.karanja99er=
ick@gmail.com/T/#t).
> This particular instance caught my attention because I initially
> thought the author might have accidentally used spaces instead of
> tabs. The line in question used 2 tabs + 8 spaces, while subsequent
> similarly-aligned lines used 3 tabs. However, after examining
> different files in the driver, I noticed that while the formatting
> appears inconsistent, it likely exists for specific reasons. It's
> probably better to avoid changing a single detail without considering
> the broader formatting approach, and to treat checkpatch.pl more as a
> guide than the final authority.

Okay! In any case this patch is fine to me in case you want to send a v2.

--=20
With Best Regards,
Andy Shevchenko

