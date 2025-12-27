Return-Path: <linux-media+bounces-49594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661BCDF915
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD00300987C
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBB431329C;
	Sat, 27 Dec 2025 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kc+ZTZzR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40453313528;
	Sat, 27 Dec 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766835278; cv=none; b=MHwdGuEGm4OeVo06MvF+aAz1CzRXtxxHdIxxAUaWrfS49HKAbhm7zjPkqoedXH8d04euIalxvErSCx9zCM8OVQCHRJbiwAYbBCR1itnIk1DvSyfFQG88RzpiQIEHNPck7NRFbT72CqIxmVyLTgZh+kbPF+Wx0SkzojigT+aYvp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766835278; c=relaxed/simple;
	bh=abUMk4mPKoPze0G6t+dbbfJOlOkacnwaohQIklcc30Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogJWeR7GIMSEYwre6p9pe+0k+jnQQrIia3yo54DDU443acuOJ4OSXLNB6bVA4ciiscWDEUEV8QvlJukQ7aq/a5NzpBpX7AedzrWe0WhnOJQkO29DrGb1MXuqvOWX6b/sudTSdhF8odF8v6+oV1XXuifvgjj6dSHJKCuwh2CXD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kc+ZTZzR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7C857BB;
	Sat, 27 Dec 2025 12:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766835260;
	bh=abUMk4mPKoPze0G6t+dbbfJOlOkacnwaohQIklcc30Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kc+ZTZzR1f7KIuzA+YNIQigilJ8kwIIXpqwPNW9/0sE3XTiZy31/Tvv0+RY683IV5
	 6bq00LZUgjW9bz6rHQoWvuOY4kdBaK5TjJ7StJaGBZKyhQnGPH35VOFt+5USajmL7j
	 Yh2Gv/Rg71N2rDPQWGLDWmevFnovUO+4O4o5N+pU=
Date: Sat, 27 Dec 2025 13:34:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alex Tran <alex.t.tran@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
Message-ID: <20251227113417.GI4094@pendragon.ideasonboard.com>
References: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
 <20251224-dt-bindings-et8ek8-omap3isp-v2-1-0728cc1fee27@gmail.com>
 <a7126a74-48f2-467b-91bb-21f28a251400@kernel.org>
 <CA+hkOd4rJAyQPe1kgJYreGX+Wpi+EoX8s-CsD_JCP77WE5a=Mw@mail.gmail.com>
 <ec9a2f6a-4cad-4989-8d40-af7b718a164b@kernel.org>
 <20251227111206.GF4094@pendragon.ideasonboard.com>
 <b1637433-6bbf-4e08-8f58-0e9bad37b790@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b1637433-6bbf-4e08-8f58-0e9bad37b790@kernel.org>

On Sat, Dec 27, 2025 at 12:23:15PM +0100, Krzysztof Kozlowski wrote:
> On 27/12/2025 12:12, Laurent Pinchart wrote:
> > Regarding flash-leds, none of the existing bindings set a constraint on
> > the number of items. I'm not sure there are use cases for more than two,
> > but the number of flash LEDs is not an intrinsic properties of the image
> > sensor. I think listing
> > 
> >   flash-leds: true
> > 
> > is correct. Sakari may have more information.
> 
> IOW, that's not a pin going from the sensor to the LED but rather final
> board/system design? And same sensor could be used that way with
> arbitrary number of LEDs?

Yes, those are LEDs typically controlled by a GPIO of the SoC, not LEDs
tied to a pin of the sensor. No LED, one LED or two LEDs are the most
common cases (the second LED would typically be an indicator LED, to
indicate when the camera is active), but a system could use more than
two at least in theory.

-- 
Regards,

Laurent Pinchart

