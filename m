Return-Path: <linux-media+bounces-37719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 377C8B04998
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5642E4A5C72
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99BE269CE8;
	Mon, 14 Jul 2025 21:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di5j+XFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0B2367DF;
	Mon, 14 Jul 2025 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529167; cv=none; b=cUpXqY+8ooUbvmHCx/5e/GohMbzsxj80qRpnBJlL7ytfE+TzdJtP1CpZlqhOVnOINWE3u6Mnd4oJ8BxKV8+NW2WAjpeehSYhWmeCEIqdcWT5s+/ByLtcklMfIG2YUu3ZNi7mU4LOzEKqOjIWdUxllwjTIBO1a0kaareY/FWDo1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529167; c=relaxed/simple;
	bh=m6TGmVdROEh+kbr9yjIZqVE6jmbuJqMSbTa5zUKTw6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvzFx4g0zat7bW733rB2a4HxdrtVSbeJ8dVUQoXqTICIUGMeFabOLHtmz2CzNakBLQ/sC2VJhy3cgDCsqTlS4SYStT9NTsmG6yCP+eHY2h0fuYn8csr9TuGSoDC9FPDDtSgwkq9vJAvMEXcNKxjuPPOZZTsf0S3ie+fHCgPen0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di5j+XFT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so8681376a12.2;
        Mon, 14 Jul 2025 14:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752529164; x=1753133964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6TGmVdROEh+kbr9yjIZqVE6jmbuJqMSbTa5zUKTw6E=;
        b=di5j+XFTfyj/+TqiT7NABmd4dvDVy1NWUTrTdNuAlG1dGeZmQ0BE7dNJC6/5PmOxjI
         E0IBe6K27D0p0F6+FNUJ/DjZM+LfATOXxHf4dvV4EqbhuvF43+zllWguYEFYBs9avkzP
         1MU1w1gC+UJJ/cYbfQ6lWvDZ9N+cNxmhLbk4v7qm2JkCJYDQS50Qau4ty5ghdN7ihNI+
         PqjwjXiwwxlINAOz1l8wCHoXQsn/R74c7evrkVGSADOQuBwY/4glY/kkiky1UelHmh+R
         PznNOQzWS2PRRYg8Y5Tu4BF3sC9ChsbZkCv4GLQ6P3niRS7t0/gDvpK9x8u8JcxrKA0Z
         hRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752529164; x=1753133964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6TGmVdROEh+kbr9yjIZqVE6jmbuJqMSbTa5zUKTw6E=;
        b=uxNyFyLg8FrLMsEskPhTrxmOiZcGO/IjB07//V/M/qp1MgBImnN7AtYlV1o+Y8bgRS
         Jwl4v1huzzQ8cfeNyZEh/hdd1NdVAzweuHMGvtRbSE+nHDnCvdTYIGusXIAva8DtY+g0
         KoMxMNVbH+7D7JWRPWZjH1Mkj53LCQ0GPHEOxvAiMOgPu/WOss3VljrkKbe3E+h2gPbL
         +1SXFKOx73nzGeNubJ84GOPIkKbnLyBykmtOTHK4A3USU8gtGi1NE8BB8c7SpInL2VQY
         Vz/MJkiR7dCeCXTrUZZYghvMH+pl3l1OE+qXtF/3lLMc2eunKxnf7pUt6ePzWsg7XAnJ
         myrw==
X-Forwarded-Encrypted: i=1; AJvYcCX/bOOKQcQAXUjnY+AhFmlSy4KhBCpBWYbcd2awhU12wREcF9359kux+10hZr4c4Q7BwUY2OEaiYCo2l5Q=@vger.kernel.org, AJvYcCXC1umBBp/1b4Ae5aQ6LLgddtVHCYACfH3Tbfb3XglLbEAK9lU1d2nLG2jv/dJEqbA7nWVos0iDjzMWYzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNsIU8nG/EfFfzEy3v97nbqbneKL/TRv5BvwWHTngNnfBhn0P
	8wgPHm8W2VrisMniZdVmbbPzCXz7Oz+v8qlqDj842SNd3FEeZdmeg0fpHeB/AuzjnuBtSTBH8IY
	RDj4dAFR6q/190CxJ/Ye/O6xWbz3j068=
X-Gm-Gg: ASbGncuTBRn9E3OdNuvBvY4jTXTYvdqbWrBm+sUOmy/f+r+2qlOOHPl/Plqbzj56Hvd
	1/QKtV/NU0kxiblozaiDwkESwJNzP4hUoIwkHq/hVmIQTuTsnF2ZQQi0GmnIrr6qgJylh73EyTy
	QSHFxJIM1+E1sLLU09opkMoLcdnwF+auYx8GhgNB5JJp/M4FyPgoDEHjufVnCMllqiiUmyY1lnk
	eqGwKY=
X-Google-Smtp-Source: AGHT+IGqzqAHU3cihRnjsSirtSa0RUPFO/bTodaNwIqpvJJ4wBL31wC4fLkgA29xwEsophl7ajbmtbgb0wMGxRzw7Pc=
X-Received: by 2002:a17:907:1c1f:b0:ae3:75e5:ff7a with SMTP id
 a640c23a62f3a-ae6fbc8a3dbmr1549421766b.19.1752529163641; Mon, 14 Jul 2025
 14:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
 <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc>
In-Reply-To: <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 00:38:47 +0300
X-Gm-Features: Ac12FXxzi44zF7DDDz-kYM9sXM188FyUQbg6w51QqTLshWgcl2V0XFPc0QnHSaA
Message-ID: <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 10:39=E2=80=AFPM Martin Weidenauer <martin@weidenau=
er.cc> wrote:
> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy.shevchenko@gmail.com=
> wrote:

> >Guys, please, coordinate and issue only one (or a few) patch(es) per
> >an issue. No need to send zillions patches for the same problem
> >file-by-file.

> >On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@weiden=
auer.cc> wrote:
> >>
> >> Fix checkpatch error "ERROR: that open brace { should be on the previo=
us line"
> >> in ia_css_dvs.host.c:277.

> I deeply apologize, however this was the instruction of our workshop in D=
ebConf by Helen Koike <koike@igalia.com>

This may be okay for the driver that consists of let's say less than
10 files, AtomISP consists of dozens of files in several (nested)
folders. It's not a good example for such an approach.

> Here is the link to the exact workshop:
> <https://debconf25.debconf.org/talks/55-submit-your-first-contribution-to=
-the-linux-kernel/>

Hmm... this really needs an update to explain how to work with the
drivers that contain many files and literally tens of thousands lines
of code.

In any case the problem with your contribution is not the code, the
absence of coordination and possibility to clash with somebody else.
Also it looks like a DDoS attack against maintainers capacity. The
smaller patches are and the more of them --- the less the usefulness
of all this activity as at some point that floods the maintainer's
mailbox.

TL:DR; (always) Use common sense!


--=20
With Best Regards,
Andy Shevchenko

