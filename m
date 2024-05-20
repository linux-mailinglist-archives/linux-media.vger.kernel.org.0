Return-Path: <linux-media+bounces-11664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB018CA289
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 21:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA8441C2102B
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 19:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A5C13956A;
	Mon, 20 May 2024 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="pVacRy8l"
X-Original-To: linux-media@vger.kernel.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F4137934;
	Mon, 20 May 2024 19:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716231904; cv=none; b=ALrLs41ra5FTESHzWIEnOipbIJ1tqbFctTiaksmMisrxFj06PNeCq8+HZJYCTh10F88Oj7JDVWYyDY5CYWby009VlAPfT+1DIeOmgVwN1dAugI8+yDRMx4Gf+QuAszRogDU1SmB0y2Gy+GdorZgh7oID8q87VWLr/svRSKM1goE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716231904; c=relaxed/simple;
	bh=Whkq+hKM/qmDNnBMj3dbzvPDG5j50Xp2GcuxKj7WaHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUZ+0yHUhkPA7BzqTVtJ8ioLK6Z0qcBsu4wcoO9oRFbDRNhC+75M8bw/i6cAZ45mdX3UgBYwC5H2tH7zTbmm+hnG/VJ5fEW5RIaQVrKcQz/NqWTtceVxdBP/6uDUyKaj1iQjcLA1JIKu+wIYyLU3vJAt7fm8AsG+tuOQQg1XkRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=pVacRy8l; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1716231898; bh=Whkq+hKM/qmDNnBMj3dbzvPDG5j50Xp2GcuxKj7WaHI=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=pVacRy8loO5jQ12YSQrnC47BXn66ePeAvKoHrFsTNZbUZuDE9I/8bc/37EdRZIQWN
	 YJSS60cvLymNAglX+885beRZOfcbFcd8IxTR0nbDIJBtt2kVkGu2XfCUnR8pgUXis6
	 ouo8co6qtt2wJAvS0kjSU1RuzrFrBuSb+cJmZbIE=
Date: Mon, 20 May 2024 21:04:58 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, git@luigi311.com, 
	linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, 
	phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 21/25] dt-bindings: media: imx258: Add binding for
 powerdown-gpio
Message-ID: <6egxnvqjz4z57bwd7jeubikfiew2myjo74hw3x6dimcdm6nuq3@qnk2tliwfxps>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, git@luigi311.com, 
	linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com, mchehab@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, 
	phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240501152442.1072627-1-git@luigi311.com>
 <20240501152442.1072627-22-git@luigi311.com>
 <ZkcV5xWZz2jCszxA@kekkonen.localdomain>
 <q5nbk3qcxsjsqp4mdyx5nlrn4oie6oynunwodm7r2nwtywc2ey@kxsgcatwt5b2>
 <CAPY8ntCfQvp9rCt=fqTFKYEOamLZwKmJDv9agxerQtDvsGKB0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntCfQvp9rCt=fqTFKYEOamLZwKmJDv9agxerQtDvsGKB0g@mail.gmail.com>

Hi Dave,

On Mon, May 20, 2024 at 02:20:28PM GMT, Dave Stevenson wrote:
> Hi Ondřej
>
> [...]
> 
> From v3 [1] Luis reported testing dropping the powerdown-gpio on a PPP
> and it working fine.
> 
> I linked to the IMX258 datasheet in the same thread[2], and that
> datasheet does not include such a signal on the imx258 sensor itself.
> 
> If your module has a powerdown gpio, then you'll have to ask the
> module vendor what it is actually connected to. Potentially it relates
> to the VCM driver rather than the sensor.

I've tested it in various ways (inverting the signal, etc.) and it doesn't
seem to do anything. So these patches related to powerdown-gpio can
be dropped.

Kind regards,
	o.

>   Dave
> 
> [1] https://www.spinics.net/lists/linux-media/msg252519.html
> [2] https://www.spinics.net/lists/linux-media/msg252496.html

