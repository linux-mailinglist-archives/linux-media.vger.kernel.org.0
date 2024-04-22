Return-Path: <linux-media+bounces-9869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F22F58AD023
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 17:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43049B23B79
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 15:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC6F15252C;
	Mon, 22 Apr 2024 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="tAnB9/d9"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6366152505;
	Mon, 22 Apr 2024 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713798217; cv=none; b=bMRZm814oERwidI0fMaPWdtWlrez4Uo1gPFAGz5KbJc/CuZYyEYeKq9AFwHgBeEpOzvU8RjtTbz7v2fi6CZRfcfvmzHR42sMOBBEgD2DizSBPTxTQdg+qBbMoTCVR79fU4tfc+C5UzVi2vtiDGW5PJp1ywXx8LsVRAvhK9EqnrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713798217; c=relaxed/simple;
	bh=K1c2J2jmo6umVK5HW0tWaNBNJhKzdLGZgNU2VMJH8bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGQBtvucrJyiiiUdqlp/OfCEzsmtLwWvjbxLBQ4NBCgvBhm3UUBM8S85sdPOoLMAKeNm9kpnQyT6HDN+01OfjWEUQlKXW+tGnVUzoB18OYo+n/0oW5AIDUF7vV/bk9py5ZO1P/xeRRMIpMnc6uAQxIMXhoPyk0472uLZeSxn1pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=tAnB9/d9; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713798213;
	bh=K1c2J2jmo6umVK5HW0tWaNBNJhKzdLGZgNU2VMJH8bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tAnB9/d92phCLscFKn6v8HppPH56kzhSHvWO8X4hJ2jnNMllXUz4w+AfCBK/DD7OU
	 coFDiRV4tSTggJS/eRqahBz+t7236i36TCbSAURlrlzNVneSjgq1saasp36AafX3B9
	 hfwEhJchc93CU9Se85IVWvDMy5Cf+jwjMTyiBBGLS4I6WT7Q5a9+epUlbxhO0ZDTD7
	 zmXd0/2/Yy8BuLSw22RHY9S8uwPuf1C6EB7C7nDqOGtYk4EMptA+qf2c/pjlYpvIKT
	 HiloKrwV10oj85lfOi9bQHYKcvSmFpz/FbzlRX5Mm3nPC9mlVEc/R9/snvHpm6ZEh9
	 nEZM8ikaFO5Cw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE93B3782123;
	Mon, 22 Apr 2024 15:03:29 +0000 (UTC)
Date: Mon, 22 Apr 2024 11:03:27 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 07/10] ARM: dts: bcm2711-rpi: Add pinctrl-based
 multiplexing for I2C0
Message-ID: <a21e8f30-f644-4196-a445-f4e2968eac1d@notapiano>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
 <20240402000424.4650-8-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402000424.4650-8-laurent.pinchart@ideasonboard.com>

On Tue, Apr 02, 2024 at 03:04:14AM +0300, Laurent Pinchart wrote:
[..]
> +
> +	i2c0mux: i2c-mux0 {
> +		compatible = "i2c-mux-pinctrl";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c-parent = <&i2c0>;
> +
> +		pinctrl-names = "i2c0", "i2c0-vc";
> +		pinctrl-0 = <&i2c0_gpio0>;
> +		pinctrl-1 = <&i2c0_gpio44>;
> +
> +		i2c0_0: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c0_1: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};

Hi Laurent,

I noticed you added this new DT node that binds to a driver, but didn't enable
the corresponding driver in the arm64 defconfig. We're running the DT kselftest
in KernelCI which reports DT nodes that haven't bound to a driver and this node
now shows up as a failure. Consider enabling the driver in the defconfig so we
can continually validate that the driver correctly probes this device and we'll
be able to report if it breaks in the future :).

Thanks,
Nícolas

PS: I've included the full test output for this platform below if you'd like to
check it out. There's one single other device that fails to probe,
/soc/mailbox@7e00b840, though that needs CONFIG_BCM2835_VCHIQ, which is on
staging, so I'm guessing not something we should be enabling in the defconfig.


TAP version 13
1..1
# timeout set to 45
# selftests: dt: test_unprobed_devices.sh
# TAP version 13
# 1..69
# ok 1 / # SKIP
# ok 2 /arm-pmu
# ok 3 /clk-108M # SKIP
# ok 4 /clk-27M # SKIP
# ok 5 /clocks/clk-osc # SKIP
# ok 6 /clocks/clk-usb # SKIP
# ok 7 /cpus/cpu@0 # SKIP
# ok 8 /cpus/cpu@1 # SKIP
# ok 9 /cpus/cpu@2 # SKIP
# ok 10 /cpus/cpu@3 # SKIP
# ok 11 /cpus/l2-cache0 # SKIP
# ok 12 /emmc2bus
# ok 13 /emmc2bus/mmc@7e340000
# ok 14 /gpu
# not ok 15 /i2c-mux0
# ok 16 /leds
# ok 17 /phy
# ok 18 /regulator-cam1
# ok 19 /regulator-sd-io-1v8
# ok 20 /regulator-sd-vcc
# ok 21 /reserved-memory/linux,cma # SKIP
# ok 22 /reserved-memory/nvram@0
# ok 23 /scb
# ok 24 /scb/ethernet@7d580000
# ok 25 /scb/ethernet@7d580000/mdio@e14
# ok 26 /scb/gpu@7ec00000
# ok 27 /scb/pcie@7d500000
# ok 28 /soc
# ok 29 /soc/aux@7e215000
# ok 30 /soc/avs-monitor@7d5d2000 # SKIP
# ok 31 /soc/avs-monitor@7d5d2000/thermal
# ok 32 /soc/clock@7ef00000
# ok 33 /soc/cprman@7e101000
# ok 34 /soc/dma-controller@7e007000
# ok 35 /soc/firmware
# ok 36 /soc/firmware/clocks
# ok 37 /soc/firmware/gpio
# ok 38 /soc/firmware/reset
# ok 39 /soc/gpio@7e200000
# ok 40 /soc/hdmi@7ef00700
# ok 41 /soc/hdmi@7ef05700
# ok 42 /soc/hvs@7e400000
# ok 43 /soc/i2c@7e205000
# ok 44 /soc/i2c@7e804000
# ok 45 /soc/i2c@7ef04500
# ok 46 /soc/i2c@7ef09500
# ok 47 /soc/interrupt-controller@40000000 # SKIP
# ok 48 /soc/interrupt-controller@40041000 # SKIP
# ok 49 /soc/interrupt-controller@7ef00100
# not ok 50 /soc/mailbox@7e00b840
# ok 51 /soc/mailbox@7e00b880
# ok 52 /soc/mmc@7e300000
# ok 53 /soc/mmc@7e300000/wifi@1 # SKIP
# ok 54 /soc/pixelvalve@7e206000
# ok 55 /soc/pixelvalve@7e207000
# ok 56 /soc/pixelvalve@7e20a000
# ok 57 /soc/pixelvalve@7e216000
# ok 58 /soc/power
# ok 59 /soc/pwm@7e20c800
# ok 60 /soc/rng@7e104000
# ok 61 /soc/serial@7e201000
# ok 62 /soc/serial@7e201000/bluetooth
# ok 63 /soc/serial@7e215040
# ok 64 /soc/timer@7e003000 # SKIP
# ok 65 /soc/txp@7e004000
# ok 66 /soc/usb@7e980000
# ok 67 /soc/watchdog@7e100000
# ok 68 /timer # SKIP
# ok 69 /wifi-pwrseq
# # Totals: pass:50 fail:2 xfail:0 xpass:0 skip:17 error:0
not ok 1 selftests: dt: test_unprobed_devices.sh # exit=1

