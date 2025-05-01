Return-Path: <linux-media+bounces-31541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A1AA64D0
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 22:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4914C58AC
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 20:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5315F2253FB;
	Thu,  1 May 2025 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrMe9PXT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BE4B674
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746131826; cv=none; b=JAToJAsAN6q323W6PWNiixCQjA59VKF1Yf0pHpC9hLnq005+azYJnjRbW0wXaZBbw9L4sAUe4rD5IgMoRnP3eE4XSpWGO4U3ovrvf+gfnRPCUtMpKPJO5z9qB5V7eBX/8DhILROeFctDQVpnZ2pYUESt1g2q/U1x84oAq3wH8eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746131826; c=relaxed/simple;
	bh=fTWEiaNOb/F4D5Hd/s2szCTKproSRxpCJIn8b1+jUJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2SbZJaA76xhREWqb4ddpVYJVUCqWlB5SuhxlR3gdq5+Pigd8kRW97PBCzi2UcPZWyUkD07oR4ZW6wxFlzruBYVCj8doYtdJ+s+GteyOpfEJ9BihGeW0w5XZCJVjK/so89W59X30D1IyicT9HrVVDsKFW3IKFZ8CUf5rRgyxnds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrMe9PXT; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so237102766b.3
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746131823; x=1746736623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTWEiaNOb/F4D5Hd/s2szCTKproSRxpCJIn8b1+jUJw=;
        b=UrMe9PXT+FeXt+Kb4fZ09cxwJfptHKkk21aYQ+TJpLeHwP+VvVGy13C6qaV8o1aN8j
         S9gnlHeVPmfMMo54DowuL5dIC+w+CnC3Ygqc3zrhZ+LtRYvFrlbF+gpTggFT6zL1JDO0
         BZp5Q7WvgEvhGNKfj8xOrK+s53wytGgSrIB3kmGXwoDbX7oI+RddlEjpG7zJXtn9P4zt
         lZv+QD00uRAEQOSuDPkNJ44TscJCmFuARy8JMBLb3uFuANGKnhVv9wM1g5XiL00KogaC
         17iwCT3mMAnCBcYR0qaGa0PkdEcZF1fq2YhxLKXYUkRlxk1j9OF1wOIBNZB/8/Z44Q/J
         X/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746131823; x=1746736623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTWEiaNOb/F4D5Hd/s2szCTKproSRxpCJIn8b1+jUJw=;
        b=rC2WPQUJBJtgXQBmoZlLuAcnkiBQDxZRFu33vV4dKkvngdgPqbzhqJOpvEKiNzCqwR
         o61MMhyF74Dxw70P87rQz26PytJPmEK3Q23aO8rScoPRalAF9XaWhUi9LsuQL58nM6q/
         YMmbznaz6T+UZ2ntiZtgwQWO3aRC2l2/4RoijWQ0z6zCAGfo1ZRvdSbyoull+W5yhmTE
         D7Y/wmUEIe4Pw9HJl8z8RtVo8oHa4t5aiC0h1XqJKpfE/ANr5zo2S35gynbqKR+dd3wR
         czgfAu3QLu+U0D1n9Pbb6ZdAqcZWIBKWhCm6/At1MCd3Xvpi+tVZmByrEqSEGW5WVchC
         zsyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTQDyeNWjsiHCu5vRqGTwcxFmQSaxhLh0lS2Czz7krPV6XXaP4J4vR2t2+aTQRXCco9AmiLNbnNn3kRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGoSGxfncqEpmTwJ4MPix2GOF6gS/An+Qpn9Gg/i/gT9RKK7YA
	zrlKZSmT+nyQxWUErzUhUoDCqirmNoKzbtXh1nkWYOwX8a0hHNSfnU+odPLnU30Uq89Kk7S3Za6
	nI/i7ORSGno1w+SG91JoqTQr79io=
X-Gm-Gg: ASbGncvzP18DyhxUf/qvSE0AvfRWNF9+oZ0AvGOuChV+fhzgnfEDCy0M6nawo12myo0
	qLbJvBubcireus0BzSzbE22oWeD/SVESL54j9d5Brkav2lTPBoRQ+xwYnoQ37Z72D5eHN+TsR2I
	PWfHIlU3xMMdIrTZoAMgF5mQ==
X-Google-Smtp-Source: AGHT+IFi3ZJ0cyCsUPOSVg7wV4cmaQoS+bQLM1NAGl/uGTL0DGCU5tAfhJcmc83IwzNNLpXdWE3Eog56b0AqRyd3zyo=
X-Received: by 2002:a17:907:96a5:b0:ac7:81b0:62c8 with SMTP id
 a640c23a62f3a-ad17ad8e23bmr55505866b.31.1746131823099; Thu, 01 May 2025
 13:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501134312.104711-1-hdegoede@redhat.com>
In-Reply-To: <20250501134312.104711-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 1 May 2025 23:36:27 +0300
X-Gm-Features: ATxdqUGR0Jxud3XSkMswymw59Gt16oxoBwd141Cyu6-0Bw2-gjYv2Ga-_rujrkw
Message-ID: <CAHp75VfnD7Y9Vexyex2iVnHYPzrSfLE_W-hB_-G9A+YCgZ2nvA@mail.gmail.com>
Subject: Re: [PATCH 0/4] media: atomisp: Add support for using mainline
 mt9m114 driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 4:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi All,
>
> This patch series adds support to use the "mainline"
> drivers/media/i2c/mt9m114.c driver, allowing us to drop the atomisp
> specific atomisp-mt9m114 driver.
>
> I've things working nicely on a Asus T100TA and I'll also post a series
> with some small, necessary, mainline mt9m114 driver changes soon.
>
> Despite the mainline mt9m114 driver changes not having landed yet this
> series does already drop the atomisp-mt9m114 driver, in its current state
> it is not really useful anyway and spending time on fixing it up is not
> productive since we want to switch to the mainline driver ASAP.

The last patch I like the most :-)
The patch 3 seems to be done better (by doing some preliminary
refactoring), but looking at the bigger picture I would postpone doing
that as there are more important things to do with the driver.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

