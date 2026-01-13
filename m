Return-Path: <linux-media+bounces-50573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7889D1A186
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF8A5303B1A1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B682B36CDFC;
	Tue, 13 Jan 2026 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9S1vkOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20253451BB
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320552; cv=none; b=Zz79n7mBSfM2Wq+5NvozzJIJU914R6FmiAznQpFbutNZ82EUHWfjjZ8vZlDOLMUAMG3ZYeXCNPTEdRtGwno4nf44OiDVVVixG0Zwl7rqW5M0B/GVm1M+vOdkb6n42FmXh/vNhKNYmqJwzA4QCO+T5U3r8oabmNazR8nIZUgdcGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320552; c=relaxed/simple;
	bh=XPTzA4rbEuUKeMehzdYIUkN4IWvw4Daz8IFyVgbjSyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kl37oxBuelMFU5+zNqnMYIhZ7TIx9W35aDp9gEAyMSqi0idsDO92Xcpof42HpA7F/whHpFlViDanKehAB4BYnwzC10nm8DhCEfPwbcG6vEZ1HQ8stYQzdIf+UsFxe4W+9zFsjc7l+ts+pYS/wKoNsLOje/xf/9SpyRVVYOWAG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9S1vkOP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38316445a67so38512481fa.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768320549; x=1768925349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPTzA4rbEuUKeMehzdYIUkN4IWvw4Daz8IFyVgbjSyQ=;
        b=E9S1vkOPMMOTMkH9vGVt5V3RVHcEq4EW/Do6DEGGeEPXGVq3FXEUc1z9X4XHpm4JMT
         yl8VPG+6uEOGc+6razqcgm/2oQ09yc4lrWLxn+ugijPU3fJYL7JE3k8K4OncDaQx/8sU
         MONMeQqumzzTAvnn0wjhcqP5lqmTLGg7TiPNxJz86prlqABb6fHCh3RJHBaSMSF3+iDx
         FOfZHATaJJo+XfUpZit0FK4p5GYIVebcXy0zWxFReI/EH+W4gTeFL+evrqbzEzl8HDKi
         iWnDgWSfpccb/l7ItmXps+aoU/2xNoF6Z6mN9F1eHDsSxw/A7F0DfW6pAGPJIO2VKCHi
         6bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768320549; x=1768925349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XPTzA4rbEuUKeMehzdYIUkN4IWvw4Daz8IFyVgbjSyQ=;
        b=QtY5eP9R66Qno6M3ajPaZwS40hdqM8QJq1GHAmbzH5+pRJmtzBQk701jCCHnF+I71O
         M7wn5fTfaxpIbMLu2JCJzR4Lkq3+RjJ+N1RRtu7uT6EVLkLGSUEIPRyn1e33CehhBj8P
         +6Q1MTmV22MecU45Qn3N/3+zGmsMHh6P0olyZaWhPYlLJ8dP5OV7aITvTfNWpL/H4cN9
         pCRBA6lNpTmWLEyatSVFoVxWx74lbKwtb4CIPSKh7qjZ4VzmcZ2VBlo2+zkRoZ9D5tqe
         WTgvfRiQDUzboydMAUEk3oepyKrPQmyEURFuh2Ch0hyX8YeyZ24RKAg7jhalkbU4kfm7
         GRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMl0z2Va6ZTMqp2HROpsuJDX49gxTPlm2oDRypDtp3bXLdzL0KHV8U3TYYhZN2k44KG8aR444Q8a/TgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJJnZgnnkL9iJ0hQgQ8d9SfNwR+AqTc/e9Vac3mlQJVLGR762y
	/YR3fbbHF9+FZ1yQ27aFHAuer0opIfz36RG+jrK5StnrUDMRy9xO6vNcOKPNYJL8fQixX10SWoq
	A4guWCLC8IjiItPFbtAWXpWq5aXOg3zpkRFoX
X-Gm-Gg: AY/fxX4YgviRZz2oNG9/y5pfxo+S0ncS2OokVQrznmuUrir3c2CNAadeEeVx3QN0R/C
	DtlpAi45uuXF4YFUrYppa6lSPC+ruSo6t+8kwa7bD7Vjd34WlXWM2MPL6EVH/KyODHtvb2y3BC3
	C1yLG0uOajamSXS546ibIgSitDqq1u8aUFXe/yUWJKtdrCtFxe3xnSrHRmmSD8mmBes+OYh/lqv
	6rDtlA3KzzF3UO8qK7yAU+QDc+fj9OROMVp2sHo2d2x4O1ik9/ruUPC3zGbG5FnuTuAqk8Zvw==
X-Google-Smtp-Source: AGHT+IHePHMDyoi6sr0yljTx/L6uNJTAHhACCTqgMHSNmrJtCfTvA9/YPbW8Y42q7oYdiGaWSr8QPTCuea49dVmU3D4=
X-Received: by 2002:a05:651c:1596:b0:37f:8bb4:6b with SMTP id
 38308e7fff4ca-382ff82321dmr57334941fa.38.1768320548451; Tue, 13 Jan 2026
 08:09:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112190054.9828-1-dev.anubhavk@gmail.com> <aWVIF_rkHzxs3k-r@smile.fi.intel.com>
 <CAF6CsJwg8EFtCT+zyKWex=RbWu4TyZanbXnqip=J7=sCZDab5Q@mail.gmail.com> <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com>
In-Reply-To: <CAHp75VcuO2qNeWLcrDqVfE_aQs=2ZiRB0CDxJpFquXJ6jd5eSg@mail.gmail.com>
From: Anubhav Kokane <dev.anubhavk@gmail.com>
Date: Tue, 13 Jan 2026 21:38:56 +0530
X-Gm-Features: AZwV_QhWQUVOnPDw5tPps3huJowa_xdkMpSs3Gvbmjzbuuh8CFwVJn92wlqUGAU
Message-ID: <CAF6CsJxKZ2FvRWVR0SjyfYR=Nj+4uCMgaJgO4BVBtbMvakXhVQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 4:16=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > I looked into implementing kcalloc() as suggested. But the issue is str=
uct
> > atomisp_s3a_buf (and the other buffers) are defined as list nodes with
> > struct list_head list embedded in them.
>
> Yes, and how does it affect the allocation?
>
> > The driver relies on adding these
> > individually to asd->s3a_stats and freeing them individually using kfre=
e()
> > in multiple cleanup paths (including error path here).
>
> Is it the issue? Instead of incrementing by a pointer size, you will
> increment an address by a structure size, this is how + operator works
> in C from the beginning (or close enough to that time).
>
> > Switching to kcalloc() would mean the s3a_buf is no longer a standalone
> > object but a slice of an array. This would lead to invalid or double fr=
ees
> > if the existing code tries kfree() on this array element.
>
> How? As I showed above you need to carefully move and replace
> individual handling by a common one. So, instead of allocation per
> item it will be an allocation per bucket.
>
> > Addressing this requires a larger refactor of the buffer management log=
ic
> > across the driver,
>
> Exactly! And that's what I think is the best way moving forward. You
> will kill two birds with one stone: fixing the issue at hand and
> improving the memory allocations in the driver in this area a lot.
>
> > would you prefer I stick to the sizeof(*ptr) hardening for
> > now to fix the checkpatch warning?
>
> See above. As now I think this is unneeded churn as the idea would
> still be the same =E2=80=94 moving towards kcalloc().

Hi Andy,

Thanks for the explanation regarding the pointer arithmetic and bucket
allocation.

I understand the approach now, will work on refactoring the allocation
to use kcalloc() and updating the cleanup paths to handle the array
correctly.

I'll send a v2 once I have verified the changes, though it might take me
a little time to ensure the cleanup logic is robust.

Regards,
Anubhav

