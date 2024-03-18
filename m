Return-Path: <linux-media+bounces-7216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BC87EB7D
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 15:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D34451C211F7
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 14:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6C34EB32;
	Mon, 18 Mar 2024 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LBWbdg7R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902EB4E1D3
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710773833; cv=none; b=GLIX2u20A/qrEOHCMyPGMynrmWOobJBJsxwjECWKpQ8WOqsxebQh4OHWU0VhUODRKDB/gU2xSd+ZqYFsvW7+pscpR7wtj0afEZFyCx1Fgk/QU96mCKedUFbVJuZ1qtHEmrCOZhrEyBPm6KzF4Ip8OUPgcwi7WRBkIvlvz5sd2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710773833; c=relaxed/simple;
	bh=aqkSeiNbaBa/hffN1QtsyUDdszzapf+0lbAovHQToIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fl47Ukh1VfSnm9EFNLIQqzumQxzYRxBxwNvIqz2/NIqZX1n5Nc6AqurYSYV52ODVeuJh5vT9IlHIoQTIV6iI/G3R8K1TUHTGgDydeIvDYaud+UlNdzm2B/r8kf2qRXKALWU5ORpdiHL6CyTN9hF3+QX1S2UT8Lfe4FModwfUQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LBWbdg7R; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso2957211276.1
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1710773830; x=1711378630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GXVk/R89vNIXPbvaLrsF3w7BXuAR03eMrFTrEPGNw4=;
        b=LBWbdg7RQI0ax3avqpOJU5l+eC7JBR8FWEiNwu1wlXXoP1apf1g1Crx6iiz0vp+NJe
         yXg+Hq46hADZu8IL538EpclNtP1T+gqr7e6ZmyIsYOky+jMwEa2zJeIl2uxov3HWOgZz
         zzDNCjO84SgK/gsplpeUM91wsGrK4gHo0GUmaN7CdyYAQBwPmqVGvHrCNvEAA0Q8ci56
         XGpTEba2Bwbk9tQj/dheHMJpQwfK+oRQnW4xE2hTAYSFEQ9ZuWfizZgUlhLMj3XXvTvW
         0cwOHiUn0xl6FeZdqSPsiotNJtPg2pJXVoEEuUTW6PpDOI/08lMR8sAxCFoxaN/HrJ1J
         41DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710773830; x=1711378630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GXVk/R89vNIXPbvaLrsF3w7BXuAR03eMrFTrEPGNw4=;
        b=qlIetzFxN6+T6Zoii4YkGTDnfDdFxk638iPtM0uulObQ0DevvXnrifxmQ6UzzW6WJz
         wIKstgHxAsnJkVQBYg5UZ7ifII05oeetq+Ak8CNETTqqwmtdxrTZI1XXDYkVhVxUXqzK
         giT/lAivxck1nhdpm9uw2KoOnuaiORAQ6FHo4fWs/fynrYBPq5toYUHmjoHq8BfPK45T
         BiHnNd6nXX9YCv9o1yFdtImfdOQ18YPQJel/8gZqhFfsup/vQfY3WlgovBlZdnid08c5
         hFxoQEXM2xfDfnqNTmRMV5cn67Y0oF7FHPT50Db3WVWNEa0eNO5MJP8ydqjat3283wXt
         ccwQ==
X-Gm-Message-State: AOJu0YwN5zwUKc0g2AgODnuAQTRJP7N1X7LWwVtEh0zwXTUzR6LKJHnP
	XB3Y7h80eONVfsOBwD5+JdG46ZAGBRIKIrQ0NFnmyMq6bE/HYMEuQeGzFKUnZvGYK3HtZRtzCcm
	yI5t7nsJ6mqfVIm3Em4MsvhW2Orsym0d1iUgYfg==
X-Google-Smtp-Source: AGHT+IEp48gLWDwrHpqJRLvZRWympTh8tSaF9+n6pHvpcSzAPqxUKjFJLnucvzJ6+Pd7HR5O1tTBBqSnQUpKp61xs9c=
X-Received: by 2002:a25:5:0:b0:dbd:8f9:a71 with SMTP id 5-20020a250005000000b00dbd08f90a71mr9261659yba.28.1710773830603;
 Mon, 18 Mar 2024 07:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com> <20240301213231.10340-14-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240301213231.10340-14-laurent.pinchart@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 18 Mar 2024 14:56:53 +0000
Message-ID: <CAPY8ntA+PSTfee=B8kZ0MkndCQ2iDErSPdm54bzgQAJ2RnwfcA@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Naushir Patuck <naush@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com, 
	linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Mar 2024 at 21:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>
> The cm4-io board comes with a PCF85063 on I2C0, connected to the GPIO44
> and GPIO45 pins. Add it to the device tree.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v4:
>
> - Use the right part number in the compatible string
> - Add the quartz-load-femtofarads property
>
> Changes since v3:
>
> - Separate addition of the RTC to a patch of its own
> ---
>  .../boot/dts/broadcom/bcm2711-rpi-cm4-io.dts    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm=
/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
> index d7ba02f586d3..d5ebb535afd2 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
> @@ -101,6 +101,23 @@ &genet {
>         status =3D "okay";
>  };
>
> +&i2c0 {
> +       status =3D "okay";
> +};

This is already the default from bcm2835-rpi.dtsi

> +
> +&i2c0_1 {
> +       rtc@51 {
> +               /* Attention: An alarm resets the machine */
> +               compatible =3D "nxp,pcf85063a";
> +               reg =3D <0x51>;
> +               quartz-load-femtofarads =3D <7000>;
> +       };
> +};
> +
> +&i2c0mux {
> +       status =3D "okay";

Default status queried on patch 12/15.

With those clarified:

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> +};
> +
>  &led_act {
>         gpios =3D <&gpio 42 GPIO_ACTIVE_HIGH>;
>  };
> --
> Regards,
>
> Laurent Pinchart
>

