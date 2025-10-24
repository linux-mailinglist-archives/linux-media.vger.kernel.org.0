Return-Path: <linux-media+bounces-45458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E008DC04EB7
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 10:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7DD43ACEA5
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 07:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD3826FD84;
	Fri, 24 Oct 2025 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v3iF3RAP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E52F3630
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292583; cv=none; b=CwWfzpvXC1G3mFzfPICnsBn5/SMbw9SdrfX7iYa7HzUr9uBgXCM+xR9hV/4GHCk2k5yCbjrJN1EHCS94WmGvqYhzGY7KqA0aMu4+v0MwAWgVma9ewooiRULi1MI44GIHMHeQaZ3+R3I2qmBcmUrAyhq0L3yJGfbyucvgx4CAFL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292583; c=relaxed/simple;
	bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NtipVm3X1HdUhS8FWlrTanSxvKDPDnjjcdKzzXH9RyQavRU3/7yx1UGtPIi0rchI9bIynQlfNARzpPTjzCGpOnwqJQ44viFlgvTTtUn3A+YgzQUrEcVGAepmQZNx6nSIZaKk4enUBHDJKCCUZlSBMzkrGVQBg7//aQjRHjK8LWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v3iF3RAP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-592f7733dd6so1871452e87.3
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761292579; x=1761897379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
        b=v3iF3RAPDCb1elFqO0VtoWQu+fW6ymU7UCcKEvvmYKNYTD2ooJnLd6jMbuJoUoN+Dn
         48jC0TXcnzK7hHI8l7XLLufqE40irxcJ4vQUvDf4zdOy47noMAAYnUg6+rKFE7kuW8KB
         USll7/Aewk1bIvHRDatF6iZ+ivUhLjYhiJEJEaA/t1MN12k63JvJ8Z2BqetAPfCPpfzc
         bXyJLqDmaG/v2uSkzQNDFkhtLwjQdE/QsFWa4lokn+PvuaNQ6Zeenb8G29xaiiFXP0S7
         FDqWxQyTvlalR9tZ8BC9oRxHctw1PO5qfa50RYj0lq81NdRESC/gWmdIjcg72jvCS2fV
         wJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292579; x=1761897379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxy0zWX1h247nPbsMpYtj4rqvQKsZpsdIsqOdaa3i18=;
        b=JdVtnwouBE4Uh0k5ODS3VX7MZP6aJ1zclDFTuq8Kr/Oq1d0fmSHRxwhfY0jZA0Vfff
         kvIx5ohyQh4NwQzBfO9XR88tP4IdoEWStNgcOx/z8xFq29Qe9nhATzq9e6sHvA9Dz80Y
         0RrPwlB8lFuVyR8BbsbUGVviAv+NABoRyoSinJ2DhMeINWxP/BblX6PH8WL4UPTuPjtF
         etxcmjDJezA3UEEkctIfchJ4Ua2QoltPnRDe/J7CuI+a6jyyoIGBq7FlD5lesZ2k2Gxt
         btBhkdtCMWuxp+535DZ0ViETf8ZI4YZDJ/1uak7qdhfiCdkg+XPriEkdVxyB4BrmYE8y
         Pn9g==
X-Forwarded-Encrypted: i=1; AJvYcCVlooghkGXnxLYCR4DpiQffXYoB2vYW1mtryfuoS3Tn9CCeljNVoGLaLTIwz4PBlYbb/KpoyjIQK2WUWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmaV+vL/9C4WEwZeCF4Kbrex9JY4ndwU81OynU12KLFZOnzQdr
	AW82B52B5LCxbZW8lYgxm6lzRWScNI25ocfpbXsvEWPijvl32cGW6Ommhxh1uLEbrgdbhKf1Uht
	XsnCI3gJM5cxTINpJXcKWUWNkGWZIjuXgXakpRpYxFQ==
X-Gm-Gg: ASbGncvXRb9On8ULy0MLw9xpKQZkmNXD1RjDvZa/pA/Kbcj9Wj9iR87jfVtFQg3Ir1k
	fCX8zA9AdHBoR9EOutrENz4M1Hm+k/W39AKgSu1tLPbOsOBW6UC4XZjkerGfUB+xcfJAW1zMTmi
	LoXaLZBv6Lajh+n/qZwLgVP3DOTayxZ+owrOyk9Ao94wrC3Ci7atP9ny6r3p7cTNoXTgh97Cvv9
	B52bEMZ5+Mo3/4krM27wrAMmmrm6mpGLyVr0BPlJKSomu7l+ec+b/AX3a7A3bnAXQF3F/8uNj0E
	wa7qhQcqElXEeGk=
X-Google-Smtp-Source: AGHT+IHSnXZ/gyOux7cXwXN4jLtleYFyXBIE1/V6t/jovl+yJ4b+HMb04wimJ5i7xVzENgmv7b2GUJ2i/5ONH7mEpKM=
X-Received: by 2002:a05:6512:130c:b0:586:83e2:2295 with SMTP id
 2adb3069b0e04-591d85525f5mr9376212e87.45.1761292578695; Fri, 24 Oct 2025
 00:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023143957.2899600-1-robh@kernel.org>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:56:07 +0200
X-Gm-Features: AS18NWBwXS6t25LKJEi_UKqvj6YhljrcGI4AFOhItyKPndeRwhvu3EmnTJe9vDc
Message-ID: <CAMRc=MdE=1cPDPQwPQA6mdBkbXF2pG=oQ_oR_YuasGzaPDsKtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 4:40=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

