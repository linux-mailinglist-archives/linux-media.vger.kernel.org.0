Return-Path: <linux-media+bounces-18689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB198824D
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 112BC1C22BA5
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD67E1BBBC6;
	Fri, 27 Sep 2024 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wq/39tSf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0111C15B10E
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 10:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727432215; cv=none; b=cMcwcbZQhQLNKNkOuBzrDjuNeM2GjUe/mEk1OeVC0yB0fsY6duPrPrp+Tkz59ofN8gOAnDNXMMr1nFT3689Cdx6iM86LpDPfHV3SwC9pWr++Z6S3ailcHyzNYVsn3dymYMk3BB1EK1tLLPuUxRt0c3VQBlnQn+sKNbHapH8rmnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727432215; c=relaxed/simple;
	bh=cAxaVY79viWfr3dOL3dJjnZC0KcE579FMqX0FSoNdpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOQJ69S3SwTzQL5LO5uPegoUuvSzBs1TvzHD+tZAapn3UDWpNGMuI+UxbUuOPSGH9/jQR+CfaedghMn++SJvXW+0OZyQq4vTNQ6FpcUJLWZjH7uUwW4lhxUn0DQ2DnDfZManQFznQrG2Kvc5LJ+yZBVMxPrTdWXLK94OEFz0jGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wq/39tSf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-206aee40676so16721385ad.0
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 03:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727432213; x=1728037013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwCiuRYsk936wm4u/HVOckfXG1k6CXzT+Xy0kwjFKfs=;
        b=Wq/39tSfgTet3ccRn4yF+YIKFSZgenKd4gLwHGddPlCX3jfUPODRNQqTFJf7ydjGsV
         Smrv3GzCVemLt50jnAqo8I4ytyE/UJjRK1uqm56MJGea7H70yuj2TJ9Fjjj+eGqWau44
         RS3/mKN2aeMUrJDp3GX5/F7LBTHM+C+p+b2Ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727432213; x=1728037013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwCiuRYsk936wm4u/HVOckfXG1k6CXzT+Xy0kwjFKfs=;
        b=WpoIfe+OdjJEcNr5EJtJqc/C830lS1k7HqvT6TUCjEJThsf2uKVCl6+DWky6NoN5aD
         JehkIdMRrFl2WFOvNifmiqqTU7yi2hKW305+bQTuAKQBySLp7WocXX/FiMckzOU9WYXS
         Ste3cx/gUHW5Qkq2Gh9ZhkjVp+aiU7bISTegFgGKoabSdS57enR9iIh8dsR8QjH8+coy
         XBhWJkBapCBJzE3RFrLy64fPY4PY6TJaz9sj7f75XBSPvjr8tMAf1GIJ7zLgBw7igRDd
         DXZZeyCnGKFqG2TdntyOH0O6j7VuxvafR6KVF9Ewak6wItq9dK+DKaHsa6gkB32OVn4D
         mNSw==
X-Forwarded-Encrypted: i=1; AJvYcCXwAs3c6Jw6GvqnZ6KAIkepydXInlg1Y9h2/AyHpi9TiHLOzhR+RhrEBUQw44ewrTCGAPlUbmgbr0YqVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAGAoO+993fxkYkDMD+VmghUjObFmzfxY17X8cAvwD4plEGGzA
	jD4fCR4eMa7Ao9a7WtDEeFcTD+znOoWCs2LdUcMq/IjrK8nBCIBAgMPjUshNII+4cPn9X96NKxA
	=
X-Google-Smtp-Source: AGHT+IH8nw7/kHDHRWDr40wr07hg4gehZKr6LvBGRqGgYJYQhLj6uZ7qB97YqeuQOtaos6ALqUKafQ==
X-Received: by 2002:a17:902:db02:b0:20b:272:924d with SMTP id d9443c01a7336-20b3776d97bmr45480005ad.36.1727432212859;
        Fri, 27 Sep 2024 03:16:52 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0f881sm10991535ad.159.2024.09.27.03.16.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 03:16:51 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7db908c9c83so1223345a12.2
        for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 03:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2Z9YayikM35Uu78khwDpcOIYt5b3ezweZrkdzi5+khHwZDyFdxwUp4wJ4eEdK8tPfbgeMgkJWObuujA==@vger.kernel.org
X-Received: by 2002:a17:90a:ba95:b0:2e0:b6f5:1884 with SMTP id
 98e67ed59e1d1-2e0b7b83739mr3267623a91.0.1727432210480; Fri, 27 Sep 2024
 03:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
 <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org> <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
In-Reply-To: <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Sep 2024 12:16:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
Message-ID: <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

On Fri, 27 Sept 2024 at 12:10, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > The str_up_down() helper simplifies the code and fixes the following co=
cci
> > warning:
> >
> > drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for s=
tr_up_down(enable)
>
> ...
>
> >         if (i =3D=3D 10)
> >                 phy_err(phy, "Failed to power %s complexio\n",
> > -                       enable ? "up" : "down");
> > +                       str_up_down(enable);
>
> You never tested this, do not bother to send untested material, please!

Do you mean tested in real hardware or compile test it?

I did test it:
https://gitlab.freedesktop.org/linux-media/users/ribalda/-/commits/test-new=
linus

But obviously we are not building that file :S. Let me figure out why
did this happened

Sorry for the noise

>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Ricardo Ribalda

