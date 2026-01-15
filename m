Return-Path: <linux-media+bounces-50806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D40D25CE6
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 17:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 241FD30A1313
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 16:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019CE3BC4E6;
	Thu, 15 Jan 2026 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjTeWfju"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0233B8BB1
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495276; cv=none; b=kn7ZaNfdpLL5TghfBJexnP+e5ixIxfkxFDkN314QBhEH2uG3aM4IVZKC8hT6hqhAjju/AdJTtFNmKv/1rfVOJeeIzUTgK8RU0Js1WhnL+yUPqn1kLR6ZKv0/gNKZT1aVYsHa+aQhpuoX5Fm0W0KQRwkQHWy0OaTiqk7RJw+8B4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495276; c=relaxed/simple;
	bh=+4PWdSBg60IK47JG9Drbm1wnM0TZv702uNZZZfQzlR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6JmVD1MXiGsLS5DqWefJU0LsttPnw6LCLVjJUkVdKXNTXthcWgvJfm4hoOcN2cQh924c6NRVEfzLj1Wc5QP0UztuuE1TGv7yZ7LLDy/SodbCwle31tfFTq3GF9S6dYWoyY75tS48RYQZuCcJymemWpSjO7uPBJgx9s85Syicxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjTeWfju; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so272639266b.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 08:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768495273; x=1769100073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JU/8ioXQOx55JlcUUUaOWyXEMvHCOB13Q3XcCjMtog=;
        b=XjTeWfjuVzaUlxN0L6VtfVarhQFyMnd53OOLGqbQRX/S8E0q4JvpHRoX8Q1Vpd4Q+3
         O/OnVwk6xZcWd4wPrTSbWEh9s+CwzSxrKxEEQuBbscCnyfOlqt5tHCLGXubGSsYeXF1g
         ZM5RxfAz+cQrZVhU9MidVHd81FAxW+KqBMDhJPwdIdn9iRp7Z06GX8hfA3M4z0FmKpz0
         27o7UltRh52rMP4oOGK0A1FrrBEtCOi53xPZEFiTimZPuewCHaFlImY+FoWLgx5da46U
         BnOUgKKzEO774+xhJE+EK5h+KF3j8W3umo/z9YFoh77s8xL8xlcYk4zWQh0avz0SOZfw
         +hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495273; x=1769100073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JU/8ioXQOx55JlcUUUaOWyXEMvHCOB13Q3XcCjMtog=;
        b=Rbpg/DZd3X8th53NL3oRvnS3fkkx0miykYz2AV161kYNhBUYJTBvwsX8rqWcGg05cP
         NjHDOvwaS6kBr3ysvXeHLJeRx9m98LmDdlYph4KGrlrGqN3HH4zOOinZuPFJ1NObHDBd
         /SAgXSl/mYgt7e01id5zdlOpt3fHc7XfFBu3qiZoAgO/ugbrl9UTRVYUIHX2bPc9jwVg
         DSKePqtnWbRgLZDE8nzZ+JmcT8L5DH0G8f0bzhFrCGZO0Mftb8jOJikii60Y4GPvU09B
         XJgYPkyy6qMj/zKRxvKNwPY2cbpZi6hHWHVWmsAkegomTZ0LwAerElRNP+F4X9gF1X08
         i+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVvLAWYiLIRHgj1rpyA9HIz/cpUGGg/SacVV1uv74mNNznc/z6Yw6YRGS3J7rVwK1xNoxnfV71DsqTtRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDb9LIaUvGaRP36oFCosLzFFE/Z8Fxu05yX0oksnIKZRMajzU
	r0BeAViBBFE31yfZPaATbfr6o0GamKVa41c7DmIvTDY2FYs19kxN/kTEkUTQ6ISp+R/SpxYhkfj
	iBFN15SRpLfQ7SW8PZJtfLRhuXA/KZBs=
X-Gm-Gg: AY/fxX4NHggDNcdmKobs6Qq9nfkdMoXjjNz50vS1brvUidMBw9/YAb+5XvntnMRHTqT
	r5TTttOlhb0LLZlBg2UKGi8j0vcCuSKhLDJlWxcPe6VNbryh5B48xv5bQDYRuwDfY2/tLd+pcRu
	tLj2eeoDFuqfhPe01CIQNRljPmfYM7kPPDVjxsWo9sslCpqesT9uejYnzW5er4HxwTU6iEcDBd9
	3PmhzUIF2h8aSLX7pVDgtw0OiMJNyY7Yk3pMFsxuDfEdmmIK/j2Wq0buQt9FevPSLcTgTNa275q
	WqqMWdZa4BY29IZJ50WzqP9ylqF+ddEuexgxzBp+2av9vtp8M4NtZRhSoC15CYb2HxItsY8=
X-Received: by 2002:a17:907:6d1d:b0:b87:2abc:4a32 with SMTP id
 a640c23a62f3a-b8792ddb989mr21591466b.18.1768495273050; Thu, 15 Jan 2026
 08:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aWjiwto4BQS8Uudz@smile.fi.intel.com> <9980e019-d95a-4618-887c-2126e38cba73@gmail.com>
In-Reply-To: <9980e019-d95a-4618-887c-2126e38cba73@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Jan 2026 18:40:36 +0200
X-Gm-Features: AZwV_QgH_P1lsy51S6XSbgBuUjhJnYU6hcNQlnwXZPC1uHXxEMDopLUuvkCLPxc
Message-ID: <CAHp75Vc4DSk=-tf2oFJyd16GSSdWO1NELsCPe26BKVKUuq_Byw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: Fix typos and formatting in headers
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, dave.hansen@linux.intel.com, 
	gregkh@linuxfoundation.org, hansg@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 6:32=E2=80=AFPM Hamdan Khan <hamdankhan212@gmail.co=
m> wrote:
>
> > Have you tried to run kernel-doc script against this file? I believe
> > it will be a difference between before and after.
>
> I just ran the kernel-doc script for both the previous and updated
> comments. The script doesn't detect kernel-doc for either of them,
> comments even with /** because they're missing the struct
> definition in the comment like:
>
> /**
>  * struct atomisp_dvs2_coef_types - Brief description
>  * @odd_real:  Real part of the odd coefficients
>  * @odd_imag:  Imaginary part of the odd coefficients
>  * ... so on
>  */
>
> Though, these can be converted to be kernel-doc compliant if you
> prefer it.

In this case it's not needed. Please, clarify in the commit message
that even if some comments look like kernel-doc, they are not.

--=20
With Best Regards,
Andy Shevchenko

