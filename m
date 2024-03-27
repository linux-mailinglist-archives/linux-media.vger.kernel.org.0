Return-Path: <linux-media+bounces-7948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD7988E849
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 16:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5661C29E77
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 15:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A5313D28E;
	Wed, 27 Mar 2024 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mGgxb37z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99713049E
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711551004; cv=none; b=dQ4wzY5jJbRZzGlbYH6pVCQz/tIvZQ3sVYS6hURfx2HrjjX32vIa+07YB0c3/qithov5avK4oLaJesHLyTPrpz72ttDlwpFtTxS3mAKgEAeBL9gdlVvRkuU9IFR37IbetizPHfcsAG8MQroqi/pfS2mjgNOZwWMpsIv4WMd1K0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711551004; c=relaxed/simple;
	bh=/wK5/+nOXE7/Fs107JDE5jcfvzpPLAFz1tDW40UkPro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IT2hyGgv/TkbuGRFkHX74fbQq1FEG1bQamFEKi++H3y+vpSfyyuML5pcouAEBv9HkhjgPA1TIrVCDH9vpvYEnuiz9HIIIjbuoqYgU3g//3uZVENfmoMrXoMMBMiog7RlB3fvL6nLExQyrLmJze1wWM8nCqH7VuiJyrKJsm8KHcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=mGgxb37z; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ddaad2aeab1so4885447276.3
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1711551002; x=1712155802; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1hTYCC8kAqYkgGU/0UM3YkyVpAl3P0m4SRn1E0wt2sY=;
        b=mGgxb37zV9U38Y2HSHUYskzrOyl7sFLfB4uhkh6e/w19j+3bPoolPYrKgqMvmV8kOj
         771ZD+sbpazDrHibAoNkS4UhCcIKl7y2iWvvNJIVD8l8JMX4Uq6+CZ7MH63OCXEkgSZQ
         nhz0crNE28D7Idtt9cIR2XO4mLdG4w2Km6A9KqJvKKUGwEDmcEXu8lupvaOCwyRBUGdO
         7dof3XludHss0a8oG2z5CgKwVj2w5dm/z+0P/c72sjt+vzjJFOWIw2lAX06d0M/AD89y
         7AXBk2gt51Qi0kF1uYv0ykV4h2BJMAZDahUiygVgRoQwAt2Foxgwg8aGKpRSJ9yMmaRG
         R20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711551002; x=1712155802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hTYCC8kAqYkgGU/0UM3YkyVpAl3P0m4SRn1E0wt2sY=;
        b=rKd0X4Z2witsuTp4Nm1Dl2hDPOZ637O0BELzgLlY2HSsHhPq4qpEKojjqlGdeXIJys
         QFjuPUEsyzPjpMCesynkr7n4BT6aUKp77wvCzv11CQVOI7hJbBvb66oXvkchdgtg9W6s
         to8iILplKm6hfKaRWubUQL6BIgSx0jp1eW1qSheMSYqiEZBbYnPzu30FFOHF6kheuEcD
         7SNkNHWxHtbMVyQ6SwUsJhSTOd28BBGkTqJQGq8WP8jCy8xDZPDVmeWZDfizhY8T1gH6
         GIYzwU6gD5ACDwdh3W4+JmOIDWtDZZoekKBh4XRYefsn3O+ni7rQdqb3iuw17fBbpr25
         j90Q==
X-Gm-Message-State: AOJu0YwMxokeekOC5m4f6rH27LL5NwRFccMIBFW1FqqVUfshxFwAwdMz
	Xa2dx4bxhEMHIDBZdIWSbBehkGKg/9avOJpHTEAN6aIDI4dFpx/GZcyCwW0NXum1QIuxZPNzKe3
	zY31kSzLQKmKj1UK3iz+1aPIV3KpaDhHa5Kayrg==
X-Google-Smtp-Source: AGHT+IFVbWWHx0Ekn2Z0z8sku37fEr9adfRUGe1NbsI/n3+e5rQA8h+TVeJFxP+ayJW42LL2FCDCTYGw7JBYYkjYgfc=
X-Received: by 2002:a25:8304:0:b0:dca:59a7:896b with SMTP id
 s4-20020a258304000000b00dca59a7896bmr2362757ybk.50.1711551002049; Wed, 27 Mar
 2024 07:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327000510.2541-1-laurent.pinchart@ideasonboard.com> <20240327000510.2541-10-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240327000510.2541-10-laurent.pinchart@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 27 Mar 2024 14:49:45 +0000
Message-ID: <CAPY8ntA-TDnMKNiMUpZzGYTYZ-7G_KkK7cSBuJeBfjkwXSZ76w@mail.gmail.com>
Subject: Re: [PATCH v8 09/10] ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Naushir Patuck <naush@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 27 Mar 2024 at 00:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Add a fixed regulator to model the power supply to the camera connector.

As with the I2C0 mux stuff, this ideally wants to be generic rather
than 2711 only, but I'm happy to get it merged for Pi4 first and then
add the others.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> index d5f8823230db..cfc8cb5e10ba 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> @@ -15,6 +15,13 @@ chosen {
>                 stdout-path = "serial1:115200n8";
>         };
>
> +       cam1_reg: regulator-cam1 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "cam1-reg";
> +               enable-active-high;
> +               gpio = <&expgpio 5 GPIO_ACTIVE_HIGH>;
> +       };
> +
>         sd_io_1v8_reg: regulator-sd-io-1v8 {
>                 compatible = "regulator-gpio";
>                 regulator-name = "vdd-sd-io";
> --
> Regards,
>
> Laurent Pinchart
>

