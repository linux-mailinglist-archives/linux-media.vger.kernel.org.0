Return-Path: <linux-media+bounces-45112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C165BF551D
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 44E2135089A
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 08:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF26320390;
	Tue, 21 Oct 2025 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="uRN1/4/r"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62F291C13;
	Tue, 21 Oct 2025 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036210; cv=pass; b=hYo+BnPguTmeXVzAeKAqF8ywpxzBzX33650KgBCP88vwz9SkhBkAVR9J2+1Qy+ZqrM76UMX8PxAfy9aWjbslIs0cLKoNGsJCQg2kNfWJ+akqNJE61kCgtXO2M2MyaYe5CDcIW1rK038WPkkyHA3WnNoDSqUcL2QaWQd2Jmy8FTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036210; c=relaxed/simple;
	bh=QNnCBOcY3yHr19UPu3nZg7aYzp3w9guPQWqSaxqQ3l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1nvJa51VkkUGv49ONMieX1b64vpCZD0GN8cQnA+Y4MOEjRnmQ7a4a+cKLAr+spjdoUyrPTvxMffFQPhAgwOavCAgMlkkkHKXivO+bCAF3gAc1CDapXx6FyuImWL913F6dWhqq17GyGtqVLMijinluHcwn38ytEgSWanNRL0BIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=uRN1/4/r; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4crQmn2H8Dz49PvY;
	Tue, 21 Oct 2025 11:43:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761036201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JyUGRQ6PJ1u2Lm1BLA85pJa1fVlOswvc3tUZzsrCrdg=;
	b=uRN1/4/rGbbNYgdk2xKnZYZA7mcA4+7atkPJgSc1Wog6ZV5fbnOB7YjCo+cHd/MLQV2Usl
	U3smYEFr8gsnU4z4Cbvo+U7oLR47YYu8tlgbVSHYEOnr+YUOW8vjpu9/f5R4rScV3Ld965
	12v3Q46Py9nZx+iUn/pSqcUTthx73KeVuw9x41eccEVzd2Rwao3O9I82qklA/vNyUWCnTI
	BiJqkq7bol51sugtl4YVRoaORXw8z8LUl7qHMv8pfWwuxV36wMnCGz43vJYWXVwOwxPKbL
	6CyLARtxUfVh8bJNb2/+O0sZcVxt6RYT5XDpo+NvNdILcsgSm9itd0vTMI1SIg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761036201; a=rsa-sha256;
	cv=none;
	b=iIph07gtLHPqINNfeZGDQZfYhC1XYF4a8OVJ488t1pef7vpCbWqxKz/cSZpT48EGB90PqM
	rNRI8ZVBwG6NqyO+j8j0bDcs2NiRAPqxYAcQYD2gCogwVYdYzMXgUWBLGuxur5GzY6xQaP
	BXhdKIM7SUJ2qARVEw7ls4v7Ohw15S67yBT5qBh9/IvmYxnOF8+rryT+xMKaAZhTT3q4SN
	ECLphayXZJPmDQN+XmbhMO8WRW5ad1BWG6tGebCIYLPW/XGNCbJB/Ewn4w/EbqQxB9Ygjp
	G83CXq8ER5zKynn7K2gxlLO1DrQRdsF3nB4BuVkCbbXUJDHc6v7DqxX0xcGjFg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761036201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JyUGRQ6PJ1u2Lm1BLA85pJa1fVlOswvc3tUZzsrCrdg=;
	b=I4H/OSphBn5ICfI4SkGBg/37ZrU31t8CKZbnPpQByqm8vaDSWQXb9fVoDYjL3heuFHKHyE
	3DOv232zwYqknNUVNx+2FMf4zxBu1H8Ulc4x6g7sZ0qrMb7nn3bAF+GefCBIIhqt6tegP+
	7Oin7MWqWQZ/ZAS/S42fEMggsC6sGytPJqMI/Fl/LywSb9YwaQATZogdxcHm08/itSBlcR
	ELaF543Y3FOM9FT1VQbeW4NEHd8+HVHSqsiNyZZny+I5iUVHx1egW56gtM2bvBhhAPRTik
	RcwdM9NjOyEBhsZNXQXD3p/etB6p3/TwMeowOW3syIC+wn8WXDzLH+DoSv5hqw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C42C7634C50;
	Tue, 21 Oct 2025 11:43:20 +0300 (EEST)
Date: Tue, 21 Oct 2025 11:43:20 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	"open list:OV2659 OMNIVISION SENSOR DRIVER" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] media: dt-bindings: move ovti,ov2659.txt into
 ovti,ov8858.yaml
Message-ID: <aPdHqCWNdmVkch7S@valkosipuli.retiisi.eu>
References: <20250912183003.1115957-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912183003.1115957-1-Frank.Li@nxp.com>

Hi Frank,

Thanks for the patch.

On Fri, Sep 12, 2025 at 02:30:02PM -0400, Frank Li wrote:
> The properties in ovti,ov2659.txt are the same as ovti,ov8858. So move it
> to this yaml file.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/i2c/ovti,ov2659.txt        | 47 -------------------
>  .../bindings/media/i2c/ovti,ov8858.yaml       |  4 +-
>  2 files changed, 3 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> deleted file mode 100644
> index 92989a619f292..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -* OV2659 1/5-Inch 2Mp SOC Camera
> -
> -The Omnivision OV2659 is a 1/5-inch SOC camera, with an active array size of
> -1632H x 1212V. It is programmable through a SCCB. The OV2659 sensor supports
> -multiple resolutions output, such as UXGA, SVGA, 720p. It also can support
> -YUV422, RGB565/555 or raw RGB output formats.

I don't object merging this with the ov8858 bindings as such but the
differences between the sensors should be taken into account. Something
like the text above should be added to those bindings, which now describe
the ov8858 only. Also, the number of lanes is probably different between
the two.

What about the regulators? The ov2659 doesn't control any right now, but
that's probably an oversight (and whatever regulators connected on the
platform used were hard-wired).

Overall, it might be easier to keep the two bindings separate rather than
have some number of ifs in the bindings.

You can drop clock-names as there's just a single clock (the same goes for
the driver naturally).

> -
> -Required Properties:
> -- compatible: Must be "ovti,ov2659"
> -- reg: I2C slave address
> -- clocks: reference to the xvclk input clock.
> -- clock-names: should be "xvclk".
> -- link-frequencies: target pixel clock frequency.
> -
> -Optional Properties:
> -- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
> -  Active high with internal pull down resistor.
> -- reset-gpios: reference to the GPIO connected to the resetb pin, if any.
> -  Active low with internal pull up resistor.
> -
> -For further reading on port node refer to
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> -
> -Example:
> -
> -	i2c0@1c22000 {
> -		...
> -		...
> -		 ov2659@30 {
> -			compatible = "ovti,ov2659";
> -			reg = <0x30>;
> -
> -			clocks = <&clk_ov2659 0>;
> -			clock-names = "xvclk";
> -
> -			powerdown-gpios = <&gpio6 14 GPIO_ACTIVE_HIGH>;
> -			reset-gpios = <&gpio6 15 GPIO_ACTIVE_LOW>;
> -
> -			port {
> -				ov2659_0: endpoint {
> -					remote-endpoint = <&vpfe_ep>;
> -					link-frequencies = /bits/ 64 <70000000>;
> -				};
> -			};
> -		};
> -		...
> -	};
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> index 491f2931e6bcd..d7059dbee7fca 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
> @@ -19,7 +19,9 @@ $ref: /schemas/media/video-interface-devices.yaml#
>  
>  properties:
>    compatible:
> -    const: ovti,ov8858
> +    enum:
> +      - ovti,ov2659
> +      - ovti,ov8858
>  
>    reg:
>      maxItems: 1

-- 
Kind regards,

Sakari Ailus

