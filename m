Return-Path: <linux-media+bounces-29267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA2A796E1
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1332B16F50E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1371F2B8D;
	Wed,  2 Apr 2025 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbhPKL0Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA1193436;
	Wed,  2 Apr 2025 20:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627158; cv=none; b=JpopIswiOeCqGwlw/A9HwZDTSQE7vLQwE24YnLeg9zzMs9kW8m347oFz4i8ap3tUkfucj/818Cix0QeL7ebXyxFjucFmymPtXUtXW3q+iJ5CEN1Ml9SmE67JQk6MErOAVDg8pZepTW1BZg6N4TVG5/ERb8ohlVaSOooHYOhTWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627158; c=relaxed/simple;
	bh=yl9WiBXsTmHeJHlT51Qij+kodNLkLwY6SQwMT39MuYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1CwnJ7jcAeTcrqdsSoZw64x4lvIIn64olzrKcPDYOnpkxUgk56uc7nmuiqwjsFVKK+sZwRpDoGDZUj9z7DFt5Cz1g7Cl0Izk2HQcy0HjShOjerzhaaTFUmQviTN8A3NvP2CPwki/4mhC209ibB/efLS5XjlexciELekzWhZIBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbhPKL0Z; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac34257295dso35568366b.2;
        Wed, 02 Apr 2025 13:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627155; x=1744231955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl9WiBXsTmHeJHlT51Qij+kodNLkLwY6SQwMT39MuYQ=;
        b=LbhPKL0Z8eH1y/PnuPPUZ9/SVvekBgafcn3HM9NN2bQ32C5PN2Te/UI5iESrruDFnQ
         hCBkqtUBmPaWn7O23RmAOx22yWwGYy/sE//cCR/PxosqjxcBGp+gQ7dZqAqGVAi5DAl5
         KeQ+t2VD9ACdMt4CLcSWkRNOWZr6NIkv6yoPr6CqZuj3rwuD3pgyRwC88eUVVR0RczaX
         2atQIWR+euNjMdaPXhO/thp+1mIhRU1Iu3zQm7vWoRMN5KLqpGrXJNYnoYnV7444pnzs
         QpL+KS8RFP/oISfornIF4mUkqirPxbw34Cv4DkgjZtlrZbsg5WOrD1e4oADjx0P2HzEm
         Jg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627155; x=1744231955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl9WiBXsTmHeJHlT51Qij+kodNLkLwY6SQwMT39MuYQ=;
        b=k2Yc2lEgAMNHmZwTB5sTe+tgsS3miw5qpkcKYIGVCqEV5AEGW2/w+iFibR2isDdhOs
         2GjrNvL4JpaPJS89bwdXAsNZd9Zr1dbzWQTrMKoQkGPvijf9TMkaP6MYSWnZgvldFm+V
         Pxx8/rH3tLhzwlsKF3kW8EXWhx2peUGE8Sy/5MU7Fjfzbfe0sRbmO5SHbx+KKqL5oHux
         9q36HNiAtfrYbAZCkK2s7CjP09RTT5iFCsVAvIzztc2sA9zswpWVcei6Z6V+We8xVZXa
         8KcctWoVF9AUivr+wlvDXnq8EjsfUKcFuNtFdOihMZ+sbQD13KLQigUn/RWhQAJ9NORm
         UIhw==
X-Forwarded-Encrypted: i=1; AJvYcCUBCbP2QTTJQENoDm+35TK5lDWnWtAnA1MiTR+IxN/LwGDYY0mKQ3Wzik7dAfLJelKG4xJGqqcyf9L38Q==@vger.kernel.org, AJvYcCX2KIhJf8wGJwaTEFsZ2BUqj8+kRO/+OIZBF0YCK7WmKTmd4aOrKu2C8l+Whs4R9ptsKZlq4mHrmVpYhtHkDxoetApJwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzK23qXpGag1nYlFIlvmWeHvT3Fnzmh8Y0Rz7cionNJpqNPHWT
	JhxgREpzFRNlvrSn6qIjUoSY8lasYR85L2a3s70UNwIRX9U9ZD8/GFClw7EY6QblO2K3Tg1gE0Z
	pSPXhUgSdPwrD1Fa86EUS01ek6bc=
X-Gm-Gg: ASbGncuh9dxMh6VDRW+KDup0wfxoor2k4pW3Z+R4I/70g3zzbnyFTdmzIqHtW9GlRxz
	VQONSIVaJYQ4qpwCPCu/6d5yzQ8t2AmMZUV1p1AvVRAy5gIQ2+0UvPy7vQMraK4VrL/hjcIFxjS
	NkTssGDklnhHFI3aJkv8Yju5nBDw==
X-Google-Smtp-Source: AGHT+IF3Qr/rsvuyrTjCDA6HdWSdyjlmtFYcdH46Jp3O3S7wWw8kNoAvfduzEcIJDI+BIVssmnUkPHlFvESksgZoyaY=
X-Received: by 2002:a17:907:2d28:b0:ac7:322d:779c with SMTP id
 a640c23a62f3a-ac738bf6699mr1692588966b.50.1743627154723; Wed, 02 Apr 2025
 13:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-10-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-10-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 23:51:58 +0300
X-Gm-Features: AQ5f1JpSnvErQZLYVU3ivn8oqxDS2D2RsKm48UlGOv_ittrLp3RtOY8CkDpZqY0
Message-ID: <CAHp75VdsOUxMCTcWoZ4euF4-neNcu+-1OQDnhjVFBj74naryig@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] platform/x86: int3472: Debug log when remapping pins
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:26=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Debug log when remapping a pin/function because of a int3472_gpio_map[]
> match.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

