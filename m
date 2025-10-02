Return-Path: <linux-media+bounces-43520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E3BB24D9
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 03:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357AD323591
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 01:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680B514A0BC;
	Thu,  2 Oct 2025 01:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1DyomqN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4AA59;
	Thu,  2 Oct 2025 01:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759370156; cv=none; b=gMjKJ4Lvw/vheJ5ptdGWcj69cWFfn4BXq4vcta5mvkFCvCWS12TMVfxza/Mw7Z5cdAZ7hnfMUUDE/W5jw9mLkh+b2o29WqUocQPp9558XbzWjEus+eCHWO94Ka+752Icr/AQnENSnA2IEPkDbmIyqLxnAiP5tnvTFjtX+YUz8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759370156; c=relaxed/simple;
	bh=ZN56j925KOx2NOWxUKPJw4pVZQ1QLf2h/f5H/p96b4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLtwYlnete2B824ZIAV+ZZ7mcSEvgriAclwyjXmEVCFasTE1QtWb92UDsePLOrFzmi2FL4/tPCbbZ4zcFA3RZTlIcFMcnPAqxbyLRZqMzRLwPcQEic4jkTgEpOtlnVO6VJgxtzCBoU60wjUgzzBHUgf5ZYlTtFurkC5TRVvjm3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1DyomqN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9DEC4CEF1;
	Thu,  2 Oct 2025 01:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759370156;
	bh=ZN56j925KOx2NOWxUKPJw4pVZQ1QLf2h/f5H/p96b4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1DyomqN1jZE0AeVjF46cebFyl49wbDDonzHFqL5z6TLrczrjCTt3ZxGvlFQzq6By
	 5uCmrphk/3wa3i32tydbZGpnraY8irEsYKbCdx4WXtF5jKO2TGRa72H+OASx+Up9nd
	 niAKTuSWJro8kyJ4g4BznHqBsAGhW4vi51j2uYkHMP/kc4+7d5h7IB/lEn6J7/mAnn
	 oaghXtLa0cDr40LVQy+Ikw+rvEUc5voPg6uCwUOa/VBmhWjIhbEsCpQv9ZQnD4tffG
	 Gi7DfkSbjLYpAlr+F9FA0f9nhHpQ3xyofcXvH32VE2XhZmjh2UNoZi4qQLESRJbapn
	 AsYpHgY0jtCVw==
Date: Wed, 1 Oct 2025 20:55:54 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: document Sony IMX111
 CMOS sensor
Message-ID: <20251002015554.GA2880078-robh@kernel.org>
References: <20250925152806.80386-1-clamor95@gmail.com>
 <20250925152806.80386-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925152806.80386-2-clamor95@gmail.com>

On Thu, Sep 25, 2025 at 06:28:05PM +0300, Svyatoslav Ryhel wrote:
> Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
> Optimus 4X (P880) and Optimus Vu (P895) smartphones.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx111.yaml       | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> new file mode 100644
> index 000000000000..a70017588891
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx111.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX111 8MP CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description:
> +  IMX111 sensor is a Sony CMOS active pixel digital image sensor with an active
> +  array size of 2464H x 3280V. It is programmable through I2C interface. Image
> +  data is sent through MIPI CSI-2, through 1 or 2 lanes.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx111
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: EXTCLK with possible frequency from 6 to 54 MHz
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  iovdd-supply:
> +    description: Digital IO power supply (1.8V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.2V)
> +
> +  avdd-supply:
> +    description: Analog power supply (2.7V)
> +
> +  port:
> +    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes: true
> +          bus-type: true

I assume not *bus* types are supported, so this should constrain it to 
valid ones. If it is only 1 type, you shouldn't really need the type in 
DT.

Rob


