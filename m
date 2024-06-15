Return-Path: <linux-media+bounces-13295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2C9095D5
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 05:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D3428457B
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 03:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7104FBE68;
	Sat, 15 Jun 2024 03:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fufHqMUN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501B10F7;
	Sat, 15 Jun 2024 03:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718421359; cv=none; b=h3juUpVMXVUld23QvBoWzzohg1+NlxmZaszg084lTVzXR1jEZedRC2DsUFHy9L+Jwr/GCfPZUeRwZY/ht0q+wMq2xoEzVj3KZ9mbb7GFlhhy6coqZ/QtA6p+MtjXKDbAne00ZuUIgZdeOnx2TWnT3NQYkSZG6wkiPa3Q1UfYJhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718421359; c=relaxed/simple;
	bh=YLAQKIAnX3QMVP03+hq3W1LYE+KdzSFfVIBax3SmWnw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ZjAKPr8y3cEfCZrnRJNKiSadFYh0fe4dowIKNMsyjIo84tmr2r0LcyDovZKWX6nXFlXbtbILTLhpekiqrGvP6QAhg9c6IsfI8wXz+Zit81xWl2rJpRHCELD5uTvUzjJ8fbQR4ngasCBJOv6FH9fDKVLnbKYO9iKc2W8/L94jN5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fufHqMUN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E22C2BD10;
	Sat, 15 Jun 2024 03:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718421359;
	bh=YLAQKIAnX3QMVP03+hq3W1LYE+KdzSFfVIBax3SmWnw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=fufHqMUNUJVqYWeGSnEY3L2GyzfFt9r1rIGoyLTMphbZMcfWeBW2zaOKKF2McoWwt
	 ic/QLRbSIwkLviUB85ZJyevRAK2RiWI6t3CKPO1EbhcDJYvPPs5JeZOcSlCoVJFGqJ
	 MCZxZkoFNsc2qrawuTFAKzWafMjcBvB6oy6hFvKDKmKeHNb4DlQtJZTdqZ3JD670LC
	 EjuIpuRmx+o9j7IdolP7nLbcKyBF4z/OloteTC0yYA7gqTQjw5YfNdNa6vn7jhP6CK
	 WJoAVn1q5nbwqz/I6T0tz9jaerJVtrOn5+0S46wDGtACdgErB5yYtrvK3qj3r+1JQD
	 ez6U/NLONQ7BA==
Date: Fri, 14 Jun 2024 21:15:58 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Diederik de Haas <didi.debian@cknow.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, Alexey Charkov <alchark@gmail.com>, 
 linux-media@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>
In-Reply-To: <20240615015734.1612108-3-detlev.casanova@collabora.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-3-detlev.casanova@collabora.com>
Message-Id: <171842135800.2249604.16144745633066075384.robh@kernel.org>
Subject: Re: [PATCH 2/3] media: dt-bindings: rockchip: Document RK3588
 Video Decoder 2 bindings


On Fri, 14 Jun 2024 21:56:28 -0400, Detlev Casanova wrote:
> Document the Rockchip RK3588 Video Decoder 2 bindings.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../bindings/media/rockchip,vdec2.yaml        | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,vdec2.example.dtb: video-codec@fdc38100: reg: [[0, 4257448192], [0, 1280]] is too long
	from schema $id: http://devicetree.org/schemas/media/rockchip,vdec2.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip,vdec2.example.dtb: video-codec@fdc38100: clock-names:1: 'ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/rockchip,vdec2.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240615015734.1612108-3-detlev.casanova@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


