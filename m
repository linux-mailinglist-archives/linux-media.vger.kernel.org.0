Return-Path: <linux-media+bounces-23168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C65819EC76D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14BF628102D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 08:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C7F1DC998;
	Wed, 11 Dec 2024 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EMCXlI0D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC101D4610
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733906245; cv=none; b=ND67WIzBxUK13RPWyPg8eNo8EIp6ZutVfstOs7f6YGi106T7XcM7jYKzCc0/fpUUfmKFyNIwN7Ajsw6LT5wPAJK2cb6yQXHo7amEikH+K+hUSJFrePssCzCRDEdyQjaTb8BQKXebLlNa1EvDdOM0qwt+AdbglH5B4d0aqj8xLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733906245; c=relaxed/simple;
	bh=XBgmqrGOR+TiaTyhJ7G4EyEffKB3hn5wBPa+e60msYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C++dZ+z+P6EF3OHPe+Y9PTo/X+k1BsCx/zbgHIHoHdmF4oushUPbwieRqTOTQox6jDEERHbhbQbrsf4RpMaGewC+tvvXsgTFTaWepwaSqIPGUJyjOe976Pe3gdAahY9i/02g4PTGieRPcyP75V6Z+UHOyVlvNMC1KYwCdU4QVpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EMCXlI0D; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-215770613dbso43280585ad.2
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733906243; x=1734511043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qbJ9A+m8ws44k2uM8AYTsZl/eWYOAV0rPVSUcQb9sbo=;
        b=EMCXlI0Dfk7GKPfUHBGeGqwxlvdwwWYEzMwgPX7QVVjLXNrTY+2o1KnbuK906eqGpu
         sufqvTjwo4SGoF4yjGTweedvCPGMvTxgS4U2SPMRsVWD5ABzIh5OMLU8XtUxDIGKWR5f
         VKdd8ez28EA81Sxud9ffjjfvi0gl1u0NALMWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733906243; x=1734511043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbJ9A+m8ws44k2uM8AYTsZl/eWYOAV0rPVSUcQb9sbo=;
        b=aseVKjbiw4eq7xID/pHBVX3MrLUqefzbkTxObWN3t9LSZA7NwdWYnr4njTx8xXQrxI
         7K2C0nrs8ZIygI6HCCX2lRokcKt3vSJQ9OHIj0Bj8o81CQpVHmYWNtnecBCW7JCy2wVx
         KFG6+41qfiOe4tnL/ClXK2mP9Jq56vU9xoSrB+YvQKOWslQTECIVMXILx3/W72psWGBs
         cywRopoWDwegUMkviNaaffd04Q0zYIwCOgYfAH0i7OTi+H8Lb4vg0RJdpT0UHsd2qSuF
         aa8luAB8f3/K6zQjFLomdqIsTTaohJnItM/DyCxiIJa+YoGOxoKIFpz+5nPN4nm/y3EL
         mILw==
X-Forwarded-Encrypted: i=1; AJvYcCW3mAG3sLkekv5Q4H4SQ5mVVDCbxvghRKPbqwppRRJmGhvwGvksA5RZSDr7HddQ16firBer6ONWokMGbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9GNPAk2Izbqh1g/0iOQTOYvpgH52IjUqNlFUfjWrLdRkQymD
	rXRP7QaDxG8PCvOnL619YSh+3OOzhqRAL33q93uX3Dn5H5VJbiEGy/mqG6xfIO3vXrU5LqPryes
	=
X-Gm-Gg: ASbGncuB5afBzlDvHznSVXdrtUoqofkBaW//ArwipaRkY1prQRR51wNIOgH0jYHzJQI
	Gu0WLi55AyHQ3mi030UZxO+mmYh8knXxUkGDV8iEyZRk6QU0UPyCttfI4wqeJDHtEzdJ7JOlGg+
	su0J8xG493+V+Y/VGpsrM23ONJNhKrof4P73wtdYGdrdb2UULbvf2ggQRxNgah2LmGM2+C1PhVM
	s6kc50v7dV6Ot6ze7hIBz7wzIk6VluBpnvN0YLi5pMYGBKe02ozblqHxcbKOTgOZjZyHoX8Avjf
	lZctIm9QvqYkcenh
X-Google-Smtp-Source: AGHT+IGx9ssKBj3izpM/+Zy7mh8CX/rSRUSA09pNj2pqyzX1n5E885nu//+Vnlhd3/EDopmGxVJQWw==
X-Received: by 2002:a17:902:e848:b0:215:8809:b3b7 with SMTP id d9443c01a7336-21778397509mr28318455ad.7.1733906243525;
        Wed, 11 Dec 2024 00:37:23 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161b77ea74sm82955525ad.229.2024.12.11.00.37.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:37:21 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso4744695a91.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 00:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2jZ/BSSmPExAIMKpdjrNO8qliECM33zz+Bj5uR9nNghczvhcGoPsonB3w4PN7JbajFPzYeDjhKT3Svw==@vger.kernel.org
X-Received: by 2002:a17:90b:4c84:b0:2ea:aa56:499 with SMTP id
 98e67ed59e1d1-2f127f555a9mr3269053a91.1.1733906240145; Wed, 11 Dec 2024
 00:37:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-7-00e409c84a6c@chromium.org> <20241211091954.42a5c778@foz.lan>
 <Z1lOCGJvgFcqmR3R@kekkonen.localdomain>
In-Reply-To: <Z1lOCGJvgFcqmR3R@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Dec 2024 09:37:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCvPNf2KiEpr6Tboon6bjUxwEkD=+_AQjhiOA7RDTTpnCw@mail.gmail.com>
X-Gm-Features: AZHOrDlaYtacxTR4SrQpC121lb8rk1oSdpiMfzTs7ikEYNouO9W71c6h8nTE3PY
Message-ID: <CANiDSCvPNf2KiEpr6Tboon6bjUxwEkD=+_AQjhiOA7RDTTpnCw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] media: ipu-bridge: Remove unneeded conditional compilations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Dec 2024 at 09:32, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Mauro,
>
> On Wed, Dec 11, 2024 at 09:19:54AM +0100, Mauro Carvalho Chehab wrote:
> > > @@ -768,15 +755,10 @@ static int ipu_bridge_ivsc_is_ready(void)
> > >     unsigned int i;
> > >
> > >     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > > -#if IS_ENABLED(CONFIG_ACPI)
> > >             const struct ipu_sensor_config *cfg =
> > >                     &ipu_supported_sensors[i];
> > >
> > >             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > > -#else
> > > -           while (false) {
> > > -                   sensor_adev = NULL;
> > > -#endif
> > >                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > >                             continue;
> > >
> > >
> >
> > Considering that you drop patch 1, and keep the ACPI dependencies
> > at the header, as proposed by patches 2-6:
> >
> > Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kerenel.org>
>
> The 1st patch fixes a compilation warning when CONFIG_ACPI is disabled.
> Merging that patch as a temporary solution is simply easier than making
> arragements for merging the ACPI patches to the Media tree so the last
> patch may be merged, too.
>
> Besides, the fix should also be backported.
>
> Ricardo: how about adding Cc: stable for that one?

Adding:
    Cc: stable@kernel.org
    Fixes: 8810e055b575 ("media: intel/ipu6: Fix build with !ACPI")
to v4

Regards!

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

