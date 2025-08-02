Return-Path: <linux-media+bounces-38738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C0BB18B83
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 11:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 882B15613AA
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 09:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BE72045AD;
	Sat,  2 Aug 2025 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fjeg2Ipm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757787262A
	for <linux-media@vger.kernel.org>; Sat,  2 Aug 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754125362; cv=none; b=ugiaGTYVJitr37/ZOGB6LbQBpHuHMBSeQL9Zq3r0HLTO0TYJE9Y0Ou59SC9Nh5ZQVSrUvQ6DJYKrxzXpiw6ff6n7rbCRwIC3J2ZGJswuTHLC77LQ1P34t+6FikHYgdFzcQCFHKFCxOdyhaFvoZAuOegmK1oDrw4xs3mKYbmOpoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754125362; c=relaxed/simple;
	bh=tE/ycKV78Xqu6awmy1vGaYwLfvEhozTkRG8Leg5kafA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M70YB0kSTynJalj08J9m4k1FTmu/ZiFsBlUTVz95VF/awKbbEXpTnJBDm/Qb1bO21rbmrb/Yv3w3x0GocgPsNp85Xy3uW+xA3uR3qArTGCDXmVEf4ccjSNItRc3+Zh+c9wh9CJmhtF4OZ/alMqrqWoSqH4DcfWonXRvdvaZzBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fjeg2Ipm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso16873065e9.2
        for <linux-media@vger.kernel.org>; Sat, 02 Aug 2025 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754125359; x=1754730159; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/dnL5CfASf7BSwg8zUGgo87QSvNoaNIJBZuuBOd20Y=;
        b=Fjeg2Ipm1nAlUTzjt1e5NiFfCrabjd3DsGqN1oUa0hD+0spmCClkG+MZBoLSSDrhJo
         eubaZlnwsB7qt9nRxG4eQ2fGG/eDRG/D709GNjZ8SC+8Pu80szPf+jyBbVt1/uTZJAYp
         pfES1rgdIy+iTJZi5pbw/D1qfzRdKJJ+C3dcKQTnjl+e0n5ysDsIVaAxPYEBn0XSseVS
         0jgEBV6+p+uqBtQ0Z6CPbgU8QCE6rZT9pK4xCdjVIq1Iidno2AlBfeK+78UyZ/H1v3AH
         JqiJPGhBDMDCm4vmyvWpFvpEZk79csXEvKd50q0wpgPwj/9YDXP/XIc3ev8etpadDkqu
         IA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754125359; x=1754730159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/dnL5CfASf7BSwg8zUGgo87QSvNoaNIJBZuuBOd20Y=;
        b=BvU/5B1T76+McGrxyPNjN9C0pLUH6HAIvgpQzUUDRRRJjihl5icS6e1fCi3iqXSspY
         RawQMgVm7pBGE+n784IkW49iVW4xtLLcpbYCCSEvqITAchCFYwYdMcq5ECIWWoOBFtX5
         zlFrpfPm+vUEsazNkLg6KmigFVa5cZ+X1pODCqbJv8K8iwVRgbTCLJ2BI/xqhHqqM0N4
         5ouY8PpPQ0BFh8NiFIL83T48QV4Dpi0Z3qDw9sIQjQ+XTAlGrBp1bef3kpIdpmfAhyK1
         cwOWdKmC+HdvCjwTRjyEBdBd3Cxl6VOKxO9F2ve9ACCcOKyOWq2bu66zfcAy9EG74bbn
         EfKg==
X-Forwarded-Encrypted: i=1; AJvYcCW+b02ZzqaOWadcgWUY8/AiAoIEutg09TlwHkjEYfYVkCX37idOTTwQJpUKxORcFWHeR7F2SJ/yyfiqvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHi2fVlNndApKy2EMfNdwF3rCRvznydgW6f6r5FLGobyUmGf/
	CXqyTqzZ9HBfa2sChh2+L0vF4h3S9QsbNbRKRMVUewLyGy155ArKw7WXB1Q67xh4oew=
X-Gm-Gg: ASbGncusdRhweRXJk3m8zEkZpZJ4caSb+LMFtF4Al4XQC9V5yBza7bZ9L7OmWN4mLQC
	sHgHqZHX6n4XpX/B3InWbxl5j/nRu+zHZEH9+Dj8NHhFVgEtOkf/1ZfnZTtss/sB6r8vW7/86Tu
	XGim2rv/ptUfYrghLUkRorhOybwqbGRZ6siavYy1td9+xDwVWa0Z6RR37ZKOK0boHN1+jdOFu53
	CXQJGXveP9Rc+F2hNH8N2A/bxBkeaEuF2dBzeBOn2Kgp2q50q5A+x39Q6H/2Moc+k1tp7Xr5ZRY
	mpcHsAjV+KhlcdL5OzPtIfitC32RQDGmy0PggLdKeVUT9K5EE1HJQj4BTJp6tgYvhEW1JjIuA9k
	VCe1xjWU4MBCv52CqPKqESdNsrGw=
X-Google-Smtp-Source: AGHT+IGD1hqwEMqQ7r+1+t1Ud4D2Xaj0ub7nD4dO+TqiU68vja/VuwOkDoIJFNO3HEop6/QEYJVv+w==
X-Received: by 2002:a05:600c:a46:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-458b6b30363mr15584125e9.18.1754125358709;
        Sat, 02 Aug 2025 02:02:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458bd5a1148sm6429065e9.0.2025.08.02.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 02:02:38 -0700 (PDT)
Date: Sat, 2 Aug 2025 12:02:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
Message-ID: <934c7ffa-1386-45a0-a4e7-f2b93cca6370@suswa.mountain>
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
 <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
 <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>

On Sat, Aug 02, 2025 at 10:45:49AM +0200, Andy Shevchenko wrote:
> On Sat, Aug 2, 2025 at 9:32 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> > > On Fri, Aug 1, 2025 at 6:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> > > >
> > > > There are incorrect %u format specifiers being used to for signed integers,
> > > > fix this by using %d instead.
> > >
> > > Both of them sound to me like the fix of the symptom and not the
> > > cause. Can we simply make types of the iterators to be unsigned
> > > instead?
> >
> > Making iterator unsigned by default only increases the rate of bugs.
> 
> How? Please, make sure this is relevant to this case.

You're suggesting that he should change:

-	int i, j;
+	unsigned int i, j;

It's just bad advice.  Making iterators unsigned makes the code less
safe.  It leads underflow bugs when we do subtraction:

	for (i = num - 1; i < limit; i++) {

Now i starts at UINT_MAX.  Which I guess is fine in this example...

But it also leads to endless loops in the error handling:

	while (i-- >= 0) {

Making iterators unsigned is a bad habbit and it's bad advice in terms
of the data that we have with regards to bugs.

regards,
dan carpenter


