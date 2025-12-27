Return-Path: <linux-media+bounces-49589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836ECDF890
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 12:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C876430111AB
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0053D2F361B;
	Sat, 27 Dec 2025 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b1Gzj6JW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747AAB665;
	Sat, 27 Dec 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766833946; cv=none; b=tykE1wELgZiNwKWD6jcwDj7PprG3dW14JTzbtM/uCSg7BMqdyFaYqUCqxHuJvdp4Vo2aRJNqkqFxqi+x86CIbjD4HAgB8jUH02mj2gA7uLcG7oQl7XuxSyDlAJAa1tO8FdEUI6VaFvuGO8ainWDiNgdAD/7gvxn5iJxPkfAf/xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766833946; c=relaxed/simple;
	bh=a/qD89sjTFhKU17Y1Bja5fweNzEn4WGn8snkyMT/rXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8zNC0MRXXzzX0UueCItWmFACWjkwZbuy8bUj+wa0KB5FiEQZrm4S19FZT5Dc0X2dOiBWiq7WYXoVHdo990k8eDpGLiSsUcxXdO1oyOKeQA5RhlQXyKhDGd0byiXjUawLep806aASRizN3RnFTV/w0S4F+1yrFf2KM526Oil4+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b1Gzj6JW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C1CE9BB;
	Sat, 27 Dec 2025 12:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766833929;
	bh=a/qD89sjTFhKU17Y1Bja5fweNzEn4WGn8snkyMT/rXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1Gzj6JWQI8NY5zMBmM1wSD1QUgAtrRInhdVvdUimt/F+BJRPFg/VQXLZg25LO9DJ
	 9/NMMxWv6E4yvE4Vj+V3oW6Hukpty2a5i68VrX85+YTbSwDwLF18lAxy2Nk8+GffuF
	 lBJJjty8zvTjlyEuOim//zJ6dlKiXxSWhoSyIJ5I=
Date: Sat, 27 Dec 2025 13:12:06 +0200
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
Message-ID: <20251227111206.GF4094@pendragon.ideasonboard.com>
References: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
 <20251224-dt-bindings-et8ek8-omap3isp-v2-1-0728cc1fee27@gmail.com>
 <a7126a74-48f2-467b-91bb-21f28a251400@kernel.org>
 <CA+hkOd4rJAyQPe1kgJYreGX+Wpi+EoX8s-CsD_JCP77WE5a=Mw@mail.gmail.com>
 <ec9a2f6a-4cad-4989-8d40-af7b718a164b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec9a2f6a-4cad-4989-8d40-af7b718a164b@kernel.org>

Hi Krzysztof,

On Thu, Dec 25, 2025 at 10:08:47AM +0100, Krzysztof Kozlowski wrote:
> On 25/12/2025 09:57, Alex Tran wrote:
> > On Thu, Dec 25, 2025 at 12:40 AM Krzysztof Kozlowski wrote:
> >> On 24/12/2025 22:59, Alex Tran wrote:
> >>> +
> >>> +  reset-gpios:
> >>> +    description:
> >>> +      XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
> >>> +      is in hardware standby mode when the signal is in the low state.
> >>> +    maxItems: 1
> >>> +
> >>> +  flash-leds: true
> >>> +  lens-focus: true
> >>
> >> No, where did you find this syntax. I do not see how you carefully fixed
> >> it. You need proper schema for these.
> >>
> >> Best regards,
> >> Krzysztof
> > 
> > I saw it used under sony,imx214.yaml and mipi-ccs.yaml. I thought referencing
> > video-interface-devices.yaml in this schema was correct because the flash-leds
> > and lens-focus properties are both specified in that file.
> 
> Ah, so you wanted to reference video-inteface-devices in top-level?
> Wasn't this already before? If that was missing then that's another
> thing to fix.
> 
> And then you need to use unevaluatedProperties: false. flash-leds needs
> constraints, number of items. lens-focus you simply remove.

I do have a preference in general for keeping 'additionalProperties:
false' and listing

  lens-focus: true

(with a reference to /schemas/media/video-interface-devices.yaml at the
top level of course).

The reason is that using 'unevaluatedProperties: false' will make all
the properties defined in video-interface-devices.yaml valid, even the
ones that don't apply to this device. This being said, most of the other
properties defined by video-interface-devices.yaml are applicable to
this device (the exceptions being 'leds' and 'led-names'), so I won't
fight for this in this specific case, even if I think it's better as a
general rule.

Regarding flash-leds, none of the existing bindings set a constraint on
the number of items. I'm not sure there are use cases for more than two,
but the number of flash LEDs is not an intrinsic properties of the image
sensor. I think listing

  flash-leds: true

is correct. Sakari may have more information.

-- 
Regards,

Laurent Pinchart

