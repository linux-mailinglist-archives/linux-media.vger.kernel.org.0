Return-Path: <linux-media+bounces-41282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3768EB3AA1C
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 20:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5D7561B41
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C04279903;
	Thu, 28 Aug 2025 18:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWUAZ8QG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC668276046
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 18:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756406182; cv=none; b=iXYB7UlCIml+wwM1viUC/T3t6gSrHrNAora1cfqYQBfDoGXt9iaFsjO4Lg1QrkYZP4QLKtHcgH6ZRtBLTNGNr/A1t+EFurO7Se5Co+VE4bAM+oQxVtAbbVG5TQv2YnEnf8PqAGTIunkOgh9aDRGUoEqUEdcH7EVRpFNVsyJIWKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756406182; c=relaxed/simple;
	bh=KnS0W5Hh+l57/+HU4seoQni4gqN4R0ph3BTOOgn9K5U=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=D1nGlyugktBxu3DrzQa+H0rE5RguDlOVj/SKpCbTSwz5vlUhmSw3RWbhC5EJblnMuqXeYB3yPkQEu6oBQwQ5KYW2WlwzsWPCkT+3fx4DUtlHaivNlN7x3DEApQe9qNGgk5xTWelSddnIpzy9UNQz00GbK05yPTJleje8Jaue1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rWUAZ8QG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b65469a5bso11715485e9.0
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756406178; x=1757010978; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plZI8iRSPLJkfX6UA1rPXxqj9r/osCRLYPnrr8iFbR4=;
        b=rWUAZ8QGhMMvS0akYtK2z5rtavFNN4QLlRoCytrcKoUxwnowVWDAw8Ad1dvgXaKL4B
         2MYK8frV2PEnKDtIBcSNbOfHuvi9rVvVZOxUgM441+awi5yNGoeF+WbQ6V7zsfTvlysW
         3gECyADklaR6TOVs3JG6UJNMutfUjOzs2/yCXnGBniaWvIJq2hQqBx2wI0FsM2NO/Cgr
         omHtjis9ZJhO/oT8l1Oi2MCjz/RVUTfExGleFFT57ihhB0LkvbpD+CoEWm0ATKWJ7pip
         2cUFBI1nJ5wK0U1+xIxjRIMg1Xngfk6Q+/MbaK0UukpOoikVbmFXUOl3gv5cL+E1keG5
         QrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756406178; x=1757010978;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plZI8iRSPLJkfX6UA1rPXxqj9r/osCRLYPnrr8iFbR4=;
        b=t6m9R/e9wZkAJekQMuRQNG1+pNEux9pO+w1zeiTKzgGn375et/BEehXt7crCKGfyp1
         9uWA836wlBbqkwiXcwoSldOWV0fQeqqwW0Y/CttzMRa2NLZLb9WdtxR0WX3YrYZv5BfT
         1EBEqKKdziVQNmaD9KhV5hGotyjgohRS4ihUcVZeJ8CRRSjqjaFl/9MpZqJirPnGOYdW
         b4Zymio39aQmwEAHsTod5yS9HrtbiHRNqMOv6tvdPd6Y1dyeZjr1EPi1/Uws0xdaBKhc
         ja/OFphxXhqsE9YD7OeZ8pqsDiyqlkc1S09J7/sRXnToyyTaIul6R/lw+27R/5v7E+B/
         9BaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRTpY7nZY8IDtMqbo4BEcOJRuJ1ix9vFdElV8VB2I52SaXuPk133d2yTEPyt2eGuuNgf9FFTIkpBlqcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKl+gV2qypPzalrjtHGQjHwVpwrhSZo7cozN2gq8TTyVRS3ura
	IbhAGuIF7uKozxRGcb5jF2nEjw1X56WkFSCI7u8rYrWsi30FkeqirOlcoA6TbQ/W2mJLuoKtUZk
	XF0RY
X-Gm-Gg: ASbGncuV52K8a/6JZpwwQjFAjK/4mQVHE1wh75sQT9aaU6snldaDhaCCAmQkz0bWgSS
	8fF6Ulq/g4uMXzgB6rpUrfJTq93PtQRYlPf76Rs1JlYbtF7z2YSHNH+Wsg0j8nn6rs1UaFsQo1L
	aOcjKY0drrLsFvDV1RZLdUlDpTK54Ip9OcvCGlsG6hc7NXUVkYEpLTCeexRhTzseYs8EvbGeIMS
	7qruydJS/NOHciJUhe0DhBN09CyviPG9zflXdsRZBHBlW5Ad7nmVbUndXEb6LZdUCYJdE/KKrGD
	haZQL9Mahqm565/2dEXwcFBZZxpog9IlJP0IKw6hj6Hk8OEva4TUmWDRvYU01CEFfgCD3hizkZt
	SThifLQb408QfKz+/BtnCXFgQN2PvSBYd5u0NkBYQY3x7L6PDLZYHd9BIwRpelTELVtJl888Y
X-Google-Smtp-Source: AGHT+IGHfFomVo9e9hFrlPBlCkmuNAzoJAz+YrbYrU3TW1g1KlnphdMtRrEL5U16asEEEUzAcjip5g==
X-Received: by 2002:a05:600c:1f12:b0:45b:629b:dc1e with SMTP id 5b1f17b1804b1-45b72ed0730mr46781205e9.1.1756406178218;
        Thu, 28 Aug 2025 11:36:18 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b66cdaaa6sm56782795e9.7.2025.08.28.11.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 11:36:17 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 19:36:17 +0100
Message-Id: <DCEA0YL5MK30.3VV18EAGTGY5O@linaro.com>
To: "Frank Li" <Frank.Li@nxp.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "open list:OMNIVISION OV2680 SENSOR DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "open list" <linux-kernel@vger.kernel.org>
Cc: <imx@lists.linux.dev>
Subject: Re: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use
 unevaluatedProperties for endpoint
References: <20250827194919.82725-1-Frank.Li@nxp.com>
In-Reply-To: <20250827194919.82725-1-Frank.Li@nxp.com>

Hi Frank,
Thanks for the patch.

On Wed Aug 27, 2025 at 8:49 PM WEST, Frank Li wrote:

> The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> additionalProperties with unevaluatedProperties to allow use common
> properties.
>
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port=
:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^p=
inctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yam=
l
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

LGTM.
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml=
 b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> index 634d3b821b8c7..ec5c40684b6bd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> @@ -58,7 +58,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        additionalProperties: false
> +        unevaluatedProperties: false
> =20
>          properties:
>            link-frequencies: true
> --=20
> 2.34.1




