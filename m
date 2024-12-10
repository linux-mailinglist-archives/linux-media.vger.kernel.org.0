Return-Path: <linux-media+bounces-23090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75319EBA62
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4B3283C80
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AD5226893;
	Tue, 10 Dec 2024 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EG21YSAt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08322619A
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860571; cv=none; b=NeJrWrD+96jlNjBzGuWrM5KV3szaNKyxZLpq5iO59qA2a8/C879fkIBW830C+lTxex6IpdBeZoMQe3oaXwYoEfa1Y0iWsqei8y18o0YbunTIteg4et9TgC5Cv2r3mW3J6uN61A2gz5wZw4URzY/t0ma6f96sycKLiZU+Pb4noH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860571; c=relaxed/simple;
	bh=e6N+GiKT6QGfW61aH0GmQOtN0oMTDgLGk2yx2uhx9Pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pa5b7LnDFl45PASwTVzKVAIDdvKDrqzFZHsfz1kNVjZxHdBOEsyzVDcw5PoUNJBULE7EY9ETmB0+piJHBJ8Ys1zi4ACqJVYO/TW9VO5xto82YxA3BcnQU8+lTAUPL8+vXaIOVdKUNzjVlPv4gJ7QqViajdzO6u2O2qJSFZhjIFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EG21YSAt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21644e6140cso26430145ad.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860569; x=1734465369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhVnUUt21FbgPDOVIQ39erkKtCV93uZ7UVN8hJAABAg=;
        b=EG21YSAt3XH3jRunxQRZkV+RmSKTIQ2YMRAj8UoO7TvkgSFs+omu2U5x/awxNE0v5y
         xxgSaO1Z8BO0OG51bkqPhJRL1EwefcSfh9zFFd5PTjmCjSHEyaEgBYNZJzcHDFCMO1Nq
         DGHu56pLpEmckiC/ZNy+7tzZHRgPtX/48ngIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860569; x=1734465369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhVnUUt21FbgPDOVIQ39erkKtCV93uZ7UVN8hJAABAg=;
        b=iQiT9KHMZghAQusxUbnjUrpYiYx+a+5VrfM5wW4xoRJbGSolM6gX0+BzNJhPAALQaG
         FDmab3PDmJWaFI/wkFsuSKwTGRW3EDaH9iKfNGMkjpEFwRGmq7DEgmi8PYlX06zZdac6
         OZljeOjibvjDjpcmjnUpJ1m0tnpKlN7SgKUt0R7Ds3LpHzqw7kiizdUD9DZ1j0GeVeIT
         cjYa/DrWVPzXKpLMs+L2akALMFT7YA8ZNm/fK8qAhqiIcP79Uz/Mqe4SGNvjmtowcky0
         BrKxB/mVgzX0bn9UlQC0K01EWpoIlcoJX9I5Ni09byddqcTy4Q0tHXYchOUw3ZpMP0zE
         NwOA==
X-Forwarded-Encrypted: i=1; AJvYcCUdoe1iASd5HMD++Ou15A7yPXca4DMRQWj4yrMnOC6E0uWH9RjMwGHOk3h5cjtodtQTIfgCCmSg+7BbvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrhCAJ55zcxcHzyUPEIvrWQXMBuFz0CQXYPPn/yVTUUny5kDv
	JD699hAM4cgnyCUlhYIiEHwNDQpTJnXzyjoiiznvWzy3fcjeGMnjShh8vDDhZzT3Al7fpEUQlgk
	=
X-Gm-Gg: ASbGncs0XuH6N8uDEdNDyb2pQn/oSsa4uEBKCBIoMBFxBOJcmvKd2TlHxWfwv5U+y2e
	RfPNLFMegc/G1l8f7EqMhDpRcI8irXC/1DQ//sxM7YLDY7YIeSy70RAFQxmAjlc7hfz8/oxVvE/
	FxS2qE1/VYkfNn8wY1NSCVp1triC1LEHHcd+9L/kgBYIxZ6+cZfvqQOE0RAlLChyZ8JX/w+Hlwb
	iyz8PmNOm0wcVYF0RwkygiXeO5BgrnV5vZDtToARy+vocXF56YH8lWUAbC+C3SBxEQX1OCcd1Go
	K4Q5Qn2MIADNeGZd
X-Google-Smtp-Source: AGHT+IGDWt64tUy0vSlYuqhOJiajILXADQ8mv9qQ+l6iKgOIHGi80OyaWvfB4U5f0D3/uOhLWh1oQA==
X-Received: by 2002:a17:903:2312:b0:216:3d72:1712 with SMTP id d9443c01a7336-21778998d96mr6841155ad.48.1733860569459;
        Tue, 10 Dec 2024 11:56:09 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd47f7b9b5sm4574989a12.12.2024.12.10.11.56.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 11:56:07 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2efb17478adso2079183a91.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJ0N/k3hZ2XsbKj8olTzGkX8sddkkaM0P7Hi6HCMFz/KszbE2sPDUzqcs4k/+49gixjDUSjBBEUnZz5g==@vger.kernel.org
X-Received: by 2002:a17:90b:4c84:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2f127f50d18mr438841a91.7.1733860566933; Tue, 10 Dec 2024
 11:56:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
 <20241122-fix-ipu-v2-3-bba65856e9ff@chromium.org> <CAJZ5v0i9SresLT14aWuyodKyi2y3yyC8wLMYzrSD4ec=9WVSvg@mail.gmail.com>
In-Reply-To: <CAJZ5v0i9SresLT14aWuyodKyi2y3yyC8wLMYzrSD4ec=9WVSvg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 20:55:55 +0100
X-Gmail-Original-Message-ID: <CANiDSCsYcQBzUzjACQdhASarR9Ad4bnD035+DZzJnrQboXVDAA@mail.gmail.com>
X-Gm-Features: AZHOrDkADV0-JEZsLMswWL8-2MF9FWIqIKoMqh9rPKxVkdv7pvHri8tCHfHVYAw
Message-ID: <CANiDSCsYcQBzUzjACQdhASarR9Ad4bnD035+DZzJnrQboXVDAA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ACPI: bus: implement acpi_get_physical_device_location
 when !ACPI
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Dec 2024 at 19:31, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Fri, Nov 22, 2024 at 10:48=E2=80=AFAM Ricardo Ribalda <ribalda@chromiu=
m.org> wrote:
> >
> > Provide an implementation of acpi_get_physical_device_location that can
> > be used when CONFIG_ACPI is not set.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  include/acpi/acpi_bus.h | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> > index eaafca41cf02..4888231422ea 100644
> > --- a/include/acpi/acpi_bus.h
> > +++ b/include/acpi/acpi_bus.h
> > @@ -43,9 +43,6 @@ acpi_status
> >  acpi_evaluate_ost(acpi_handle handle, u32 source_event, u32 status_cod=
e,
> >                   struct acpi_buffer *status_buf);
> >
> > -acpi_status
> > -acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_=
info **pld);
> > -
> >  bool acpi_has_method(acpi_handle handle, char *name);
> >  acpi_status acpi_execute_simple_method(acpi_handle handle, char *metho=
d,
> >                                        u64 arg);
> > @@ -60,6 +57,9 @@ bool acpi_check_dsm(acpi_handle handle, const guid_t =
*guid, u64 rev, u64 funcs);
> >  union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t =
*guid,
> >                         u64 rev, u64 func, union acpi_object *argv4);
> >  #ifdef CONFIG_ACPI
> > +acpi_status
> > +acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_=
info **pld);
> > +
> >  static inline union acpi_object *
> >  acpi_evaluate_dsm_typed(acpi_handle handle, const guid_t *guid, u64 re=
v,
> >                         u64 func, union acpi_object *argv4,
> > @@ -1003,6 +1003,8 @@ static inline int unregister_acpi_bus_type(void *=
bus) { return 0; }
> >
> >  static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
> >
> > +#define acpi_get_physical_device_location(handle, pld) (AE_ERROR)
>
> This is a function, so static inline please.
>
> Analogously in patches [4,6/7].
>
> And you can merge patches [2-6/7] together into one patch, as far as
> I'm concerned.

I was trying to avoid some extra ACPI_PTR and a forward declaration...
But overall I think it looks nicers with static inlines.

I have kept the patches separately. Feel free to squash them if your
prefer that way


Thanks!
>
> > +
> >  #define for_each_acpi_dev_match(adev, hid, uid, hrv)                  =
 \
> >         for (adev =3D NULL; false && (hid) && (uid) && (hrv);)
> >
> >
> > --



--=20
Ricardo Ribalda

