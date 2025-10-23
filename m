Return-Path: <linux-media+bounces-45412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87612C02344
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 17:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897823A2CD9
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE4C33C521;
	Thu, 23 Oct 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLsEC/hK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5F33C531
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234149; cv=none; b=MxeclXlNA/5QbfHYby0ZFp3jOWqxfY1qlpoRcIBL9f/ZocCH6Z9S91JwPzg9NLoaCRwmRqxbswDrG0FVegAERi0p8b8+J+0RLGmRWCz31SMw7282pd1b9kLzq5oIyS6bSVrEG7zoZr0yKudqqvhEsbrEwKiDNE1orng4Eu1BAeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234149; c=relaxed/simple;
	bh=CdcIJyHX4clb96PckgG+JIrIZVu7Cky4+dgR8wQZ0AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFZcekrwCLl/tvv2uMoEUdymkpJuD9R0J/flLtQcu7pNsPuQSZVneg+DxHw0QxzbkEVD91z3kS6XNowdggZLjnKK1yjcg3rmKK0yBFXu7hcxmUxTjCpj9Bxste6bUz97FF0aeZ04Z3Q4HXzlEUUJamW1BZk2jGWc4pl7iTUmm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLsEC/hK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso667973a12.3
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761234146; x=1761838946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=XLsEC/hKI9rcYtvZep1kAQCqqw3YI29awmGXe1rBHmx869IAnxsBuaeEQYB0t6jLQs
         imXwO/2IUFcQ/T4FXrbzCa4iK4fw1KiOFu5ITCVwnTwBKQFw/Ld6UhdCElxyHmrOnC6L
         ZlL0a4p9RqTAN+T048bJ/RrIYJM+v6w4/AwZafr2sonvbFsXG58KyM/1bY5LSWq7BmH0
         3sFqTzk+Cpf+GXDmZpQEcqhfDS4YOKcZ/CeX/sZSZCikzQoMak/Sjbj0n1nb+YU+m0Qa
         D8WzDb1sjN9Dk5u+tUXh9878VLKtcU+YcYZlNPE3+zGCQNIaoO7A4ZRnOKxhG75gCRmX
         9aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234146; x=1761838946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=PsndBQ5lLtSiwgAKqhoj+2WJ5+8GlX74ZiSHkBTP7SBfUAS1SWWI53rx7yPyK31Hcr
         kMopYVdixg70X2Pqgwh75sxVHBlFfbU6UCAXhvgd4xLpPmBKyCn8+zYhMSlHGEf8b6mm
         v44BArIGreX5HFHxUlGre7NXUPJBxjyj/cQPoJf13GSEgiwI4rhFs57KG7GHua87D3aq
         Rt9eKsCLFoeGmpFbxCbijpvQN1mPBjb8Lu8tGHxrPThDjw9n8vCpWYeLjjwG74vUecjy
         DsGNPBPSudeRfrbB5n+nDEw3dPOpSLZatHPeMa9ioAWi2YWjePMmpmRD41NzhCS6+znc
         XBdA==
X-Forwarded-Encrypted: i=1; AJvYcCXO0UJwdF/2Tx4zLqjSirZeQ9xT/ED4HxGhPPksTTbRLk3zAtCufSkzGs9Jp+2ZIw+A8ixhyK1KhIPHNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzydvpjYxePe1DqdubayXbXiOwnYQBMHmqA4ZTH/KmwINzV0tZ3
	Lkv/MElI0m20aEz55hjTdf7hkf77YuND2LtAljZzKlT+1rmoQWipWxzS
X-Gm-Gg: ASbGncuBcFIyAXR9AQc6MOXJplAUj2l1SHp3kwiOprb7+rzbpTWvDkCEWHsxHmPxE8m
	9Ceiz7UWCXm6SAzoPr/dhbf6dEyecdEpUhA1+oXAkb9cuPVVl7+VW8M9tQP6jgCA56fh7T2S1so
	MzSjioDsKM5m0ZnzJXRsCcetU5sqRo5wn4dGLXlgHfR5J6CjRwA1pWmEvN09zmBm/TPH+VAN+3w
	282gh9vcPzB4kCwEsADR3l3dcjQv7ezZJbYN/FKNlJd4BHrAuAcl7ZAJajlcZzKlnU5bjRvr5ue
	Gx/Gl4yWR8omdUdx/Fbbs+YEzYaAM751ssnPtYFiQsdW5eaaDhiMFSkvT3veHMwMQBmeJDxdnkG
	ri6QwEenSQVsW1ydcNG/cHjNgxvsQW3IGxmQ2aLUZohOL4Kyyve+dJVC3u3myO7BwXJjM6LTD1o
	46qGjDNoPTjwMC
X-Google-Smtp-Source: AGHT+IFivLiKbkP0y2KMH2ZNEJ7GlEhOb9t2a5oI0W2mRRwwxItjHXvAd1GZTuvYOgULd0RdTXOLyw==
X-Received: by 2002:a17:903:1746:b0:290:9ebf:211b with SMTP id d9443c01a7336-290cb07d223mr295078455ad.40.1761234145718;
        Thu, 23 Oct 2025 08:42:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda72ddsm27825615ad.6.2025.10.23.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:42:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Oct 2025 08:42:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Georgi Djakov <djakov@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <0d01d218-15df-4553-8e84-fef84fde211e@roeck-us.net>
References: <20251023143957.2899600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

