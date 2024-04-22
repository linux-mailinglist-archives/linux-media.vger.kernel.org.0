Return-Path: <linux-media+bounces-9874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C87D8AD33F
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 19:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBFE1C21533
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 17:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69639153BE7;
	Mon, 22 Apr 2024 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G0c1q1Mj"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC82153BC6;
	Mon, 22 Apr 2024 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713806468; cv=none; b=hoUva+Sfr5lM94BJ4GUuKB2TRteS+v1aEWW9UaVeqNvgmBnSg8j49+X/caJHS01StyfOkW3F/q+2RBTWaMAEdDN+VnK87dHNUV5B7kOyhmlAPZJJKvb5gMXzlNnjJCaCxgtxiwL3X9aKr8stg9+kcpHDwpksb8NpDmRr+eOW3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713806468; c=relaxed/simple;
	bh=qgqSpsSQ6i9LStU3ApBLA/aCwEQLIznNK7QqnsGhiKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8ZMJXb8JgHfhMwL7m23gDm7qKbtes+/BuaEJenc6yUCBsALiBl2gkTGT05XdlajGTLSZ6T4wT5ks5m+mq2QMTj5ZLZ7P4jVa8IUQI9PfOgUfBNpLsdN+Tvb4d8Dgf5Ile42MJ1VcINGa1qhekOwzG01EnmZb3ZYyIb925u2gok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G0c1q1Mj; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713806465;
	bh=qgqSpsSQ6i9LStU3ApBLA/aCwEQLIznNK7QqnsGhiKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0c1q1MjVpdxEukvNuXnG2SUWKZtDFdixPSJme1WvAakT5hrd2mzkr5c0JqFEOqaJ
	 xxESYS9tDy4oKw4pPN5yt/+9VdSAUFBMRniW2LcQrb+I78PkIRdXCBVkRG7X4lV45l
	 r7roGnwAYzLUDoogyK/XknRWBbFrpmsyImEj+3SO2kKXgEmdRYRTFHBZhgXe/UY1N1
	 Nv4kDI+M4vNx1VSm8y5n+Iz7p8QnE40++NHuIFg4Q/Xljb0fmvuhUc+KwUGSs072dq
	 eE6YvX3uOKA4HIXFDPsyn/3M5/jS6IZbcqvdmpbolLMNqRCYjGovhGSTVacxDdxk0B
	 ouRAPIqgTj1Mw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 808B33782134;
	Mon, 22 Apr 2024 17:21:02 +0000 (UTC)
Date: Mon, 22 Apr 2024 13:21:00 -0400
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
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH v9 07/10] ARM: dts: bcm2711-rpi: Add pinctrl-based
 multiplexing for I2C0
Message-ID: <961b3d43-b4c9-4573-82d7-844aa129d994@notapiano>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
 <20240402000424.4650-8-laurent.pinchart@ideasonboard.com>
 <a21e8f30-f644-4196-a445-f4e2968eac1d@notapiano>
 <20240422160140.GB2438@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422160140.GB2438@pendragon.ideasonboard.com>

On Mon, Apr 22, 2024 at 07:01:40PM +0300, Laurent Pinchart wrote:
> Hi Nícolas,
> 
> On Mon, Apr 22, 2024 at 11:03:27AM -0400, Nícolas F. R. A. Prado wrote:
> > On Tue, Apr 02, 2024 at 03:04:14AM +0300, Laurent Pinchart wrote:
> > [..]
> > > +
> > > +	i2c0mux: i2c-mux0 {
> > > +		compatible = "i2c-mux-pinctrl";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		i2c-parent = <&i2c0>;
> > > +
> > > +		pinctrl-names = "i2c0", "i2c0-vc";
> > > +		pinctrl-0 = <&i2c0_gpio0>;
> > > +		pinctrl-1 = <&i2c0_gpio44>;
> > > +
> > > +		i2c0_0: i2c@0 {
> > > +			reg = <0>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +		};
> > > +
> > > +		i2c0_1: i2c@1 {
> > > +			reg = <1>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +		};
> > > +	};
> > 
> > Hi Laurent,
> > 
> > I noticed you added this new DT node that binds to a driver, but didn't enable
> > the corresponding driver in the arm64 defconfig. We're running the DT kselftest
> > in KernelCI which reports DT nodes that haven't bound to a driver and this node
> > now shows up as a failure. Consider enabling the driver in the defconfig so we
> > can continually validate that the driver correctly probes this device and we'll
> > be able to report if it breaks in the future :).
> 
> Interesting, I wasn't aware of the requirement to enable in the
> defconfig all drivers that are used by an upstream DT. I'll send a patch
> to fix that.

Oh no, this isn't a requirement at all. I'm just pointing out that by doing it
you enable more testing to get done on the platform automatically, which I
thought you'd appreciate (and we do too!). So yes, please add it to the
defconfig if you'd like to have the driver probe tested in KernelCI and thank
you.

> 
> > PS: I've included the full test output for this platform below if you'd like to
> > check it out. There's one single other device that fails to probe,
> > /soc/mailbox@7e00b840, though that needs CONFIG_BCM2835_VCHIQ, which is on
> > staging, so I'm guessing not something we should be enabling in the defconfig.
> 
> Probably not. We're working on getting it out of staging, it should be
> enabled then. I've CC'ed Umang for awareness.

That's good to hear, thank you for the information!

Thanks,
Nícolas

