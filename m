Return-Path: <linux-media+bounces-30988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF37A9C024
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5455A0239
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC81231A57;
	Fri, 25 Apr 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXfg3GjU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD81DED49;
	Fri, 25 Apr 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745567599; cv=none; b=hcHGl4Tvq1HKzr5j+MNGHMY8EY53tWEmM5OoiDBTyMKXc5BVi9F/77k/U1Zj/2jggR2UXo57+hJM+/U/3364BbsN2Vnci7h/J5io89gS+N1/ljCip3HLWX7yFPpDO+oj0P0hTVTqR9A4o/ymYMt3tNZwqyDXS+oRP/WY3JHJR6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745567599; c=relaxed/simple;
	bh=l7QOCZ0FTnoIqL3IAQHuGX5QYfEofoNQVC+kGrb1dgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGWqT06sxJDakg2RLHoLoa/0yAAdQ6crNIfaWtHfEsTibVMRFMavaXOmJdK+NjAE1J2dKlIreb4mfbg572ru0NPhkbDzQCdal2+YYYNmuslcSzkQntwzoykSEpUNgfcZFhrmYFdkojpmjYjTqVSGfj54Gcd+7eILYDIbYTkJWsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXfg3GjU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4B5C4CEE4;
	Fri, 25 Apr 2025 07:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745567598;
	bh=l7QOCZ0FTnoIqL3IAQHuGX5QYfEofoNQVC+kGrb1dgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXfg3GjUm7kkZfv8Nxu1cZ9PYuvcY6KsHEhTIRLFRjp7ETT8W36C+dTDaDYD9B8P9
	 yTemlV9QT1ft3U54N7PjlxSWMO2rFIpJ/UWN+py/hn6l+S3VCocOtmtjB6hewdx+Vc
	 cfVluke3ktbeNnxgQONgIvR2FTqkmCbMViCy+yXQbFxwniYRDz851EFVVRemp0fdpX
	 ugUbleXaD7Iyg1Fmj4E+hpnplHTr3OWTy07drUZyj83FIbQg5GUUTtk+40UKpPqrDQ
	 FQLbos2Qhs55L0CdiDgehyRYijsvZTeJt+IkoRphDOEodi8zfRxCm7qp9xxakzG07Z
	 w82gJSuIC5O9A==
Date: Fri, 25 Apr 2025 09:53:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
Message-ID: <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com>

On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> Adds a binding for the HEVC decoder found on th +maintainers:
> +  - John Cox <john.cox@raspberrypi.com>
> +  - Dom Cobley <dom@raspberrypi.com>
> +  - Dave Stevenson <dave.stevenson@raspberrypi.com>

> +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>

Drop, no mailing lists in bindings maintainers. These must be people.

> +
> +description:
> +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> +  boards respectively.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - brcm,bcm2711-hevc-dec
> +          - brcm,bcm2712-hevc-dec
> +      - const: raspberrypi,hevc-dec

Not what Rob asked. You should use specific SoC compatible as fallback.

You referred to file "raspberrypi,pisbe.yaml" before, but there is no
such file in the next.

Before you reply that there is a binding using different rules: well,
there is always poor code. Above two comments are repeated, especially
this about specific compatible - all the time, so these are not new
rules. These are given in reviews since some years.

Best regards,
Krzysztof


