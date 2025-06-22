Return-Path: <linux-media+bounces-35555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C719AE3237
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 23:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 539BF7A2550
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 21:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51224218E9F;
	Sun, 22 Jun 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EE/KdmJb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453DA188735;
	Sun, 22 Jun 2025 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750626381; cv=none; b=u6WDyvSDXR6uKYT/jZyylEAgHPN4hXgpEmo1Lkv0R6DxMA3M0Q1PRB1fgDaBWzKxYTMdNFJrdQmjfMniba/ApsCYhEPjQfA4ObXp16p760aSvF5N1febQbRXVPxquJvekZz/7TD3G3YZLhdlDuTeV63ZzXSsFWkRWMdyWC16CHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750626381; c=relaxed/simple;
	bh=NWzDGpNRKAx5LTZPPv+zsQaAeKN6TjUwwcjut2zfsDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKdpInf+OmRwyMyV40hNeY/GYUHol2BPlxrfqCCbVNJnEzgJD6Nk82rQKNkl9NFIABpYpC6YN3+Y2QF8JHTDjQtVZ6NRwbYKeASMdZw5wzr2YmZvnOlycZYws61Hdtkt3AZC1iYKZlDUZoCX6IzXLCzamg0xWIrMzFdGapHJLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EE/KdmJb; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e81e8321f11so436661276.0;
        Sun, 22 Jun 2025 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750626379; x=1751231179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWzDGpNRKAx5LTZPPv+zsQaAeKN6TjUwwcjut2zfsDs=;
        b=EE/KdmJbirNHOqTDFaaY3vhNhosDMx9VcgPYhIbv8CIvnQ8jvUreofksZxqT++RYnl
         4j2kXpu6jY27s5UVS4qtRE7id58J9KqbIqn6Wo1vH7NA4q113qK+XW4w7bv9rRcoQEVB
         XSCVxP2XaKdex8ScYRiN+Gxf/XGTF2yEfSg0F19HsdejCk8XI/PyybnV34YqSWWAlVuk
         EyoVB11iDWgotWScQsQENz1WpyFMY+4upSzUSZh6CeJvxTUugHXpiB5Ii/4UHgOft8X1
         Emimwp//FMBsyuuduy8+fygK2LlkgQ7pHM0Pt2DSgKb8jZVGmqTgNiKJbcZimIe+op8W
         D6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750626379; x=1751231179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWzDGpNRKAx5LTZPPv+zsQaAeKN6TjUwwcjut2zfsDs=;
        b=J7McfQGG36X9SKb5eblIgs6RTr0Gd63o67GFOBnNhU1yFwW7fqxdjdQcbtw+VnaP2d
         JCpBr4u5gDMNm/ujhfcCjzvgQgr7S/8fx2T+yiyy8VXDqonGf25AfZduSACyA2smgmA1
         7V0HFe944HNbuC2gd+NK/e4IcTX1QyG4y6L0GhKzNe/QbJQ1GluNTF9i3P6/f5os9ZZQ
         +eqQ1BpGn2T4RPgjkYhIiGyO5/aWRJIfB2wZg+LVKHOnbUFLzqDLy9bDr0q/j/G+tVPb
         FU6zR5yOvQE9nc77kO/R/NL6VS/Dl2RC2Yg9vd6NS4jd5o4lfRJJK2GxqGayNbiEL3as
         HLaw==
X-Forwarded-Encrypted: i=1; AJvYcCVNGJ/X78H5KcrnHxYDYFFoja5IhHJn/sBbUjM5uq7SukOi3cL7nqSaOjI6eOLQVi1e4lzFHt/Q/TxT1HU=@vger.kernel.org, AJvYcCXBZTe2LC1LJGNXvjRdhRzzZrwa6WStVYnf02sTd1Gm7jW/X0huS2h0UfkfINbWo7ooaFjPGlH9E/JJDmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgYdb58Dr7lUKxEV8du6aycz/P/UfZ7cb+jcIHgbMJNchqsgf0
	PRp7xwDwzOBHIFHRY2ynFd42k5EGM8yoreHRK0Q8so5Sv47T2ul66N+1vt5W3lVZxqggqLA47aO
	TEDeji92qhxGECSn83Wptf/eOVqVT9e7kiYjcPg8=
X-Gm-Gg: ASbGncvascAHvj52nrYQ7zBN7TErjlLWum/Yem/6Ebu8icxzkqJYjbHms0rQeg4gw95
	YPEugr9i5+XlWAotyNh/UzV6xULcdzyrjyVaZuODuApJmro3v77lPrEj5TcDUey/xdjGfbK3zcB
	8V0V7U5IxmMZrnLroEwZiiGiMfY5HE1RRze6FBn7i9o3qC
X-Google-Smtp-Source: AGHT+IFGrqBN/2R6ntMvJfxc6o4I97fmHwiONrNJOzkLPDItxQYsP9dIxzwq0CFddIgNcyu3n3mT8YG03yCt0yae9ts=
X-Received: by 2002:a05:690c:4d42:b0:70e:6261:f7f1 with SMTP id
 00721157ae682-712c64f59e2mr71429197b3.7.1750626379016; Sun, 22 Jun 2025
 14:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
 <CAHp75VcKQGvcgv+72=9CY9yvvmzTDUaiP8xZZzQCyd553_tqYw@mail.gmail.com>
 <CAHp75Vc7=WYeay0xsvVd5NZ-mm+WdU1LrzzFAE1GrdpzH2JjEQ@mail.gmail.com>
 <CAGn2d8M9_NG5f1gpksdrMkUs_0Q2LBS=qAZeAciF9-j38Nq6Nw@mail.gmail.com> <CAHp75VeTbMORBBd0N65w3m4nZ8s6GUKaK8u40P_+Ki8yPPyCxA@mail.gmail.com>
In-Reply-To: <CAHp75VeTbMORBBd0N65w3m4nZ8s6GUKaK8u40P_+Ki8yPPyCxA@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 23 Jun 2025 00:06:08 +0300
X-Gm-Features: AX0GCFun8UdhqvDtHP3vM1IGjNHE-0ZTSOfl74h7mVd0WUwZRJgKG90DamOkZvk
Message-ID: <CAGn2d8OrqEqZnkENHau6b75WqpN9V_pG1kJChMEQvwQOa40cmA@mail.gmail.com>
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

On Sun, Jun 22, 2025 at 11:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Jun 22, 2025 at 11:42=E2=80=AFPM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> > On Sun, Jun 22, 2025 at 23:39 Andy Shevchenko <andy.shevchenko@gmail.co=
m> wrote:
> >> On Sun, Jun 22, 2025 at 11:37=E2=80=AFPM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >> > On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
> >> > <abdelrahmanfekry375@gmail.com> wrote:


> First of all, it's a bare minimum, which means that you should go
> deeper into the code to understand the issue to begin with. Second,
> the comment should be put in the proper place. In the code it's
> useless as it describes something that is absent in the code for odd
> reasons. Talk to your mentors and ask them for help because explaining
> more is basically doing your job for you. And IIUC the purpose of
> mentoring is to make sure you learn something and have acknowledged
> this in practice.
>
Thanks , i will come back with v3 with more explanation and details.
> --
> With Best Regards,
> Andy Shevchenko

