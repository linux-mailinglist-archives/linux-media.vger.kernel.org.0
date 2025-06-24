Return-Path: <linux-media+bounces-35816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9FAE6E5B
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2B25A0489
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E152E975B;
	Tue, 24 Jun 2025 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBKmzo7Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90852E92A7;
	Tue, 24 Jun 2025 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788600; cv=none; b=dGvdaYFS2vGTYIOXYXWfrMny0FVjq2xyeP+/WseHWSLMsp7P62ir8f00KO4xU0NajGdPIt3nHF9LelD0kDOjG8NzYTJNd4wcV6B7RztFD/Bye7Kddl/NxE5sGm9ZJv8B9LkQs4ngpMNJVL1g2N0FWKnvkGKBWiRFdkAg0wn126Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788600; c=relaxed/simple;
	bh=FCIIYY5qiec2hBe50pDiWONT5FDHydwnIw9Ol4ckVRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/Z9ebjwxtHsOzVMEJbkmJtnk9cJbujqzQ28VvJAJJLz8ix5b7CXiVm1HUsHfmRrt9CJukoppgw2V93m+5MMtkDJ09pDo79jYUmqNe4F5Y5Xc2Voa93Iwb5EtC49wwUBGTQ5guVWA34AfQl3bTzw8yJrfaakSzuCfE3IWrgaH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBKmzo7Y; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad572ba1347so930813266b.1;
        Tue, 24 Jun 2025 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750788597; x=1751393397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCIIYY5qiec2hBe50pDiWONT5FDHydwnIw9Ol4ckVRc=;
        b=SBKmzo7Y/m7qzaAy+tNiegRPa3tG/fa6szPbUZ2aiQFe9BCM10tSPT+vMfgG/x2yij
         GsXQ4QGKEdPdeR+3J+r/XPctlnMFlxrzjQOyxE0oeW5TBYEBDbQc45jzKbf/uOAYxX29
         x6C5vuTLgMHqFkcDjhtostE+XeTNJLqTXLG6qKXpEKMTjVHWIR+Jv21gN8Pt+W8lYZmy
         Mk3qqNMifbzbI9ouCA0DBPbEshBPJ6vCIfjhXeG5utTHFGZqVwhDDk4VLJ8W9ml7V3mi
         d2+/rSdBIyCLJOXHEMBgAwjuMkc/2UZ555fPFKpoJfdOiOOLVor8LoRqx3uqkDWV8aTk
         b7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788597; x=1751393397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCIIYY5qiec2hBe50pDiWONT5FDHydwnIw9Ol4ckVRc=;
        b=DL+E3sxzhzsJtLEBKV7q3lnVx6Av4H+FNk+UzeyyQ34gpD6X7khfPDM+NdIgbrst7q
         AVe9XHgA1VU9UOxAOUEmrCUFnxCOYTWzc4Ixnz/hvzyJ8TY8cPABHiPu/C6eQgLl2/lN
         iWYKcgch1STs3HCz2NJVGz0orKLZ/cnPz1MRqDDIk6Pa19Rsv8aCZ5+bzWJqwMO4Vb7F
         J5YHmq6/Y2XXwcxnFoAG9m7uUC+je5qmmEeVvSdr+eYiE6r0MgI03C5+n556Vds2iKBa
         OIUFkoq6NxSJuOjkzAmoH/BcjRPsdbbuK47RjqelrKCSDrtjQt2cl2UXNM2g7otOc4PW
         imAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUrBCMq3XOilOKLPgJDF//kazQS1SrP7xJLaKC1HZH0AzJx8TrtWyvsKLXwI8LZw1sSiebe8ydRJfuuuA=@vger.kernel.org, AJvYcCXjOAuEGdorqT75ODmn7+hWAAj/d9jrFksuwm1rZ8Rxzone29f9NB545CIscFj67qCA+s+AEZheHqOL/24=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZ+j9qzP3PrFwfFk9rHKisoCFDF3vHy2LUWMkqoxTucp7SGcW
	pfFzbY5AgaDsxmjJP42ZFGY2S/t1GFvHdr9Icxi1alxdoA97mruPuhAnbzNqGQft0dKEpws/HQj
	OskNUU34wvar2ASUUQaAFLGTK8g/1R/Q=
X-Gm-Gg: ASbGncvvVYs5fwwxTfuwiyeYwU/fCMHfOe7qjDV/ZVi3qxHUOnxQzAo0EwuZHNuJZe5
	+63rXOfqgvG/uFqhJh6pUNI4LC5MhT27X2XcYzlrrSn/jpaTw+/gZ+rmItzLS/wTAIqIWPVeQqH
	3nE3kK9VdIMOFhAyg23TXA33ny1JODE1c3jWoFFBk+r8o=
X-Google-Smtp-Source: AGHT+IFjXqH44JSIY4FR9M2YtgUubwZ5Ww1de+8Ma1i2aCedPQ6TNDK+zEWWzi3PePdzsy8XyB2BHESWItZygc14TPs=
X-Received: by 2002:a17:907:c810:b0:ad8:ae51:d16 with SMTP id
 a640c23a62f3a-ae0befc0232mr21137966b.55.1750788596736; Tue, 24 Jun 2025
 11:09:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 24 Jun 2025 21:09:20 +0300
X-Gm-Features: Ac12FXxMOJwp6ramOYp60uAHkuhid_dAfeHVQHPNfJmZDrOA2sU6IjPkvPJHtoY
Message-ID: <CAHp75VfL2uMpOP2xfa6zf=MAFrt0Phz87xo5w3bC21t0-TTQKg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You really need to slow down with the new versions.

On Tue, Jun 24, 2025 at 8:07=E2=80=AFPM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The sysfs attributes active_bo and free_bo expose internal buffer state u=
sed
> only for debugging purposes. These are not part of any standard kernel AB=
I,
> and needs to be removed before this driver can be moved out of drivers/st=
aging.

needs --> need
can --> may

> - Remove active_bo and free_bo attributes
> - Remove group registeration calls form hmm_init() and hmm_cleanup()

registration

> Suggested-by : Hans de Goede <hansg@kernel.org>

This is not a tag. Check Submitting Patches documentation and find the
issue and fix it accordingly.

--=20
With Best Regards,
Andy Shevchenko

