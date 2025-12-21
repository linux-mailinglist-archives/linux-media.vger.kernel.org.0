Return-Path: <linux-media+bounces-49263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B9CD41B4
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 16:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BD8F300B92C
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 15:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144092FF143;
	Sun, 21 Dec 2025 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDT7bNDn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625471A9F82;
	Sun, 21 Dec 2025 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766329526; cv=none; b=I5sigFcV5pH78RBDT9XIGx4gGd362wsN2Qt7ZtbVos+9zDKrdvlNk6vmRkG9L6og9otmCIlbtDbd6Xoj3ne+PtOPu0RozfTYQysO+goHtK+hcEd3K08NE8XVpd9ZiGdVKwCO4AO1Nw1MGprrA4O5Zln5hALH8sDDcX2pgnKvcfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766329526; c=relaxed/simple;
	bh=a5rkjxtX7AuL/LxUauXAcT8aTJ80b2v9CZnwBWziTEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8jqQtNNRSg8wTvkhm4Ll5njY20MEv9iaXGw0mxi5XZt+e9wfsT3wYzNP9Pd0MEP6VC+BKMWtfTjHP/WwJvWb1peeqV0wAuYG9F1F1deu+1LzkARtnNhwxjWRmPv+wtge/qSsAuqv3m/Azhf7bGLEU4a3tQ2V5dqXOtJkYHrCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDT7bNDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C64C4CEFB;
	Sun, 21 Dec 2025 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766329525;
	bh=a5rkjxtX7AuL/LxUauXAcT8aTJ80b2v9CZnwBWziTEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDT7bNDn5tAOaA3ze7KWGoydGs7fNXb31BKe7rWZzUnD0QurneirLNcLmS2WGNzKk
	 7JF8BzWqae5jCEcSk558Dbn3hnWrSj3yZ+qsvczeXQUsKa1R/nQwxpP/YT4D6oBlh/
	 6QhQQz2ebRiWJNVfstOhWB6qhL3VfPVuVcoV6+p3FFAwDkzgp7jSBGvMZxkTpqvZy/
	 oHNwn6RwpWiY6wN/svU3ZQu2ZR0/TloKi+n3pPL3YxMLQySWPh1t8QgkweUI/Gvn6K
	 rSGqL51+YskqI/Cx4O7abH6tLOYjFc7lCR55A06SbBz6i8Suf3o22dK7c5zIWpcCRl
	 NymK8rbwhzzPw==
Date: Sun, 21 Dec 2025 16:05:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pavel@kernel.org, sakari.ailus@linux.intel.com, 
	mehdi.djait@linux.intel.com, laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
Message-ID: <20251221-platinum-mongoose-of-might-feec86@quoll>
References: <cover.1766123192.git.alex.t.tran@gmail.com>
 <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f34ec79ac21d5ab9ad3fafe34a0bf6aca49a10d.1766123192.git.alex.t.tran@gmail.com>

On Sat, Dec 20, 2025 at 02:03:24PM -0800, Alex Tran wrote:
> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
> new file mode 100644
> index 000000000000..68a8134df8fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/toshiba,et8ek8.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba et8ek8 5MP sensor
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +  - Sakari Ailus <sakari.ailus@iki.fi>
> +
> +description:
> +  Toshiba et8ek8 5MP sensor is an image sensor found in Nokia N900 device
> +
> +properties:
> +  compatible:
> +    const: toshiba,et8ek8
> +
> +  reg:
> +    description:
> +      I2C address (0x3e, or an alternative address)
> +    maxItems: 1
> +
> +  vana-supply:
> +    description:
> +      Analogue voltage supply (VANA), 2.8 volts
> +
> +  clocks:
> +    description:
> +      External clock to the sensor

If there is going to be new version: drop description, obvious.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
> +      is in hardware standby mode when the signal is in the low state.
> +    maxItems: 1
> +
> +  flash-leds:
> +    $ref: /schemas/media/video-interfaces.yaml#

This and...

> +
> +  lens-focus:
> +    $ref: /schemas/media/video-interfaces.yaml#

... this are weird. LEDs are not video interfaces, for sure. lens focus
shouldn't be video interface, either.

You also miss unevaluatedProps there.

This needs careful fixing/rewriting, with explanation in commit msg.


> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          remote-endpoint: true

Drop, pointless.


> +
> +required:
> +  - compatible
> +  - reg
> +  - vana-supply
> +  - clocks
> +  - reset-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@3e {
> +            compatible = "toshiba,et8ek8";
> +            reg = <0x3e>;
> +            vana-supply = <&vaux4>;
> +            clocks = <&isp 0>;
> +            assigned-clocks = <&isp 0>;
> +            assigned-clock-rates = <9600000>;
> +            reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                csi_cam1: endpoint {
> +                    remote-endpoint = <&csi_out1>;
> +                };

Please make the example complete - missing flash-leds and lens-focus. If
you provided them, you would see your binding is not correct.


Best regards,
Krzysztof


