Return-Path: <linux-media+bounces-36007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 472CBAE9F25
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 103AE18871E5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F792E7179;
	Thu, 26 Jun 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QiDqBjbA"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900552E6D12
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945270; cv=none; b=YYeCIKyCxHoPNJ/NRtJxJYNrahC8+3nPItVQr+VmFLHPzO5WAX4uK9tYeKL/HDcXEmYuX9oYyORhGuMkmkKAuu8sHQjWZu8wubXs95lE5JQz/OIGeFYJ4XhYK61zXB3H7oc7EEHEkQG8p5FbKeHM9aJppDPQJqnnBqvbZuDwgVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945270; c=relaxed/simple;
	bh=a2e/Tt6IqK56eO4QZpbVoL5FCknGqOTyoQC7inhQeK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3LNlFvujchzAU4xVLzV077iIUsaJBeHY4Ir9XNyWWewfF2Rk2uQGUY7uBN+h3PU5Yo5PluLF/LiOCUT0IBWqeJ7+CX1y0c+GU50jGQAYS+4kAB/l04lOMsXz/Ser0lA26VTNvvq2E9MumhI2GH+dGqRJrgqo5rbqd+dzi8sJ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QiDqBjbA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750945266;
	bh=a2e/Tt6IqK56eO4QZpbVoL5FCknGqOTyoQC7inhQeK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QiDqBjbAR1d8SguO4YBCDXmh0PdyQf0DHA2oSOhGHilrDMXp+GhrFtckZLwYRmc5U
	 v435UaKJKB+p6EBmSuzw3ls0p7H3/wY3ecng8rtaFWmvd0vIVf2QX1E9OD1om88eJs
	 gU6joX83K9BHQG/g/Avx9enaVyptTaToYOPDMGzhVY/Mge7CQ6RQ+YyH3cbL4ZeARR
	 jhVM8hhI+f2vbyxJF7s1yhH6zi5M78/zHYNL+vKXu7m1afJfOyJ+6f1oHYx3/Z4W5D
	 9amlcHDgM3Is3i3N3q3Dm3CYBGsrLG0kwEWkRgjmRbXbGf+UwxxHTwk6Rhe7r0o/kY
	 xTBThZZ4OsJoQ==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3722117E055D;
	Thu, 26 Jun 2025 15:41:05 +0200 (CEST)
Message-ID: <c81e5981-9ca1-40f6-8f66-97db4a2996e8@collabora.com>
Date: Thu, 26 Jun 2025 15:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/48] media: i2c: imx415: Use the v4l2 helper for
 obtaining the clock
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com, hdegoede@redhat.com, arnd@arndb.de,
 alain.volmat@foss.st.com, andrzej.hajda@intel.com,
 benjamin.mugnier@foss.st.com, dave.stevenson@raspberrypi.com,
 hansg@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com,
 kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org,
 m.felsch@pengutronix.de, matthias.fend@emfend.at, mchehab@kernel.org,
 naush@raspberrypi.com, nicholas@rothemail.net,
 nicolas.dufresne@collabora.com, paul.elder@ideasonboard.com,
 dan.scally@ideasonboard.com, pavel@kernel.org, rashanmu@gmail.com,
 ribalda@chromium.org, slongerbeam@gmail.com,
 tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com,
 linux-media@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
 <abbcc533c6e0aa9d8cd02a746e134dc356fd31b5.1750942967.git.mehdi.djait@linux.intel.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <abbcc533c6e0aa9d8cd02a746e134dc356fd31b5.1750942967.git.mehdi.djait@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

Thanks for doing this!

On 6/26/25 15:34, Mehdi Djait wrote:
> devm_clk_get() fails on ACPI-based platforms, where firmware does not
> provide a direct reference to the clock producer.
> 
> Replace devm_clk_get() with the new v4l2 helper
> devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
> platforms to retrieve a reference to the clock producer from firmware.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

> Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  drivers/media/i2c/imx415.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 9f37779bd611..2e206a671ed3 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -1251,7 +1251,7 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
>  				     "failed to get reset GPIO\n");
>  
> -	sensor->clk = devm_clk_get(sensor->dev, "inck");
> +	sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
>  	if (IS_ERR(sensor->clk))
>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
>  				     "failed to get clock\n");

Thanks and best regards,
Michael


