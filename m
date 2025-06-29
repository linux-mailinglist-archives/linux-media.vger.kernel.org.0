Return-Path: <linux-media+bounces-36198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CDAED014
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 21:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 793B83B608E
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 19:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A3C23B63C;
	Sun, 29 Jun 2025 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQL7oBFI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2023B625;
	Sun, 29 Jun 2025 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224518; cv=none; b=RQFNiEdahz5Hyp66qiDlirXYIoBHuupoR0zP20WKLy+r7JBooIeuijmnX1Yq6Pu3G1xyTVttNOuRS6NyQrdbU3ytKkeuOohXHC2JGb/SWL7VmoGsL5TzK0Kbz47/zyla10vWcJqqBNfrPNBhX+qSZKEg/3GJjdMmkDh7Phg0Ikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224518; c=relaxed/simple;
	bh=nA3MXBps3409L4F1Tl6lV76sgIZsFK+ko4yqfWlQmyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLf9Q6d9e7U7h9lnRuxNx4KRAj4ShyfampjXfA23C1nDoTEGtlVvTKc58j1N4SEzGGKpocCpWdU977F86hdTi6Ne/AVUaOzFonZZdg6D7t59szJrTjJjojoOxJ+Cp30uMQ5fwNrbwYuBiAi0H2ftTBG/oqKDCz8EtG4e879/FJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQL7oBFI; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so703379366b.3;
        Sun, 29 Jun 2025 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751224515; x=1751829315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA3MXBps3409L4F1Tl6lV76sgIZsFK+ko4yqfWlQmyA=;
        b=DQL7oBFI6tQ178ll8tyqJ7Gsypdku5yw8ZWRiJLJTqapPMCIvRJ0fQ6l0RqPQIDZKt
         /EbYdNGx/q6ePeNzgC35t5ZiojNoS62GdEXv0r5SFWL9oOCjaQ+7Cz0btF+qT86owfGc
         XuXjAyezGpYuKS9X7nt/0DLqFoSq0NgABJO3HgHe4IZCPc1DqLvvA3ikMf86Q4mvWhv7
         whyyCmndli0+lLzE3HaPOIIkj7UiD8T1MdebYu86RqacRJxkDYLm6flDqUMHHWSxEYUp
         q1WI77gHEyLKodi44Zy2LGT7vFWf82QCEiYcs5Tux64Z72ObpuslYBRU9vBQDtAYYlia
         tr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751224515; x=1751829315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA3MXBps3409L4F1Tl6lV76sgIZsFK+ko4yqfWlQmyA=;
        b=SjF9hoOQi7bqi2gr3249x/4/g2uxHRVC73+FfLzuIukDBwjAqfR2gArAQkel/uVx1I
         EfVkKzCpY1g20FC2HweNqW95cnUz+PJyOlm1YufQgPcYAtsHDwK0rEXvIfKZJt1WtW1/
         vtSMsUZ4MkiZCq1SEeJXi5BWbpABa3OvC//pO7Zr4gMDGLTwp1PHTAsBJI31RQSnmkCM
         Vfz5Le8Vg7YbhMZJTf3NzFLgM9j7pIcyCkF0xLqhoq6t1WLNhaQTOpq7mcvFfpEyNmNr
         NMpgYgQsWDo6I2Dq64vjNJTMPkEm2btnrklBcBzl//faXUlmJPNSpwt0xO4ldGoeYEqs
         HCbw==
X-Forwarded-Encrypted: i=1; AJvYcCVhHvO4PUlXa3atEjPzJqID5QqJHqS2f2sfDIUkRzDaPVt9QdlCU/kc+aw7KyY9jVQ/+T/kNlawAQ6fq+E=@vger.kernel.org, AJvYcCVs5slNmMzKWSgq0FLLOvDjuxJUmasegc6SCztF3Iv0Knp95sNtvwvLE0Rry+MHMMb/TrsUmn2CW3CIlsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8KiRc24pTSXVV/bCQE1u1ZsyNk206H0nj5ai+n/yhE4l5bNPP
	NdnENFJ9t4lYgLhvxbnXLKIBAx9Fvfhow49Z5omvMVylIOxsQp9g7Km2cGd3ZaMiSpGsaY/Kexj
	j8frHNsK4K1Vjh4wXzymmlT3JTmKCDhKvHbBShMU=
X-Gm-Gg: ASbGncusiikHXGL3SvQdgAeS02ZF8xMBDD+bxXZf8XLBb+mtiL+BB9MMCthIhgf67Y6
	GWqOxeAY/lxYNSu3vlP9Y9ruWfHNNoA7uopiIL0UmbvTlg9vGm8nX9+g4ph3ZblgfnRZMdU1xr/
	iuCE4bhpcCAOkMlmws7J9QJtXN88sjecykD8hbl61qh8g=
X-Google-Smtp-Source: AGHT+IHVLeKPvjWhLiEPl0f2FVlhTG8fSUCZfh+VEwlG/bHm3jjxUD6UhJ42wGzBGMVKWRIdPbpJKXU51NRWNY9Lvt0=
X-Received: by 2002:a17:907:96ab:b0:ad5:2e5b:d16b with SMTP id
 a640c23a62f3a-ae34fef316dmr1106599366b.27.1751224514565; Sun, 29 Jun 2025
 12:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
 <CAKEtaPAr6g5bGFwPJZXRHN6p9u5SrUo3kQi6Zcpp7hbFCp-J2A@mail.gmail.com>
In-Reply-To: <CAKEtaPAr6g5bGFwPJZXRHN6p9u5SrUo3kQi6Zcpp7hbFCp-J2A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Jun 2025 22:14:38 +0300
X-Gm-Features: Ac12FXydlwNxphQQICIaM92cAbX2WVQiWOlAM9z1fp8Uu1oKuuhB6Lx6O4rANHY
Message-ID: <CAHp75VcPzq9XrFD29+uZ1rbFcDxb4UbXNkv_QZ=3iyVm3dxyPg@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 4:02=E2=80=AFPM =E7=8E=8B=E8=89=AF=E4=B8=9E <zaq147=
60@gmail.com> wrote:
>
> Dear Hans and Andy,

First of all, please stop top-posting!

> Thanks for the feedback. I'll wait for Andy's opinion on this before
> taking further actions.

TBH I don't know what I can help with or should do. I expressed my
worries already in one of the previous emails where I suggested to
check clang-format and then when we see the first attempt of using it.

> Meanwhile, I understand Hans' concerns about clang-format changes and
> I can prepare manual cleanup patches as suggested if needed.

Or you can try (without sending each time the result) amending output
of clang-format, or you can do a set of scripts based on the problems
found... Take your time and experiment more, no need to send a new
version every couple of days or so.

> > On 29-Jun-25 1:30 PM, LiangCheng Wang wrote:
> > > This series applies clang-format and fixes all checkpatch.pl-reported=
 ERRORs in the AtomISP driver, excluding the i2c directory as advised by ma=
intainers.
> > >
> > > The changes include:
> > > - Applying clang-format (excluding drivers/staging/media/i2c)
> > > - Removing unnecessary parentheses in return statements
> > > - Removing unnecessary zero-initialized globals
> > > - Fixing space issues after unary minus operators
> > > - Wrapping complex macro values in parentheses
> > > - These patches focus solely on mechanical style cleanups with no fun=
ctional changes.
> > > - WARNINGs reported by checkpatch.pl were intentionally left for futu=
re work to keep each patch clear and manageable.
> > >
> > > The full series and corresponding commits are also available in my pu=
blic Git repository:
> > >
> > > https://github.com/lc-wang/linux/tree/b4/atomisp

> > > Changes in v7:
> > > - Split previous monolithic patch into multiple smaller patches
> > > - Applied clang-format to entire driver excluding i2c directory
> >
> > I took a quick look at just the clang-format patch and looking
> > at the bits of the diff which were not collapsed by github because
> > the changes are too big, it looks like the changes which clang-format
> > makes are useless and often make things worse, e.g. just looking
> > at the first diff which github shows for:
> >
> > https://github.com/lc-wang/linux/commit/8a3bbdba275e42dfcb0af2ddcc2f274=
63bb316d2
> >
> > which is for drivers/staging/media/atomisp/include/hmm/hmm.h
> > then all of the changes are undesirable and unneeded.
> >
> > so the running of clang-format just seems to make things worse.
> >
> > I appreciate coding-style cleanups outside of the i2c dir,
> > but it looks like you need to do everything manually since
> > clang-format is just making a mess of things.
> >
> > Also if you do manual code-style cleanups please do one
> > type of cleanup per patches, e.g. only fix indentation
> > using spaces instead of tabs and do so on groups of say
> > 10 files at a time to keep things reviewable.

--=20
With Best Regards,
Andy Shevchenko

