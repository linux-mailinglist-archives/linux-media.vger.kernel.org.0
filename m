Return-Path: <linux-media+bounces-37105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752CAFCA25
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40429423957
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0154028850B;
	Tue,  8 Jul 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LtwyMz/k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329D2904
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751976937; cv=none; b=Wg0TFnrBK8a97NylBI6hWzqUYHmeQ5clOMaHlP0Am8iJsFIhWUdxMU0uPWaFgm9jn4YJMPDKRXFIwsqvuSPLaM+SB3D9VRa4T3+Xt60ztIuPYgFiQ+EL2SOIzua+l1VLAupHxXA/4Y5baegp+LgfZ2xkZ7uRol74iCizlj3Jjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751976937; c=relaxed/simple;
	bh=dyXUujHTnYYHwk8qxqITJQ9BmoorGjnNWrcKqYxBG+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBnS98kIADUlvY+iZgmxZ8DWYceQJzq4phSegs3+GFrtHvtprlFHI7n2ZtJWjgGbLsHNDszEccVtgapTTEOcW4d4JQqWCJAKe0Sy+hO4D4UTNDMvnFKUoaueQ0nXdNgfqY/JwPUh1FqEusdDq7Eq1YeAqS9iuGEbQkPmEmPJ2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LtwyMz/k; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b16a0e38so4665656e87.1
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751976934; x=1752581734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMrJyzq+XGe4XZwQoy4OMfTD6mqi6tUL9Fg2sLgmdig=;
        b=LtwyMz/kjMxDFP3zTpMkL4pqaeUn2f5UR8qecsMfsQgQWrptQm4fTqN0GAe9+y8rfm
         YMoFiDSw6xhlX6zIe7vS2OEo6yIeds9fjfvD/8rKgNfZNntf9QWeofe6c/usnfEoSh2c
         VbBq9IE5XeLVeob2clndfJ9LeGRnZ+KyF7H2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751976934; x=1752581734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMrJyzq+XGe4XZwQoy4OMfTD6mqi6tUL9Fg2sLgmdig=;
        b=lopA1krjm6U4yDf3vQO7GIG2D07fSwjYy9DGMbuUKFLtJE5WZ1J+0W3isCE4L8/jyL
         eI9oZsvkdo2AC7iqEcBP8OhrU1ACMlTRj6wx0RKiKLwttJZ5zUXRwBFYmSdHwKj8ZVs5
         N6mBzgAMC79io6wX90/Ymy790gCXOrGWRP0itlbBgvFtrUSL01tjNtXvnxOMSVTpDqwa
         XMyjSmXKFzu45dUGW8cEc9ITDhPlOlEx4yO3kXX+mUXTExe6pELNaVEr1PxAIrF6N67S
         XzOvfWXJfKDBF1jEQmVUhLoVjIP5eyvwi4/Y1zH+QjTjzZY8bNrwoFBCBuWUuqHNAZIV
         FKgw==
X-Forwarded-Encrypted: i=1; AJvYcCUZxXOCkuMEZ8RUboxOlPmV9xFVJEQNItEzAKol+6XODbw5XtvDwz2CexyfdER9yj0Rq4eWBbW5ezFNKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PyPDxRtOZofK1NToPbW+hbbazTL14tBdlt4B8OvuYpJvhVfX
	Lq/EJ+qFr/cG4kfKijovK2q2+hv5Z0FmpVHG/zfL7q7rdoXl26V5HIFygxcue0bo6bT5kdYY/NX
	O9Dy4JutU
X-Gm-Gg: ASbGnctPJR01cFVjmy6Z2qYwwPMKy7ZpmK6PP5VjlkkB2ou7Zlz5nfDOlsc7Slhg5IU
	vQ142fQzJ1dhyFtLGwMpUdQd5gnyy2eVSkqSISAivuF7Nmx02Ik43u+6RvYxUZ9BQ5hvJEkT61Q
	9W/8GvJsoIR53OO6UvC/xSCuX3bwUGn1QuLk2hx776YQkhAnUu2FjyplksqN9vW6CWleDQ2ZXd0
	8B+i69KCBDgw9L0Rfg2af0zYiAU5k1TuhaTdGWd+MTYOJPr0eNDsB4h8etDtuHkHZSnYDfRV0QY
	T6KNzUxLWD7NGKqrY03hR43nYmsHvwwAdx0cZaDd4lGac9KndayjRMplTZpvmYbMn4KF2vV5Gvy
	w6uJEWTMSzIhzMqyMZ3OTpIdW
X-Google-Smtp-Source: AGHT+IG0iJD2OTFFcBc2u/UySvKGhtBFQCsrkEds+m/hq0JIBsD8AnMjUgrEk8Kjh8iE+o7xgVoYJQ==
X-Received: by 2002:a05:6512:318d:b0:553:aaf1:f63d with SMTP id 2adb3069b0e04-557f835bb15mr635409e87.29.1751976933490;
        Tue, 08 Jul 2025 05:15:33 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638495373sm1651285e87.136.2025.07.08.05.15.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 05:15:33 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b16a0e38so4665630e87.1
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 05:15:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7zCvgWCHa03ST0zbMmSXgPRRPlhKmYlThZF53N3dFIqMh6nW6HQluDl53NjZJy+/BWC4O5BLQS9+Okw==@vger.kernel.org
X-Received: by 2002:a2e:8e3c:0:b0:32f:1c0f:fb74 with SMTP id
 38308e7fff4ca-32f39b2409amr8468421fa.22.1751976580861; Tue, 08 Jul 2025
 05:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org> <aGw_1T_Edm8--gXW@kekkonen.localdomain>
 <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com> <aGzjTRSco39mKJcf@kekkonen.localdomain>
In-Reply-To: <aGzjTRSco39mKJcf@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 14:09:28 +0200
X-Gmail-Original-Message-ID: <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
X-Gm-Features: Ac12FXyPY8jp6OO5y2rUkBGCgm071L0BZh3437cx12a8IP9Dnshn9sW-VSnuQ7c
Message-ID: <CANiDSCsqEHTnbvzLMoe_yxi8JRzp+2PQe3ksXhD=Y3+AqC_9hw@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown rotations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Jul 2025 at 11:22, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Tue, Jul 08, 2025 at 11:16:25AM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > Thanks for your review
> >
> > On Mon, 7 Jul 2025 at 23:45, Sakari Ailus <sakari.ailus@linux.intel.com=
> wrote:
> > >
> > > Hi Ricardo,
> > >
> > > On Thu, Jun 05, 2025 at 05:52:58PM +0000, Ricardo Ribalda wrote:
> > > > The v4l2_fwnode_device_properties contains information about the
> > > > rotation. Use it if the ssdb data is inconclusive.
> > >
> > > As SSDB and _PLD provide the same information, are they always aligne=
d? Do
> > > you have any experience on how is this actually in firmware?
> >
> > Not really, in ChromeOS we are pretty lucky to control the firmware.
> >
> > @HdG Do you have some experience/opinion here?
> >
> > >
> > > _PLD is standardised so it would seem reasonable to stick to that -- =
if it
> > > exists. Another approach could be to pick the one that doesn't transl=
ate to
> > > a sane default (0=C2=B0).
> >
> > I'd rather stick to the current prioritization unless there is a
> > strong argument against it. Otherwise there is a chance that we will
> > have regressions (outside CrOS)
>
> My point was rather there are no such rules currently for rotation: only
> SSDB was being used by the IPU bridge to obtain the rotation value,
> similarly only _PLD is consulted when it comes to orientation.

So something like this:?

static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
                                     struct ipu_sensor_ssdb *ssdb,
                                     struct
v4l2_fwnode_device_properties *props)
{
        if (props->rotation !=3D V4L2_FWNODE_PROPERTY_UNSET)
                return props->rotation;

        switch (ssdb->degree) {
        case IPU_SENSOR_ROTATION_NORMAL:
                return 0;
        case IPU_SENSOR_ROTATION_INVERTED:
                return 180;
        }

        dev_warn(ADEV_DEV(adev),
                 "Unknown rotation %d. Assume 0 degree rotation\n",
                 ssdb->degree);
        return 0;
}




>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

