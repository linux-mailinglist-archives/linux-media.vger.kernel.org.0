Return-Path: <linux-media+bounces-4526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81621844720
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 19:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B264B233FD
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 18:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58221134723;
	Wed, 31 Jan 2024 18:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ez8dc2DQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9E12CDB8;
	Wed, 31 Jan 2024 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706725713; cv=none; b=TcYaza88DAiwegvLS2HqtD3bfi2f34nDGZ6+H2YVjUF7jxcLsCGZ6zluUCTcGZ97ojBeEpbedsz8vm21IaXzyLbQKXzh2MCgbiIEHoafS/yrISCzjgJAmwUos6TdaOm/SNnrXgcJb15DZIjE2/j9o9d5bsBRw0mLnDTL7YGCBQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706725713; c=relaxed/simple;
	bh=uXD9wXZPbD3tGfe7h6pADwvjVjqmPIcprSb0bb+khfQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=RhuwTABGCM9f7Ro08YZhf6rYcE4Da1Q1bjjgnoFYmC+VUd3NtKo3oINQvTOHJKqn4g+CQDcQ9duK1FzHkW4w5czsv4+TcZ6fuPr4UysukWHDOjZ9hVd9bmNo+HH4TkqydYfllpzAfPhwFZatMbLbw00K5lpW797NBXemMVbAdw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ez8dc2DQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92F7C433C7;
	Wed, 31 Jan 2024 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706725713;
	bh=uXD9wXZPbD3tGfe7h6pADwvjVjqmPIcprSb0bb+khfQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ez8dc2DQA4rxE8PejR6GPQpMNZg/Z/bCV9J7M8YvyDyklu5F7V9Z5Ugqx+l1aPssC
	 Eu8pa8gT8n3ISoUKX2jQKDZNILb7WTw073ganRvq6dGnWS6QfoOkbUr/j/VEONRrDM
	 dnif7aBshwLw5umOwPYoKb6rrYPibHVsfrLH3Vz9D9OzgtULi/hhZ6sWxVUsPEbfTA
	 UW+Z77peIoKEafNuQBeR0nTyJng/aL2QVFKTAAZW/wpd7UyN9+jniDPn5yOLCBZBVP
	 ebh950XasjzGSO3BfSKTQIf6pbIbn7kmydJaOHvvtzVIzhEifPKsMJ18YN3uGE0Rmy
	 2T8MJEQeio7xw==
Date: Wed, 31 Jan 2024 12:28:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, nayden.kanchev@arm.com, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, 
 jerome.forissier@linaro.org, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, robh+dt@kernel.org
In-Reply-To: <20240131164709.810587-3-dan.scally@ideasonboard.com>
References: <20240131164709.810587-1-dan.scally@ideasonboard.com>
 <20240131164709.810587-3-dan.scally@ideasonboard.com>
Message-Id: <170672571070.2062253.5359379478215022864.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: media: Add bindings for ARM mali-c55


On Wed, 31 Jan 2024 16:47:06 +0000, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  .../bindings/media/arm,mali-c55.yaml          | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/arm,mali-c55.example.dts:29.18-33.13: Warning (unit_address_vs_reg): /example-0/isp@400000/port@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/media/arm,mali-c55.example.dts:30.32-32.15: Warning (unit_address_vs_reg): /example-0/isp@400000/port@0/endpoint@0: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/arm,mali-c55.example.dtb: isp@400000: 'port' is a required property
	from schema $id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/arm,mali-c55.example.dtb: isp@400000: 'port@0' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240131164709.810587-3-dan.scally@ideasonboard.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


