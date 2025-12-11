Return-Path: <linux-media+bounces-48612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1CFCB4A04
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 04:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C104E3019350
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 03:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEFD2C11ED;
	Thu, 11 Dec 2025 03:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjjfE5YX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28A2BE7D2;
	Thu, 11 Dec 2025 03:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765423608; cv=none; b=fJSwe4W+CMTVG09/jtzymyP31b+S4koWgEdDenGJ1iGKSCK9PAyu9wjhBSYWB3u+/kVjv6iq1JOtTC1uj0vhZbL/ahkEJ6t/E52xWxGSZYZk/3BfpLkkC3MX6QhMSe5ckgTYEC5ShXOxqY3EF+zB8qbxMOiuufzXjJBGRsPCf50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765423608; c=relaxed/simple;
	bh=NQD2BB2agYzXemcuGQVl/K3z+EgYt7RFGc+9U3+8j/c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=I3nmAxF9oSQYMeMOEQt39QQ+wNnEO2uBGgIgcqrtFoRuLgdne3U6mnzq8UjwScJSUKnOV9kJyopW36/xbBVum2xQI1gkjzcxf3NpQOjeWyljwxpnPZkHAoHvY7iULxAgB2yKYEpyehU0EWdlWfzD7EHBogqSGcoVNR6n5kay/YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjjfE5YX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36B3C19423;
	Thu, 11 Dec 2025 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765423607;
	bh=NQD2BB2agYzXemcuGQVl/K3z+EgYt7RFGc+9U3+8j/c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NjjfE5YXbUr7QI9Zv6YD1jJAvTlNABTzCQigTFz3yppZOvY/dxJ1szTFizUqeXc/b
	 gDXBVGhQumuMs/NJk0DSA5cUiGTiT6/YcoUbql0ZkKN6C6VleyYEc0of8BhTQ8T34d
	 Qjl4MtUL3O4gNGm9ex+IYlLD/nvrchTeKksisTYsTpnZ0CPyDsFKD2toYxuiSBLg1b
	 7aRKW4AM7Hyx4rxygQm8rT2yK6tlV1ldpjp8rLCf72T44nX2v4GpNSjmFCY8F67SI8
	 FuiifcieAJkdXR11Yvyn5SpJnRpzYVyQ0c2baBg9xwUF3Mn6gzO6R8zIPaYi8WQevP
	 rSHzRwzeUM5Cg==
Date: Wed, 10 Dec 2025 21:26:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Robert Mader <robert.mader@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
In-Reply-To: <20251211014846.16602-2-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-2-mailingradian@gmail.com>
Message-Id: <176542360577.3870756.16103619361508957186.robh@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355


On Wed, 10 Dec 2025 20:48:42 -0500, Richard Acayan wrote:
> The IMX355 camera sensor is a camera sensor that can be found as the
> front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> 3a, and Pixel 3a XL. It already has a driver, but needs support for
> device tree. Document the IMX355 to support defining it in device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/media/i2c/sony,imx355.yaml       | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml: properties:port:properties:endpoint: 'anyOf' conditional failed, one must be fixed:
	'data-lanes' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211014846.16602-2-mailingradian@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


