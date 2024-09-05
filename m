Return-Path: <linux-media+bounces-17641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2696CF8B
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 08:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C19289A8A
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 06:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D28318C354;
	Thu,  5 Sep 2024 06:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f89lTJeW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4418950D;
	Thu,  5 Sep 2024 06:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725518514; cv=none; b=GIk5hLgJAbk1u2wfHQ6b+kx4LOd7U2h3fNdm25y4+7hwrbkeEGiUmANL5jYsNscKiykkjqXYDZAK/+Ln3g1cW2Mr92LUfj4d7TdA23jPVeF9yBhNw3TvI3IMxuzyZrpmJsti0uycUwrA2bL0RX4XXpUyPdBdEXprww9P0Zdy3nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725518514; c=relaxed/simple;
	bh=GyWi3SHv7+gICo/vkZSaYtwIGxkwHjXVRugMXx0AV/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoyXEyw3jfVhdQ5PxO+aMMxgMNgybl7eaUG32uoPivucojRRKFtz2XNhsQ45U1U8PHwnw/t2qj1oOvfX9D1nBZAd2JMiv2D2s+e3kUMKjqg6I4JJme3HneEgxRM5p449MLlGcUPwVZ/FV/vYKxaGnMZpUQHcx1mK9RS1PvL99cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f89lTJeW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F087CC4CEC4;
	Thu,  5 Sep 2024 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725518514;
	bh=GyWi3SHv7+gICo/vkZSaYtwIGxkwHjXVRugMXx0AV/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f89lTJeW+jL7WscKtMeXpedOjIJ6CMHOrjzWvqoNk3e/bbTBBjXzS+w9d2iwFjOe+
	 WYhjHKOaebLkj/WmMjyovl+XM4BcsNCTrrEtjp9urrlM2U9vE/3FAXsqS02Yq7tDN3
	 fRSJqIRL9GFHJ0UkwUKI5NR/MW6jMcBtCAW7P02kgfF0GsYK07dWxpoQ4j0wCIgFyg
	 5v4uVdmeUMZ5slpXfT31i+QlmqSHeyCy6XLQ3GaNYmFTN7aHU0A4d1qthHmFhqXBKh
	 FKOgouNoN3FEOZp5ZIucCO6dG5vcuctDXwC8qUEYiqvTa9AczhjM0/LxnrnU9wzvA2
	 W6/UjJm7Uq5Rw==
Date: Thu, 5 Sep 2024 08:41:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
Message-ID: <64mhzrr4c33uzqacbai2x2c3dekbomezenbmjowwtdtiqt43ad@d6bhvpwabimq>
References: <20240904145238.21099-1-sylvain.petinot@foss.st.com>
 <20240904145238.21099-2-sylvain.petinot@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240904145238.21099-2-sylvain.petinot@foss.st.com>

On Wed, Sep 04, 2024 at 04:52:37PM +0200, Sylvain Petinot wrote:
> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
> sensors. Update MAINTAINERS file.
> 

> +            port {
> +                endpoint {
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <402000000>;
> +                    remote-endpoint = <&csiphy0_ep>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6d77bea5db5..e58deb5b3047 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21561,6 +21561,14 @@ S:	Maintained
>  F:	Documentation/hwmon/stpddc60.rst
>  F:	drivers/hwmon/pmbus/stpddc60.c
>  
> +ST VD56G3 IMAGE SENSOR DRIVER
> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/st,vd56g3.yaml
> +F:	drivers/media/i2c/vd56g3.c

There is no such file.


> +
>  ST VGXY61 DRIVER
>  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> @@ -23947,6 +23955,7 @@ F:	drivers/media/i2c/mt*
>  F:	drivers/media/i2c/og*
>  F:	drivers/media/i2c/ov*
>  F:	drivers/media/i2c/s5*
> +F:	drivers/media/i2c/vd56g3.c

Neither this one.

After fixing the paths:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

