Return-Path: <linux-media+bounces-21142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3D9C1A4A
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123EF282447
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD77A1E25EC;
	Fri,  8 Nov 2024 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gkF/Laah"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7806E1E22FD
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060890; cv=none; b=U4HJe8/q2U1pDgBBS1BuLJVgpvW32LNNB9B3k6guJRlKCyDXbJFWim2QFo+aOXbV863KhHEOh5S3Md68PMow1GQUSJo/Edy4AiJMYpiFIhVseVEjaCAjfAGydDdz504nsAhN+DsCAXjVSFpK9Ir+OovOWLoXYr6MA3El1RMogBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060890; c=relaxed/simple;
	bh=Q+C1b72oL+tBYPJlQszSjctoLRZ1tb9jhGxKJ43HmGg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIsLIPdQpSoNM/6/UyfNr2yFKBx1SdDrQs5ekAamSt1IUjy0Onx4AzrvTvt2hlBeaqotZ+100xX0kiaEW9NNePKqnTBVGGOJeFhK5MVA4HRSlMcT4ZfA3faNs/oNydffM4m5sLsXMvvgH9d+1iABPq1w2kapf2k2mokaI48y7YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gkF/Laah; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5111747cso19479551fa.2
        for <linux-media@vger.kernel.org>; Fri, 08 Nov 2024 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731060886; x=1731665686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+C1b72oL+tBYPJlQszSjctoLRZ1tb9jhGxKJ43HmGg=;
        b=gkF/Laah8U3sactKK0wATTRqYxRaB7GhWoooYIEmGBd3KskmfiUa47xLwq17Vaxt9J
         c8+poI4sJ2sUahFuxSeM1VDfo+MPRK643ScnyIGnQ4TzkhrvB3l/h3Gt2wCR+gpaM34J
         2Djg4lOGiKyR96As7E+M+4H4RwbIf2pqqsX5kcdk/5GzBlQwTVx6txf7C6vD5sd9PJxf
         /1BnfX2Zalkika+9Eu5UvdtcULwIztMDAgu/Rx/H5D0wQF5JChmjgu3dzupvgDewqM2j
         IYDjKF0ZGEl+/lQd9ReXm7fBIeu0f3H221mh+V/jzzvMrOIsskk/QZdSxnFeKDenCGL8
         4naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060886; x=1731665686;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+C1b72oL+tBYPJlQszSjctoLRZ1tb9jhGxKJ43HmGg=;
        b=w+Gd8pNw87lOZp2kl8vdIw14V1EQydDOxc1EtQcjIL4lgyemhLeq6xGUUuXCoJV6MH
         6imLkU9pWm7ouOi0/IrWqkiPwe5PIZxDyEmxGT2jCV+CeTGvbzriU2vNWXausjQtG16R
         aH1KFpFhMlnDPMX0xi8pGWW5MCUkoJ4M6l1/+JLrI2jTYt3TCU85DvDl1DF4fWndvDm8
         WGdDNIjMB55C6NO1PqT8lw61OfaJbJ1LcN9akg6dRxOoe4sKY9d87alb7OZyK3QhuGW/
         dKnshBobOSMejKLVNF3YgVDyNZf4A/PP0ySA+dGVlO17HRW3IdZJw8M4qHRF0Yeyhvor
         1s8w==
X-Forwarded-Encrypted: i=1; AJvYcCV6HjjVTsis54AGxL6/bA13ZinyO7IjjjXxgPF8bH5O+0/WEks/Ya9I4Pu8+UovRsibxxxec0YD10tMYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDam3px2rSmKtrDPFE09SaoU94CnXN9IzFsejkhBnkOgKj+30g
	Upk1Nizcn1U4mmwFKa/TuGRZUOMZ+3f4LatcyedhqXs4hhGZCIPDt0YMz0P+7hiHcUyKVFvcN7r
	99XjmL2B71Qla36SDwk9IjWVWNNh+coMElVHViuI7UGedrcnTSSA=
X-Google-Smtp-Source: AGHT+IGf11c0mBsFLalzMr0/3WBxjNo7Hjzw+hkuKmKbXSSlEL+wUoo0hV3td8xnf9M6+bT1iZrRJWgEB35Fv7hzAuE=
X-Received: by 2002:a2e:a5cb:0:b0:2fb:c6e:9a36 with SMTP id
 38308e7fff4ca-2ff2028c50amr10097141fa.24.1731060886296; Fri, 08 Nov 2024
 02:14:46 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Nov 2024 02:14:45 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20241107221134.596149-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107221134.596149-1-hdegoede@redhat.com>
Date: Fri, 8 Nov 2024 02:14:45 -0800
Message-ID: <CAMRc=Mf85fN1tjkf74Ozm9NS9soMPOzz_1LNxSUrt=14tJ-r=g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: gmin: Remove GPIO driven regulator support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Nov 2024 23:11:34 +0100, Hans de Goede <hdegoede@redhat.com> said:
> The GMIN code has support for sensors using external regulators enabled
> by GPIOS, rather then using regulators build into the PMIC.
>
> With the exception of the Trekstor ST70408-4 (1) tablet there are no known
> devices which actually use external regulators for the sensors and the code
> for this is using deprecated old style GPIO numbers support for which is
> going away.
>
> Remove the GPIO driven regulator support so that the gmin code no longer
> depends on deprecated GPIO APIs.
>
> 1) The GMIN support itself is also deprecated and all sensor drivers still
> using it are being moved over to use ACPI + runtime-pm and the ST70408-4
> shipped with Android as factory OS and thus will have broken ACPI tables
> for the sensors, so like other Android factory OS tablets it will need
> a bespoke solution anyways.
>
> Reported-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>

Thank you for taking the time to do this and removing an instance of using the
legacy API!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

