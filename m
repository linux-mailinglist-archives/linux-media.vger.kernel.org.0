Return-Path: <linux-media+bounces-29230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEBA78E62
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 14:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74EBD188E535
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3822F23908C;
	Wed,  2 Apr 2025 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McTJcU14"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE2C235360;
	Wed,  2 Apr 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596911; cv=none; b=KNEQPKG+xK2n2wCW5uMtGxdDSiBdavu73ATVNYWeTG7SyNFfi5sydNWpECbe4F6EgIpgs1e3G+Q97J3qVXTNO0gz0qq7HzFx3JCKgD7JNeXe9gtKxoi4oSu19pYXaPYoo1eDt09XuZ5/Aqztp47RFgqqs+rAlWicuB3wyovKfRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596911; c=relaxed/simple;
	bh=3GJnv086E8giW2AgWyctw2s3hdsLylkH8BB7S+aQQ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVwUEKJU65i5NmcJjfl1WAcXOJQXQu9GI+PDwxEIbfbUQV//PUUwEJ/AKh0mCIVY31oYFpXOxhnUE63bhDRmVyed3HijVsQE8zLr+XFpgVIwvfvjD4SEGf5wPUHOvb7L+QKfI1edU2a3LrB7ooyu8oBHTODV/Y/C5GG7uvte1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McTJcU14; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4775ce8a4b0so65380881cf.1;
        Wed, 02 Apr 2025 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743596909; x=1744201709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GJnv086E8giW2AgWyctw2s3hdsLylkH8BB7S+aQQ0A=;
        b=McTJcU14QT7H7vtWGpe9Qyu2DswOlnsHOrWN+zRGhQPsezl6X5MmHIgiEp5dp6HR+a
         s7kyg3NdWUcbqdwE4Z7lK9lC8ES7rvoufCqXLmWKAgFaHgmVYH/UAwQDlrHLS4RYWxBK
         NFJLAPGv8K9OibCRBRGJqVSSWGz9yr56kh/DALHKxACKa/z/gq0sRZ6pOCk1grjwp+fL
         ayc2P3gSPZGN+j8OFsrVSAsXqBBOJNbZh8u4toSawH/diMkNciuq9qoAyjw/k4NnV5wG
         9phGcYpkJ+bSslF/AQHE0FGo4gz1G+ugivcuLAk2c0JjbB5Dl6qzE40ss0uGnz3ztN/S
         Kg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596909; x=1744201709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GJnv086E8giW2AgWyctw2s3hdsLylkH8BB7S+aQQ0A=;
        b=kA7TEs7OZz9HJ0F06Qn6ZtaNhyx5FVJ8Z3l4u+5bUNb9MnpXb2nsWl1eqmC1vt+F2x
         Ffexa2aOHYXUG867nFJJaD/1AO4oWHYa6gS1P+Gk2lGthFxkR09pkXl+Povqk1QuJdei
         22Ecub5HopAnBZiktLcN6+/oaJ6EFn4vGOBJB3f6+cCMqOe0lGnOV3APiwnpRRoUxC7u
         XUAPr03izXyHbjAsbgRwj+pXCGgxz4JlvkBQ95gYmCGxLg7unJARagVT9+/ftpCoore3
         M+zjo4jV1m3T13TGggUbOCFhG6mzJw/cMz8qA55aTs+2P+090Ly3illKAqY2wZ1WQUcH
         RnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw9RtreJW+tjft5qnTq/SWp7KMrLoonaCqogZTMmENW55HZOcQc7IWV0NQjXhn4U6JS1hs5m9EfOKw0A4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5E4JyxbfW0z/kwq17UlaILpzJJUnMqZDr7RZ82iFsmLoHv+UU
	nk3JRg5xwVJMOE2uLSJMGekxti6atWuAUGyQm2Kj8y+hH1y+shsN865LoDAX/RHnoVzKR32Khzt
	j2/6tOdFq4KLiEusy8EuSB6QBU1Q=
X-Gm-Gg: ASbGncu9J4QDsSao1VidG95/fwS888/KRvzCuHK6YKqyYwGZiDdSge1E5vcH9eBubXQ
	hHkBHj09SJVn/c1LTQbkmowUdr7H2kWQZtBx68UYiT8xocouJzS0vJMd+J+F87sExOsKF6877Bu
	MKuyXmo6qM+0KJEVQCwqvyFBos1LQxI+R9fA4LlNS0zxl43Dvpum5pTM/kpw==
X-Google-Smtp-Source: AGHT+IEuUnjhwnbiKPNa2iql9SktgL1DtzPXqOEtIP0f4sok+TQAufPBAnt51aXcIpZAD242gbrDpZ9sN4sj8A+JfDA=
X-Received: by 2002:a05:620a:171e:b0:7c5:44d0:7dbb with SMTP id
 af79cd13be357-7c69072f194mr2490451885a.28.1743596908669; Wed, 02 Apr 2025
 05:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com> <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
In-Reply-To: <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 08:27:00 -0400
X-Gm-Features: AQ5f1JodykYOOexOE4Nc0cNNufpO84gEFflIgsTdTE8NE3csTAuFfwB702epNyA
Message-ID: <CAKUZ0z+mqGwyEt8oem7gLMXbNp6D3MPPMXEH5GCdA4_768d=5g@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Fix indentation to use tabs instead of spaces
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:12=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 2, 2025 at 5:40=E2=80=AFAM <gshahrouzi@gmail.com> wrote:
>
> Is it your first patch to the Linux kernel? See my comments below.
It's among the first patches I've submitted.
>
> > >From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 2001
> > From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > Date: Tue, 1 Apr 2025 22:04:25 -0400
> > Subject: [PATCH] staging: media: Fix indentation to use tabs instead of=
 spaces
>
> First of all, your patch is mangled. You want to use proper tools,
> perhaps. One of which is `git format-patch ...` and another one is
> `git send-email ...`
I was using git format-patch but not git send-email which seems to
have been the issue. The meta-data from the patch was getting appended to
the top.
>
> > Replace spaces with tab to comply with kernel coding style.
>
> Change 'tab' to 'TAB'.
Got it.
>
> ...
>
> Change itself is okay, but is this the only one case in the entire
> driver (which is something like 100k LoCs long)? Even though, and
> while for the training purposes this is fine, you can also think about
> checking the common style of other functions, which may be shifted
> with TABs, but still having not enough spaces or so.
Good point. Regarding formatting, it probably makes the most sense to
address these issues comprehensively in a single cleanup pass (similar
to https://lore.kernel.org/linux-staging/cover.1743524096.git.karanja99eric=
k@gmail.com/T/#t).
This particular instance caught my attention because I initially
thought the author might have accidentally used spaces instead of
tabs. The line in question used 2 tabs + 8 spaces, while subsequent
similarly-aligned lines used 3 tabs. However, after examining
different files in the driver, I noticed that while the formatting
appears inconsistent, it likely exists for specific reasons. It's
probably better to avoid changing a single detail without considering
the broader formatting approach, and to treat checkpatch.pl more as a
guide than the final authority.
>
>
> --
> With Best Regards,
> Andy Shevchenko

