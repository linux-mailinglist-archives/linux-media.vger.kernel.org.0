Return-Path: <linux-media+bounces-35549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00773AE31FA
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 22:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12C23B0CBE
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 20:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7F91F3BB0;
	Sun, 22 Jun 2025 20:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEOoQyZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F12F2E;
	Sun, 22 Jun 2025 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624583; cv=none; b=WwEAtLqEby1GY7M+JEO2Gxat2zPFoVL3I38sLTOkvDimgH61230qO1dTCR6QmnPlvjvnLNyUmnVjczMFhHPQ0LQAq0EezhbLQKPHDcnDzhxQcOKE6EH6ziKTZ84sz80/giZolQ0HG8RxocRGxyA9b5WLT5fv7F+HashhZWRJnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624583; c=relaxed/simple;
	bh=hz3Jdtz+LsvuzD4rQ7JolouH51M+SUxhZRQ2TBHTSzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmOSQvqbgmCx4RJhqbLKEUyH2LPFmxyng7GPVwRfdMEIGdwFUwTQ4Z30J+fl2mop8hcDJMSsrapQhCR2Mb60S59pH4efSxmN/NVvjTMgF2Dq8bTXWw7sHHew1Xs3H/MTmIQAwNfmYSBITVTzxGEBpFiCxyKpb2Jo2756GTf+dfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEOoQyZS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so5182444a12.0;
        Sun, 22 Jun 2025 13:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624580; x=1751229380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz3Jdtz+LsvuzD4rQ7JolouH51M+SUxhZRQ2TBHTSzs=;
        b=OEOoQyZSG4uYjYVoD+WbYJHkhZj4fafSgoTiQ9hwBN8o773HUitsjGoT0FDGaNViUY
         Iwc0dQWFTa//RyBPWRogR4dKLqLZDg6VCUCCPLnW7q4CuPVlguPxf6nxFov3IokCg2rW
         8sa4zvMA58NvajIVNcbDTAxSQ0HYZWsEjoOW9FcrMNpCkyCGP+KjzZpR9ob3PI61dIxH
         8FTMvrunn17LvCPM5ZPelkVUFesSIBvXfDDHEPn+kY/nPTREaTciWzdmY8lKga3WtQBj
         TvSPDfkkfEh5LO49KYhYDvwTHpHruvXSxZvIebVJZEsHgfK75/fi5PFaMiyBlGge3OrE
         1Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624580; x=1751229380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz3Jdtz+LsvuzD4rQ7JolouH51M+SUxhZRQ2TBHTSzs=;
        b=SiNoBMlhXLyygFNoR0TSmpI4Ebfo01tqtX87cnobLfmfCITEcT1pPQA+IK4RKVW59h
         4og2Nw3H6SKHEwRYQQyBtGsipzy0p8I6BTysqsqHWplGNa3bxleCJNFnGtUOowiNmqVv
         PmnpcL2cHFw7kEW78xKtnyWLAkSv5nkVG3NPd7yUxcCa2QFSfTAGIDhdEmojt5FPeeYR
         rXQF0hmX0nRC5CubkmdUuIuGfucWB2JtsqD52SEceYad5hcFy3TUyFzkkwQD1OKq4ECF
         st9iSiwy68g8gFuywvinVS+na7LzkbIMRw6cObjNg/10ZlzdDWmLm/wpkE7EvmltDKq3
         5OQw==
X-Forwarded-Encrypted: i=1; AJvYcCXCjJMk9ZROhKM9mxF8Wlu6HNDR0zRdW4V3sYHMwRx2Qq9CWzCfRB4B6klZaMCeDopEGQ2O7/qJrYUtMYo=@vger.kernel.org, AJvYcCXdaImSYn+nEazf3Nz6rAIXJf1IGf8MjAtWgEbnpOEMQtHTwCEO43ptzumoRmEeRD4XqWY5UiNUsaT7mmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG8jKUC3CCPuS4TTByejelBNlP32KGlN5D4tkZHw5LYfzlZxu2
	tKu50W8O952QGNknoyZ8PecA3mH+E0CAWU44R3+RHkJT+RHxB7I8pfgzdImuOW1EdzCbjy+ohti
	fV1ObG5pPYkT9jEXguhwCX6oJ0iSf7rI=
X-Gm-Gg: ASbGncssGGrYR0LhMVlHkRXAPu58VQa6Tzq3JNNXVns2ZKl7qZquzYfFmBoKoN61Bfk
	vXhAryctxDaR5Tdd1toGvze8fsUWMPowMSZl1/oSIMaTVXOfUc1ywtXRVkqqTFoh5+U3ePipn5L
	IvwGZqcieGZNI/IzOpPLQflBZ+6gzJf4qwH6d4z+L0pRMw9GUfsHhjng==
X-Google-Smtp-Source: AGHT+IE1qtYTmD5i8tt1tLxHs2WkHZN3ZMS3MWRlSqhlP1av9VhwsiUOIXlfY7gC43dVW4482nERLdrtCfcCVeuroFw=
X-Received: by 2002:a17:907:7f05:b0:ad8:8621:924f with SMTP id
 a640c23a62f3a-ae057c5bfa7mr962698266b.56.1750624579604; Sun, 22 Jun 2025
 13:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:35:43 +0300
X-Gm-Features: AX0GCFurLx4IgrMkKza5bDYc9jpXk2K2q9Q6k47AZNNXK8As68byYvLJwDsXEcQ
Message-ID: <CAHp75Ve_3M3rqmHP5rcbwvhH9x2gUOPzezOCiNzzPp4PmMKtzg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 9:54=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> PAGE_SIZE handling and standardized sysfs output.

...

> v2:

> - Addressing a possible change in behaviour if sysfs_emit fails.

I don't see it being done. Can you elaborate, please?

--=20
With Best Regards,
Andy Shevchenko

