Return-Path: <linux-media+bounces-5362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C178591EB
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 19:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A740D1C2287B
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 18:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95EB7E11E;
	Sat, 17 Feb 2024 18:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eknArbpb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF6041A91
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708196061; cv=none; b=rKnHZs9EBM/YA9kwsuFNQE5uxIKODkVCZ3KdMtCbn46pP0bskJfVqRf6k4F7L9ogD6H8TZqrjzAlSql+gxYSTFi0zLiTn7dmivn0R3ovKTHtwPizXh2expVJ8+Y9fDLLCNePK2zHYI8OmRGwaibFpK8mWxDgGqHXepovX7Lh6dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708196061; c=relaxed/simple;
	bh=lpaGIxGljZ9znL0araD7NAX2BM7V27dZcwCtMBjP1cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3/nDuwcxKbYTX+Nw87KHYN0wl6Fnr9XXAPk1kjXmQXltMWis0p8SFBY01hfZDODcf0yfaImaLNPJFHRSvNInqX09++E1CiUi2fMhtdxbvp4u+/6O6dkZR987bZP3C9X1utdfqq/IUICpCSP4a4oNqDW5y9zR4aGQJbdOJnUmWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eknArbpb; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so4194996a12.1
        for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 10:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708196058; x=1708800858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpaGIxGljZ9znL0araD7NAX2BM7V27dZcwCtMBjP1cA=;
        b=eknArbpbQ2Yo9evC1HoaxvzTaP60EebRqsWFwKXoA/RZxF+2InDC7YFeiDnTmZ6pX3
         yd2qUTA84HuvgCN01pLeomRw2FHmEZrAXl2OBIoPuaxKavOwt/u77hq10Dpap9jlj9+v
         t55LjYas5e+JpioAvbmUWH9X7I+0YN4j3/fi2n+kCTiCAFRkw3wrD5aHLa9Jdn3T+ydj
         20TE4efQyaLYksJiCFILDZ95RuIeW9gcM82wGPJjbnH13FuTLS9dxRkq47eOqcLoO1K5
         ucDTrobjpbx9eUUbzNOoz8v6ufEThej3U/RnGYIjwLmZcmVe9XsjUCB+TXVNIJiHWDun
         79Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708196058; x=1708800858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpaGIxGljZ9znL0araD7NAX2BM7V27dZcwCtMBjP1cA=;
        b=pU41sFSw96Kgva/W5kPzV6A1R2dhUAv+LFkiukDFfjOiVQJCe0GHizE/osv3uvC44+
         nemz3ttQv2R4CYCwb96VmX4W3hv2443OpvTaTFsjIXPzFdDOTnLVbW2NN8GpKtTSlLnw
         SLsyhANekgxt62u0JLsgAjw7l5eo52eF/8e5V8mKaSR2Ep6w/OMifXFiqgwgW3uwXdIf
         NXahLelpKdpcI6HfjqTqop3mpJpAMH7ojTBpink6aTzWoUVWIJpA/PFxFXEYOjpi6pag
         dbnLg65Phm4wMIQvbjsmTvYRhYDllvISSL4nuQi69mxkm0C7YS6m2qAhiEOYCOqzYnhD
         k04g==
X-Forwarded-Encrypted: i=1; AJvYcCVN5BZrqqZditCv0nZoFMn3sVyoi4+eOLM0wQDQhQG05qtqS/GFh6ch92TBx+HjIbgnyVY67J2CZxfTU7qBvY19JoInimTGbBnagaw=
X-Gm-Message-State: AOJu0YyY1KbCqbbrRoyJfDGucgCETYhXp5u6xwm68sPrndYb1lKI5a0Y
	Hi/blTx9J7D7ibsJhv6ipe+0ttuK7uwdSIz3yovNvwTtBYKnls6KR0gtooj6ULEOlqp0fLFCVHJ
	qsS9DrrCQ29SnEpw0PphBZuQYm2KMO+Mgljo=
X-Google-Smtp-Source: AGHT+IGsjeyZrIoWAn9g6o/y9G+R76PNVZSpqeNW3+DnVvNuYsVJMGra8Du7czjq+3/s/4+PPzdOVzCEAGZcYOiIL0k=
X-Received: by 2002:a17:906:75a:b0:a3d:205d:1d97 with SMTP id
 z26-20020a170906075a00b00a3d205d1d97mr5535088ejb.58.1708196057654; Sat, 17
 Feb 2024 10:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217112438.15240-1-hdegoede@redhat.com>
In-Reply-To: <20240217112438.15240-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Feb 2024 20:53:41 +0200
Message-ID: <CAHp75Vf0Jm4CXig9GOu=WvqyRFj5W4U6gQsNHy48dFJrD3zb2w@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: atomisp: Changes for libcamera support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:24=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi All,
>
> Here is a series of cleanups (prep work) + some small(ish)
> changes to make the atomisp driver work with libcamera.
>
> This has been tested with libcamera's simple pipelinehandler
> together with an ov2680 sensor.

With some minor comments,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> p.s.
>
> Andy, I known I still need to do some small cleanups from my last
> pull-requests. I have this on my TODO list :)

Hope you will find time to address. Thanks for maintaining this driver!

--=20
With Best Regards,
Andy Shevchenko

