Return-Path: <linux-media+bounces-36414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA410AEF7B7
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 14:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911DB1C04F64
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4755E277020;
	Tue,  1 Jul 2025 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS1eXf+m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9E26E71F;
	Tue,  1 Jul 2025 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371137; cv=none; b=ndADbW6/z/rpRkWMU+trcQVOCVyoEzcrqiE2ei1T92qmi9krSkn5WtMmx6Ht2TIm7NeR3l7StYlsQ6sGeY9DOW8JgKLAZuiRPORmWXdcg6ZgE0np46XM7Sh7Ul4/T+JwHAlzPVbdQscI5jgQ/6+lmVOEO7+EWP6I3C3DPxL0b2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371137; c=relaxed/simple;
	bh=Vedol4hY+rRqUDONgAmDx8al8REG5r4lfPvZiD3cx/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mclEfL5khc94nCrRnUNLrlkkfhwYCfDk8t+kSyNr8FV/9pNhqIMnGJds3nHPMUR0nOCtuv1i2WuxgbiHNhBQeDEJqS9jW/DtkGxxem06ws6Kwbd0+rSQtXFs/lutG+XAddD3UOEIipDMwCkrU5MUOX5LFVvNU4qw4HBZGnQ4hNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS1eXf+m; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-711751e2d9fso5973117b3.0;
        Tue, 01 Jul 2025 04:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751371135; x=1751975935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vedol4hY+rRqUDONgAmDx8al8REG5r4lfPvZiD3cx/A=;
        b=GS1eXf+m1n+w27ibSMDXWwS4K68wEtpXJTg6DtGjTYM+QpD3A5KR6i+fGUb6R+ayAj
         Omt4rs7Qf4Gy6yGlzJema5jUH/30GQoTjbCZppJEr/x664b/6Ra83Q2GuxembsiZuBni
         31yGcB7tfTn2bOdW90Lsvh6jgkPcsZIPmjj18Ctgs4aUm+tI2g9yKEGDYqKb88qDq8VA
         ZmSkkd+Fh1F7bdeSNgFgG4n566GQqmw3//h/7lkW7eEaWP4Jhnp6ro/3bK3Zz/y0jkfG
         c60YZjPXAyE+NiV6Sqxj7xJ2nhgoj84QvtDng7Zs86iJnd5++zJlkVD0UqoG5sVHX0L6
         paiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371135; x=1751975935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vedol4hY+rRqUDONgAmDx8al8REG5r4lfPvZiD3cx/A=;
        b=VdujbR9vaIjFDIT9Pih311iYnV8KK8V3ZGDRbw5n2WpFwf+XzumrkDNQmq3rV3taK5
         RvwozaQTd5BUGLKukap1TlaEqAcpomZsQNN9hvUbvU4EDWiHKc8DlQBUg8o/v1NrNWR2
         DAvSrtOAV/sTOZnbUQG9xuyjqzI7M3A8skSVystZRrJRRS9GtPt+S8EnkhJMRcnnexAL
         TZpcOyVt6tedjxKe0v7MZ0zRL2sMMfzMSSW8kZYbgzcl25M3XFpNdJ/CPeTUSy7Y19TQ
         dixr2slsdkn1Qr8dHpEeC/Rx7n56+rFUYS5PnH2HUaPVytIlsiPqioSFLcLA+Ueyy4fT
         KOvg==
X-Forwarded-Encrypted: i=1; AJvYcCUgMAfPinhUsv8E2v2iPA439kyVdB79dCyukzZTaTcB450Ilc/ptLs2hUqIfNwA0qsk7cmpDnhY2P3IWBw=@vger.kernel.org, AJvYcCVVm0Vn1bTZE6f35fppS9n5ZyA+2387/MKneCXEWAqt0SvpoEvP6El8BJhvTiQ5KYuiz0WXazRkvAIndII=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywovbtf01DKqbvzE/R243ZoxvETkgajojQG5xxtfB9JaHXBRsxh
	i+PWbujTSWrkCYhkbg6BmFTEGLsbxwmn1jS2UURR0cOKhOQ9hvXrAifjsd+noXJkNbTG0N1wM/o
	XRA1ce5SXuWAw+UvIMpnrXFXm4/qoHjs=
X-Gm-Gg: ASbGncsYqQRWf45iZkt1shEWhZE2+CVZlCqkH+RaVkccJu4FWlsTNCpHOFQINQCD5EA
	kx6gEfe8Qh91ZQicS5n9cCGyiakYHRItbWg/A6E6SuIR6OLJRpxwJei38PRI501DnwqDPJMHBcu
	UmQGj5SJ6AGAVizsYkKgdJZ0FRZsJSkwNJ7AodncjUmDvBwQ==
X-Google-Smtp-Source: AGHT+IGgiJowCKFFlZiwDygK8oHms47QTPESpY33t7E8BJA47fJPqG+qtL9rmc9YTIE/0oPqnV67PA1ClFix1ShCh+w=
X-Received: by 2002:a05:690c:dc6:b0:70f:7bea:5dd with SMTP id
 00721157ae682-7163f7a475bmr18155327b3.9.1751371134880; Tue, 01 Jul 2025
 04:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com> <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
In-Reply-To: <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Tue, 1 Jul 2025 14:58:43 +0300
X-Gm-Features: Ac12FXx77Wq8plk53ER_MI4X8N7_XDcU6XFGVrvytjF9j2XAfeNRxtYwsScU_o8
Message-ID: <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,
On Sat, Jun 28, 2025 at 10:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 8:26=E2=80=AFAM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> > before key initialization steps like kmem_cache_create(),
> > kmem_cache_alloc(), and __bo_init().
> >
> > This means that if any of these steps fail, the flag remains set,
> > misleading other parts of the driver (e.g. hmm_bo_alloc())
> > into thinking the device is initialized. This could lead
> > to undefined behavior or invalid memory use.
>
> Nice. Can you make some fault injection (temporary by modifying the
> code to always fail, for example) and actually prove this in practice?
> If so, the few (important) lines from the given Oops would be nice to
> have here.
>
I have been trying to test it without having any intel atomisp
hardware and failed continuously, do you have any tips or maybe some
resources on how i can test this driver.

> > Additionally, since __bo_init() is called from inside
> > hmm_bo_device_init() after the flag was already set, its internal
> > check for HMM_BO_DEVICE_INITED is redundant.
> >
> > - Move the flag assignment to the end after all allocations succeed.
> > - Remove redundant check of the flag inside __bo_init()
>
>
Thanks for your continuous guidance.
> --
> With Best Regards,
> Andy Shevchenko

