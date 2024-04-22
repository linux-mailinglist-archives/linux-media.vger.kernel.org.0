Return-Path: <linux-media+bounces-9872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 729408AD16C
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 18:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26BA82866CF
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 16:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65F6153588;
	Mon, 22 Apr 2024 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PI9qaAIT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885915350A;
	Mon, 22 Apr 2024 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713801722; cv=none; b=UGN9u4eXbDJtKxOegvq+GzLHgvm09XDb4HwDXhpHQ+b7LYM5HtuVkqqheC7kHvp9gf1iEUKEWb/F5jLJyaWlkNGvRFjobhCBJEUj0j6SJRxTMpb0wCf7qHBpBqNeBA28DUYKkr3UW54/IpiW+uMjyz90c8PX8/AnX0OQQ5C1NQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713801722; c=relaxed/simple;
	bh=91FicvYIrR1RsHJ614+Z8VedJiHK4XaLu6ElyB0aTc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpVubA/2/P7y1k/LA8hHeafGsso6ElUWtLm1HY7Taqj0JjuKSmGnLqCvAficqJAtFj51PQPI3wgVGKVoE9g34mxeSIouRitLII0p5lQnqWKsIs4gL46yODMdJeVjs3pLu7KK0sF94Wee+EgZ3KG91wP+ScvCDD79E29wq0jPxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PI9qaAIT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19040741;
	Mon, 22 Apr 2024 18:00:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713801658;
	bh=91FicvYIrR1RsHJ614+Z8VedJiHK4XaLu6ElyB0aTc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PI9qaAIT9XQDBcHXt3flL3c5pTnsCv1Gc9FbAJCc6hR2hT4qi45+oEmKJzthd5AWJ
	 BDEgwVoMUqUnboGncLNCxUr+cpqpyKAJ8Ap9KbObMmpWw7JMOA0sU3WjKyuIKavcw4
	 GVQyoZN2tCqnieg792WLoW8+wmCESmPtiTzhpNmU=
Date: Mon, 22 Apr 2024 19:01:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
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
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH v9 07/10] ARM: dts: bcm2711-rpi: Add pinctrl-based
 multiplexing for I2C0
Message-ID: <20240422160140.GB2438@pendragon.ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
 <20240402000424.4650-8-laurent.pinchart@ideasonboard.com>
 <a21e8f30-f644-4196-a445-f4e2968eac1d@notapiano>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a21e8f30-f644-4196-a445-f4e2968eac1d@notapiano>

Hi Nícolas,

On Mon, Apr 22, 2024 at 11:03:27AM -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Apr 02, 2024 at 03:04:14AM +0300, Laurent Pinchart wrote:
> [..]
> > +
> > +	i2c0mux: i2c-mux0 {
> > +		compatible = "i2c-mux-pinctrl";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		i2c-parent = <&i2c0>;
> > +
> > +		pinctrl-names = "i2c0", "i2c0-vc";
> > +		pinctrl-0 = <&i2c0_gpio0>;
> > +		pinctrl-1 = <&i2c0_gpio44>;
> > +
> > +		i2c0_0: i2c@0 {
> > +			reg = <0>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c0_1: i2c@1 {
> > +			reg = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +	};
> 
> Hi Laurent,
> 
> I noticed you added this new DT node that binds to a driver, but didn't enable
> the corresponding driver in the arm64 defconfig. We're running the DT kselftest
> in KernelCI which reports DT nodes that haven't bound to a driver and this node
> now shows up as a failure. Consider enabling the driver in the defconfig so we
> can continually validate that the driver correctly probes this device and we'll
> be able to report if it breaks in the future :).

Interesting, I wasn't aware of the requirement to enable in the
defconfig all drivers that are used by an upstream DT. I'll send a patch
to fix that.

> PS: I've included the full test output for this platform below if you'd like to
> check it out. There's one single other device that fails to probe,
> /soc/mailbox@7e00b840, though that needs CONFIG_BCM2835_VCHIQ, which is on
> staging, so I'm guessing not something we should be enabling in the defconfig.

Probably not. We're working on getting it out of staging, it should be
enabled then. I've CC'ed Umang for awareness.

> TAP version 13
> 1..1
> # timeout set to 45
> # selftests: dt: test_unprobed_devices.sh
> # TAP version 13
> # 1..69
> # ok 1 / # SKIP
> # ok 2 /arm-pmu
> # ok 3 /clk-108M # SKIP
> # ok 4 /clk-27M # SKIP
> # ok 5 /clocks/clk-osc # SKIP
> # ok 6 /clocks/clk-usb # SKIP
> # ok 7 /cpus/cpu@0 # SKIP
> # ok 8 /cpus/cpu@1 # SKIP
> # ok 9 /cpus/cpu@2 # SKIP
> # ok 10 /cpus/cpu@3 # SKIP
> # ok 11 /cpus/l2-cache0 # SKIP
> # ok 12 /emmc2bus
> # ok 13 /emmc2bus/mmc@7e340000
> # ok 14 /gpu
> # not ok 15 /i2c-mux0
> # ok 16 /leds
> # ok 17 /phy
> # ok 18 /regulator-cam1
> # ok 19 /regulator-sd-io-1v8
> # ok 20 /regulator-sd-vcc
> # ok 21 /reserved-memory/linux,cma # SKIP
> # ok 22 /reserved-memory/nvram@0
> # ok 23 /scb
> # ok 24 /scb/ethernet@7d580000
> # ok 25 /scb/ethernet@7d580000/mdio@e14
> # ok 26 /scb/gpu@7ec00000
> # ok 27 /scb/pcie@7d500000
> # ok 28 /soc
> # ok 29 /soc/aux@7e215000
> # ok 30 /soc/avs-monitor@7d5d2000 # SKIP
> # ok 31 /soc/avs-monitor@7d5d2000/thermal
> # ok 32 /soc/clock@7ef00000
> # ok 33 /soc/cprman@7e101000
> # ok 34 /soc/dma-controller@7e007000
> # ok 35 /soc/firmware
> # ok 36 /soc/firmware/clocks
> # ok 37 /soc/firmware/gpio
> # ok 38 /soc/firmware/reset
> # ok 39 /soc/gpio@7e200000
> # ok 40 /soc/hdmi@7ef00700
> # ok 41 /soc/hdmi@7ef05700
> # ok 42 /soc/hvs@7e400000
> # ok 43 /soc/i2c@7e205000
> # ok 44 /soc/i2c@7e804000
> # ok 45 /soc/i2c@7ef04500
> # ok 46 /soc/i2c@7ef09500
> # ok 47 /soc/interrupt-controller@40000000 # SKIP
> # ok 48 /soc/interrupt-controller@40041000 # SKIP
> # ok 49 /soc/interrupt-controller@7ef00100
> # not ok 50 /soc/mailbox@7e00b840
> # ok 51 /soc/mailbox@7e00b880
> # ok 52 /soc/mmc@7e300000
> # ok 53 /soc/mmc@7e300000/wifi@1 # SKIP
> # ok 54 /soc/pixelvalve@7e206000
> # ok 55 /soc/pixelvalve@7e207000
> # ok 56 /soc/pixelvalve@7e20a000
> # ok 57 /soc/pixelvalve@7e216000
> # ok 58 /soc/power
> # ok 59 /soc/pwm@7e20c800
> # ok 60 /soc/rng@7e104000
> # ok 61 /soc/serial@7e201000
> # ok 62 /soc/serial@7e201000/bluetooth
> # ok 63 /soc/serial@7e215040
> # ok 64 /soc/timer@7e003000 # SKIP
> # ok 65 /soc/txp@7e004000
> # ok 66 /soc/usb@7e980000
> # ok 67 /soc/watchdog@7e100000
> # ok 68 /timer # SKIP
> # ok 69 /wifi-pwrseq
> # # Totals: pass:50 fail:2 xfail:0 xpass:0 skip:17 error:0
> not ok 1 selftests: dt: test_unprobed_devices.sh # exit=1

-- 
Regards,

Laurent Pinchart

