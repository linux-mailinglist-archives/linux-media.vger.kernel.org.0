Return-Path: <linux-media+bounces-29269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12BA796FB
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB22416F947
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EC81F3B9E;
	Wed,  2 Apr 2025 20:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPSwHp8k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DAF1F03CE;
	Wed,  2 Apr 2025 20:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627583; cv=none; b=fkVSuTet9bZubyPEgRSXdjlMd/HF7wW3nuqRWdU5DJAxvoRWaU9y18kaR8eUD5mHtVD75XRiacr19nUFKOdkf/n4gOBpABLBb60EPrzpN53xqIvzxElLaPnpoFSeniZXb+6y8+QmNXEbuiDnmuPCkiRdPL/+GUxmpgnGn4gM+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627583; c=relaxed/simple;
	bh=x76jIDWcmrLGiq+jkcC1HUTy3bnoFZrSMaBwi92oUQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N652Tbnv59O2cxCXKE+P7H+lokuKNZ0t3rE4yXoexL0KYuT1n/vmLgmpDOvEaTqa88KSI6S3YAGjqMzgwSS0TWIstbAY9AhK/OLkTZCQB54oyadP0Yjgu8lK1uBVVIFnWaB+H4QN8dvhaeN6vWkFIhLi/Etbd/c29Vl2IKPXp5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPSwHp8k; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so472002a12.2;
        Wed, 02 Apr 2025 13:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627580; x=1744232380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmH1oBwkUnyfQCZ7YLSeAR6GTqIWKOsBnAc3YNsdYWw=;
        b=UPSwHp8kYeHp1gWwFwf/tX9NCRm8HyJNQRxJETmE/5bHfbrSI5cAACLXoOPvSo3PlC
         dSjzU2tizatoun2HnvjP/QNX6hKEUXU7oOJEHf04mGn0Er30rQ25mxCxNacXpACNOnfj
         c4I4eO7cS2sc4+q6Loezap6LiTSf5D+Ir+qV/xAFWAiRPfchLaKg9jisjp58ZIFpjEAP
         lFcjV8/msLZ1vCxq2Uy3uW4F3647jaSzUfZ950JvPEczA6ueDrctCuxB/UErjRJR5Bmc
         7h8yiLge34qid/x3gR6OxRII/kTgcDxH4Cod922GJ1TmHz0s3cBCxgxRMOLfuuiZ7ABK
         Hfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627580; x=1744232380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmH1oBwkUnyfQCZ7YLSeAR6GTqIWKOsBnAc3YNsdYWw=;
        b=Ai53FQcTdaKUmxgkbporbH2uRTeUQmlciqiwWb0VccBWo9paiUhXA+oB3gV3AqT3BB
         oO9N2eSpPl9TzfvGZF9OD755oqsxJ1Men8SkeO8Qh517/eD8U4z4QSp/3nFYChj0NbXg
         NbdFtggnOMzU5ONLnG8fTL6B/4Xsiz/q0dkvZDULQVl+Oj24eHUwDFYh8a7HQnZjXSzr
         z0Kq1JWPx1kjO+rpmkkDqlU9LQa03kpBW4tkSe+m27JN5o6sVzAUk8uZIZFXExlrQehm
         2zR+So5OEYb9/ebUZl/XMzt5HAKlzxhI6cqBPyA0s9yHxFJ/j7RJP4GsRmhq4IQb50VA
         shvg==
X-Forwarded-Encrypted: i=1; AJvYcCXT6cO4wkL2JMfncmu7TCQ2wn4pXup3BT3KOoBI5Yr/NFuAggvu3JFxayBuggja0v1eSKRRIWjZnD7qCEtABigo++Ow6A==@vger.kernel.org, AJvYcCXew2/aX1URM3LdwaeG19qjOyha/WbYmElpfZS0Sh1ddRuT3QxN1PWzKuYfUkzJ3FzWZOKfG5Hwi/AECQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDUwaJY4ByqVn5xZWCsB9Tvlx6XG4fwgR31Axjz+fccud2SYF
	QaVxKx5yoaXRFOxwaoTqU++ddSmBkJ9Y9+124RrAxYrvCJoXR6CNx4L06K7ikOAdVMMdkw6tK/E
	ZXLSA9OFvTO3icR5t0r0+Qek6mSo=
X-Gm-Gg: ASbGncuCOdKgixWowdmUgzZr+dOYWbPPNYW/YRD3nWsAFAkMHddSFsjPNtd1PYXxzR1
	ZVanjXLfXN1y4d4Mw7LwUrHlFxwokLwtZOFEyp115A/SBfrIrGjcQFD3gKFpaDi7lv72lGsixmv
	V7/RSWF1EVP9FPG6AilFNDDQqiPA==
X-Google-Smtp-Source: AGHT+IFnpWKtXIdGGIqHehtn3r7j6WQwTdvguW9pmHyEH44Fow2laSGKRC9KnObhFvGzIAhkxiftZsrddcqU3r+rg34=
X-Received: by 2002:a17:906:6a19:b0:ac3:5c8e:d3f6 with SMTP id
 a640c23a62f3a-ac782ead5ebmr800254366b.55.1743627580205; Wed, 02 Apr 2025
 13:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-8-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-8-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 23:59:04 +0300
X-Gm-Features: AQ5f1JryXAnqMKM_YAGO4_W1hnRtWkSRgWmJoa39srsXcZF-OZUioQ-3kKI5jPo
Message-ID: <CAHp75VfUbTvJ1sQPMJ8mQdYtmcrLiet4O-LQv5A=fAxh6Fyrvw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] platform/x86: int3472: Prepare for registering
 more then 1 GPIO regulator
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Prepare the discrete code for registering more then 1 GPIO regulator.

than

...

>         unsigned int ngpios; /* how many GPIOs have we seen */
>         unsigned int n_sensor_gpios; /* how many have we mapped to sensor=
 */
> +       unsigned int n_regulators; /* how many have we mapped to a regula=
tor */

Looking at the above and the comment I would expect the name to be
n_regulator_gpios...

>         struct gpiod_lookup_table gpios;

--=20
With Best Regards,
Andy Shevchenko

