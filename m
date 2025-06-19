Return-Path: <linux-media+bounces-35246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CBAE0133
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1281C1895A3C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B5327D766;
	Thu, 19 Jun 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZqCItIr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C1239E78
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323605; cv=none; b=p46hJ3WPvMX2247NT5ul8CyuKAoMtTBxiEB92OF9FC/89TunjvE/X/3YZRuAw+rKoGCJ+VJ1BW+f0+buyVPiCEStydhcjp6+mIuP9X71AWq/fRbgyi7Q3ASGUpFcrz2pLpqasAg4JKFFWJClUpDtVJQCncuL1Ef7qEIrp4Rw4no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323605; c=relaxed/simple;
	bh=UzuK/CxyCGnL+YSPUVuW3jK4T0cRHWwLE+0svoU+I9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hK5gLAoz6qTeOmnQUvtjU7hyTaXFOuz9loM1ee+bm9YPe+A0VwjbQvIdw8+EVicFw/YFESVAwb0VFW679zLi0L5dpBQjHx1KG5PHoJMxDoeEYhEhOPWAz06Y0Pbs7C0S7/5PgauYQfX8Vqt4Hswz5uPifcWMArCK0gUoAYunq1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZqCItIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE439C4CEFD
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323605;
	bh=UzuK/CxyCGnL+YSPUVuW3jK4T0cRHWwLE+0svoU+I9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uZqCItIrk3k1OdHIzIrazTjBWejLTxKQPYzsMO57UI7rJrtaBqrf43cOBcK1wa72w
	 JsIvZHpA+V7otozjmg8DWFRLn/hvgSNdiOpTmoRK16hVgaMIKCpTQWE0dbHArd/Pt5
	 xqUtXO3MW6lvEkNsLH6d2cvFYwWGq8Y5DoFwqXdEYr8T4rqE++0PFw4JA+CdyjFaRT
	 LwFPTdbgd0r2wrp/Zb4qUarXaFCQgRfNMt+WG6fExOEczrCcoEC8Ysd6dTVaRXqWSl
	 LypPuEpu21fbDAY/2xl5pkj/I57BSSvXvZAt3RuekEF02gANJYNEK5UEFhGejydXq2
	 P6bMo6rdAp2yw==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e82596e88c4so521802276.1
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 02:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZ2bw5a+HlM5U2U/UHJg6sESKQxbtcAapD1AzeTnQQUAnZIb8Zy87N+/MS2J7PXTIpo+Ue4byznwL7kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy525w8zFPp4NlkTniUobS86V2IveRJt0TRZAGvHOaFtK2zx1g/
	v21c/0RZC6pVxmLDPjuJclnRZhiimdBjYc5becceAcO4gQ68TBhrh5hcbU/BDLjZ7mdSt/Pjghh
	gTqQ/PF2HxLe61TDqxJ6zeEcMN0uDjVowzxa+/ir3xw==
X-Google-Smtp-Source: AGHT+IFTSpIXWJ8aJgks2cku0velW0M+JCR6Rbfmtd6WsoM033VVzHoiXCwOg94pnYfHO2hy+W/9swsQZRSpK6zIGwQ=
X-Received: by 2002:a05:6902:2613:b0:e82:6c9b:8287 with SMTP id
 3f1490d57ef6-e826c9b85e4mr11134815276.9.1750323604035; Thu, 19 Jun 2025
 02:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <20250606-6-10-rocket-v7-2-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-2-dc16cfe6fe4e@tomeuvizoso.net>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 19 Jun 2025 10:59:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4p2wuMVVvQOJ5c6ecT=x2pr2VoZhS4wH27qaR9DptQHA@mail.gmail.com>
X-Gm-Features: AX0GCFskbG-ChYYQk7bGtKWaX4j6fsAKjpFPkM8iQ7QewPkQLLciRbSAzy_fqYo
Message-ID: <CAN6tsi4p2wuMVVvQOJ5c6ecT=x2pr2VoZhS4wH27qaR9DptQHA@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] accel/rocket: Add a new driver for Rockchip's NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 8:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
>
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
>
> This commit adds just hardware initialization and power management.
>
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
>
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
> - Move registers header to its own commit (Thomas Zimmermann)
> - Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - PM improvements (Nicolas Frattaroli)
>
> v4:
> - Use bulk clk API (Krzysztof Kozlowski)
>
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>   (Kever Yang)
> - Use calloc instead of GFP_ZERO (Jeff Hugo)
> - Explicitly include linux/container_of.h (Jeff Hugo)
> - pclk and npu clocks are now needed by all cores (Rob Herring)
>
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>   Stone and Robin Murphy)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Robert Foss <rfoss@kernel.org>

