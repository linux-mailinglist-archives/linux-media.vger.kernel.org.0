Return-Path: <linux-media+bounces-7215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6C187EB7B
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 15:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB17C1C21249
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 14:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4465E4C619;
	Mon, 18 Mar 2024 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TPf4Go0H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F19433D2
	for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710773812; cv=none; b=RD0Hb+AhkmO9Z1d4gKknBcNSwHj2m3PuKoUckB6fqO8RS4WxGBwI7C27dvP1DZDOa/qewMjWWSY192bQhtwRVIIPE4UpONt0YHn9/kC0C8AzdWbZP6CroOM2+wh3ySoUSXZJIdcWXWWl69ayZe6/wlRnTIQXmJNZNcKzB/qh6dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710773812; c=relaxed/simple;
	bh=2Hto5oSU100k6eNTwmcTTVUdT7dUBLnbh2DWJiUzoe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHk2AYZGNnoxF2ULmXd8d0y4LLssp7kQSVUVwr7yd/TJABCVmdxwiwxOpvMoXQP1LUWVdE7t+byXb0jcxTsMd57M9jq8SM6aWdghcnMbOrwtlC6ItRC+N8XD6vBJg626UuCmEaQGzwTA1kbejW877j6OLGEyRgkzfoxUBbrRVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TPf4Go0H; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6098a20ab22so40385777b3.2
        for <linux-media@vger.kernel.org>; Mon, 18 Mar 2024 07:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1710773810; x=1711378610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVgpcRP8MLBq/WazqUdFYV0IEInnP4rHr8dpbkNJyf0=;
        b=TPf4Go0HHxpv04ohTqCgHVdipRANJ575P/lxFQJxYXOrM9eogEFEc9+sqTDJyoYAD9
         uHafDOsojII6FIbTixVQKCdd3u752zZtO4cR+8HPifG+3lhDG3NtOG0nxrCAdvwI0E/M
         6TgR+tGAeTz09DrF8hiEa7r8ZYBWGSLDjZoyeNtjreMZ0itptoTS0jxsZjfhcS+YA8PH
         H6iKyqwYvzKVwOcbyIapq372LDUSsqGXRRivu+mnVsV3aGx67P4BN2VHnyhXOsQH5DK/
         vum/vo5drO+RPKfyvo3s5UytQZ20hYZkqmfsybtYEBlaS5kDmvkhJODz7Y7Thg0cdaGe
         jo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710773810; x=1711378610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVgpcRP8MLBq/WazqUdFYV0IEInnP4rHr8dpbkNJyf0=;
        b=PzOD2KdRqRIKPDAuqk5wrOJFJqZm3XYADKmnL22yz/D6zCRpM88xmEV20DURiwsSR+
         NGgiDbP8Mb/i2YULKpMin1m/+dE9Ren4DgJgNDlna/7yc+v992T2b30YKLt0Ob7oa/m8
         3H4PoH8n9B8dEdkFKJaVoQgQEmANYvHxU8TW38UPGxyJbPsWAUurHG3Uo/xIWLTN4n0j
         r4MCjgw7elcwyMEo69nCAwwPfSmOBoIhgL+V+g8OKl8I7Aowsk1epH/KUNSGcW4sjV/B
         c3hN1ad3nr0FeHx+ZLwEkcw3u48b/n9RA7qZRlkXrxc773ZRp1s2MfC3Q1p7w0AnO52Q
         g5lw==
X-Gm-Message-State: AOJu0YzwrlHoAQVye55S1/iBcVQwK/G9SgL5CbFoFWKj0cQPXhv9N9KQ
	eiMU4S3gDM4IiF/aJENDa3yKAbzOEAR448Tl7DYzrIXzvRafMbqIpPEqpkyc6OxzUi+1o07n2my
	taYrvaXlW+SF2OwxMUWCLKv6Z1Vb8ARAUD/Ruwg==
X-Google-Smtp-Source: AGHT+IEnA7F8oObBo9EpGKUoTWl7xIkFkkhBSRtsHPS/Q76RbIYXpSMTCDQr6RlLla2KELDBAn8BXlshzPylOc5iUTM=
X-Received: by 2002:a25:2689:0:b0:dcc:8d09:c7c4 with SMTP id
 m131-20020a252689000000b00dcc8d09c7c4mr10552640ybm.7.1710773809757; Mon, 18
 Mar 2024 07:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com> <20240301213231.10340-13-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240301213231.10340-13-laurent.pinchart@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 18 Mar 2024 14:56:33 +0000
Message-ID: <CAPY8ntAYbb8oBOww5yR+7u8UA-V=zemJMkZ7SWySH3C2bqmFMA@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] ARM: dts: bcm2711-rpi: Add pinctrl-based
 multiplexing for I2C0
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

Hi Laurent

On Fri, 1 Mar 2024 at 21:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>
> BCM2711-based Raspberry Pi boards (4B, CM4 and 400) multiplex the I2C0
> controller over two sets of pins, GPIO0+1 and GPIO44+45. The former is
> exposed on the 40-pin header, while the latter is used for the CSI and
> DSI connectors.

It's true for all Pis that I2C0 is exposed over 2 sets of gpios.
Seeing as we want to support cameras on Pi0-3, is there a reason not
to include the mux on those?

Looking back I had started this way back in [1] with all the variants.
I thought I'd posted the v2 follow up, but can't find it.
The original Pi 1 models A & B were the annoyances. The rev1 put the
camera on i2c1 GPIOs 2&3, with the rev2 on i2c0 with GPIOs 0&1.

Whilst it would be nice to have support for all platforms, this
doesn't stop us moving the mux into bcm283x-rpi.dtsi at a later date
to add support for the other devices.
I'm happy enough having the first step of getting Pi4 working, with
others being done later.

[1] https://linux-rpi-kernel.infradead.narkive.com/lmzYlT3c/rfc-arm-dts-add=
-i2cmux-pinctrl-config-to-raspberry-pi-i2c-0

> Add a pinctrl-based I2C bus multiplexer to bcm2711-rpi.dtsi to model
> this multiplexing. The two child buses are named i2c0_0 and i2c0_1.
>
> Note that if you modified the dts before to add devices to the i2c bus
> appearing on pins gpio0 + gpio1 (either directly in the dts or using an
> overlay), you have to put these into the i2c0_0 node introduced here
> now.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v3:
>
> - Split addition of the RTC to a separate patch
> - Move the mux to bcm2711-rpi.dtsi
> ---
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 31 +++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/=
dts/broadcom/bcm2711-rpi.dtsi
> index 86188eabeb24..826ed6efa9ff 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> @@ -17,6 +17,32 @@ aliases {
>                 pcie0 =3D &pcie0;
>                 blconfig =3D &blconfig;
>         };
> +
> +       i2c0mux: i2c0mux {
> +               compatible =3D "i2c-mux-pinctrl";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               i2c-parent =3D <&i2c0>;
> +
> +               pinctrl-names =3D "i2c0", "i2c0-vc";
> +               pinctrl-0 =3D <&i2c0_gpio0>;
> +               pinctrl-1 =3D <&i2c0_gpio44>;
> +
> +               status =3D "disabled";

Why defaulting to disabled?

The current mainline DT defaults to i2c0 being enabled on GPIOs 0&1
(done via bcm2835-rpi.dtsi).
If the mux is disabled, then this change has left i2c0 being enabled
but with no pinctrl property, so it's not connected to the outside
world.
GPIOs 44&45 have never had any other user, therefore claiming them for
the mux isn't a regression in my view.


As long as we can enable the other platforms later, and with the minor
caveat over being enabled or not:

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Minor point that CONFIG_I2C_MUX_PINCTRL appears not to be in the arm64
defconfig. I don't know what the policy is there, but there seem to be
many other SoCs throwing modules in there for their configurations.
It is in arm/multi_v7_defconfig.

  Dave

> +
> +               i2c0_0: i2c@0 {
> +                       reg =3D <0>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               i2c0_1: i2c@1 {
> +                       reg =3D <1>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +       };
>  };
>
>  &firmware {
> @@ -49,6 +75,11 @@ &hvs {
>         clocks =3D <&firmware_clocks 4>;
>  };
>
> +&i2c0 {
> +       /delete-property/ pinctrl-names;
> +       /delete-property/ pinctrl-0;
> +};
> +
>  &rmem {
>         /*
>          * RPi4's co-processor will copy the board's bootloader configura=
tion
> --
> Regards,
>
> Laurent Pinchart
>

